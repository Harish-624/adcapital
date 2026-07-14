<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">

var current_cost = "";
var inflation_rate = "";
var no_years = "";
var accountMap = "";
var future_amount = 0;

$(document).ready(function(){
	
	current_cost = '${current_cost}';
	inflation_rate = '${inflation_rate}';
	no_years = '${no_years}';
	
	current_amount = parseInt(current_cost);
	inflation = parseFloat(inflation_rate,10);
	year = parseInt(no_years);
	
	$('#current_amount').val(numbersWithComma(current_amount));
	$('#inflation').val(inflation);
	$('#year').val(year);
	
	accountMap = '${accountMap}';	
	
	$("#current_amount_slider").slider({
	    min: 100000,
	    max: 100000000,
        tooltip: "show",
        step: 1,
        precision: 0,
        value: current_amount
	}).on("slideStop", function(slideEvt) {		
		$("#current_amount").val(numbersWithComma(slideEvt.value));
		calculateFutureValue();
	});
	
	$("#inflation_slider").slider({
	    min: 0,
	    max: 20,
        tooltip: "show",
        step: 0.1,
        value: inflation,
        precision: 0.1,
	}).on("slideStop", function(slideEvt) {
		$("#inflation").val(slideEvt.value.toFixed(1));
		calculateFutureValue();
	});
	
	$("#year_slider").slider({
	    min: 0,
	    max: 30,
        tooltip: "show",
        step: 1,
        precision: 0,
        value: year
	}).on("slideStop", function(slideEvt) {
		$("#year").val(slideEvt.value);
		calculateFutureValue();
	});
	
	calculateFutureValue();
	
});

function currentAmountChange()
{
	var current_amount = $('#current_amount').val();
	current_amount = current_amount.replace(/,/g,'');
	$("#current_amount_slider").slider("setValue",current_amount);
	calculateFutureValue();
}
function inflationChange()
{
	var inflation = $('#inflation').val();
	$("#inflation_slider").slider("setValue",inflation);
	calculateFutureValue();
}
function yearChange()
{
	var year = $('#year').val();
	$("#year_slider").slider("setValue",year);
	calculateFutureValue();
}
function numbersWithComma(x) 
{
	x = x.toString();
	var afterPoint = '';
	if(x.indexOf('.') > 0)
	   afterPoint = x.substring(x.indexOf('.'),x.length);
	x = Math.floor(x);
	x = x.toString();
	var lastThree = x.substring(x.length-3);
	var otherNumbers = x.substring(0,x.length-3);
	if(otherNumbers != '')
	    lastThree = ',' + lastThree;
	var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
	return res;
}
function calculateFutureValue()
{
	var current_amount = $('#current_amount').val();
	var inflation = $('#inflation').val();
	var year = $('#year').val();
	
	current_amount = current_amount.replace(/,/g,'');

	if(isNaN(year))
	{
		alert("Please enter valid value for years.");
		return;
	}
	
	current_amount = parseInt(current_amount);
	inflation = parseFloat(inflation,10);
	year = parseInt(year);


	
	$.ajaxSetup({async:false});
	$.post("/tools-and-calculators/getFutureValueCalcResult", {current_cost : "" + current_amount + "",inflation_rate : "" + inflation + "",no_years : "" + year + ""}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status == 400)
		{
			alert(obj.msg);
			return false;
		}
		
		future_amount = obj.future_amount;
		
    },'text');
	
	$('#res_current_amount').html(numbersWithComma(current_amount));
	$('#res_inflation').html(inflation);
	$('#res_year').html(year);
	$('#res_future_amount').html(numbersWithComma(future_amount));
	renderChart(current_amount,future_amount);
}

function renderChart(current_amount,future_amount)
{
	current_amount = parseFloat(current_amount);
	future_amount = parseFloat(future_amount);
	
	$('#emipiechart').highcharts({colors: ['#009899','#51cdce', '#FF8900', '#DDDF00', '#24CBE5', '#64E572','#FF9655', '#FFF263', '#6AF9C4'],
      chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false
      },
      title: {
          text: ''
      },
      legend: {
          borderWidth: 1,
          borderRadius: 5,
      },
      credits: {
          enabled: false
      },
      tooltip: {
  	    pointFormat: '{point.percentage:.1f}%'
      },
      plotOptions: {
          pie: {
              allowPointSelect: true,
              cursor: 'pointer',
              dataLabels: {
                  enabled: false,
                  color: '#000000',
                  connectorColor: '#000000',
                  format: '<b>{point.name}</b>: {point.percentage:.1f} %'
              },
              showInLegend: true
          }
      },
      series: [{
          type: 'pie',
          data: [
              ['Current Cost', current_amount],
              {
                  name: 'Future Cost',
                  y: future_amount,
                  sliced: true,
                  selected: true
              }
          ]
      }]
  });
}

function downloadResult()
{
	
	var current_amount = $('#current_amount').val();
	var inflation = $('#inflation').val();
	var year = $('#year').val();
	

	var res_current_amount = $( "#res_current_amount" ).html();
	var res_inflation = $( "#res_inflation" ).html();
	var res_year = $( "#res_year" ).html();
	var res_future_amount = $( "#res_future_amount" ).html();
	
	var calc_url = window.location.href;
	
	var param = "?current_amount="+current_amount+"&inflation="+inflation+"&year="+year;
	param += "&res_current_amount="+res_current_amount+"&res_inflation="+res_inflation+"&res_year="+res_year+"&res_future_amount="+res_future_amount+"&url="+calc_url;
	
	var url = '<c:url value="/tools-and-calculators/downloadFutureValueCalcResult" />'+param;
	window.location = url;
	
	$('#send_email_model').modal('hide');
       setTimeout(function(){
       	swal({title:"",text:"Thanks for the Download."});
   	},1000);
	
}
function downloadResult()
{
	var current_amount = $('#current_amount').val();
	var inflation = $('#inflation').val();
	var year = $('#year').val();

	var res_current_amount = $( "#res_current_amount" ).html();
	var res_inflation = $( "#res_inflation" ).html();
	var res_year = $( "#res_year" ).html();
	var res_future_amount = $( "#res_future_amount" ).html();
	
	//current_amount = numbersWithComma(current_amount);
	var calc_url = window.location.href;
	

	var param = "?current_amount="+current_amount+"&inflation="+inflation+"&year="+year;
	param += "&res_current_amount="+res_current_amount+"&res_inflation="+res_inflation+"&res_year="+res_year+"&res_future_amount="+res_future_amount+"&url="+calc_url;
	
	var url = '<c:url value="/tools-and-calculators/downloadFutureValueCalcResult" />'+param;
	window.location = url;
	
	$('#send_email_model').modal('hide');
    setTimeout(function(){
    	 $("#adv-alert-msg").html("Thanks for download.");
    	 $("#adv-alert").modal('show');
	},1000);
	

}
</script>

<style>
  /* ── Premium Hero Section ─────────────────────────────── */
  .premium-calculator-hero {
    background: linear-gradient(135deg, #f8f9fa 0%, #eef1f6 100%);
    padding: 160px 0 80px;
    position: relative;
    overflow: hidden;
    border-bottom: 1px solid rgba(0, 152, 153, 0.05);
  }
  .premium-calculator-hero::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -20%;
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(0, 152, 153, 0.04) 0%, transparent 60%);
    border-radius: 50%;
    pointer-events: none;
  }
  .hero-label {
    display: inline-block;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: #009899;
    margin-bottom: 20px;
  }
  .premium-calculator-hero h1 {
    color: #1a1f2e;
    font-size: 2.8rem;
    font-weight: 700;
    margin-bottom: 15px;
    letter-spacing: -0.02em;
  }
  .premium-calculator-hero p {
    color: #4b5563;
    font-size: 1.1rem;
    line-height: 1.7;
    max-width: 600px;
    margin: 0 auto;
  }
  
  /* ── Premium Cards ─────────────────────────────── */
  .premium-glass-card {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    border-radius: 24px;
    border: 1px solid rgba(255,255,255,0.6);
    box-shadow: 0 15px 35px rgba(0,0,0,0.03), 0 5px 15px rgba(0,0,0,0.02);
    overflow: hidden;
    transition: transform 0.3s ease;
  }
  .premium-glass-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 20px 40px rgba(0,152,153,0.08);
  }
  
  /* Result Card Teal Gradient */
  .premium-result-card {
    background: linear-gradient(135deg, #009899 0%, #007A7A 100%);
    border-radius: 24px;
    color: #ffffff;
    box-shadow: 0 20px 40px rgba(0,152,153,0.2);
    border: none;
    overflow: hidden;
  }
  .premium-result-card .list-group-item {
    border-color: rgba(255,255,255,0.1);
  }
  .premium-result-card .text-muted, 
  .premium-result-card .text-theme-primary {
    color: rgba(255,255,255,0.85) !important;
  }
  .premium-result-card h6 {
    color: #ffffff;
    font-size: 1.25rem;
  }
  
  /* Inputs */
  .premium-calc-input {
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    padding: 12px 20px;
    font-size: 1.1rem;
    font-weight: 600;
    color: #1a1f2e;
    background: #f9fafb;
    transition: all 0.2s;
  }
  .premium-calc-input:focus {
    background: #fff;
    border-color: #009899;
    box-shadow: 0 0 0 4px rgba(0,152,153,0.1);
    outline: none;
  }
  
  .premium-chart-card {
    background: #fff;
    border-radius: 24px;
    border: 1px solid #f3f4f6;
    box-shadow: 0 10px 30px rgba(0,0,0,0.03);
    overflow: hidden;
  }
</style>

<section class="premium-calculator-hero text-center">
  <div class="container">
    <div class="hero-label">Tools &amp; Calculators</div>
    <h1>Future Value Calculator</h1>
    <p>Estimate the future cost of any expense or investment based on expected inflation.</p>
  </div>
</section>


<section class="bg-light" id="toolaAndCalculators" style="position:relative; z-index:1;">
	<div class="container py-5">
		<div class="col-md-12">
			<div class="row align-items-center mb-5 sr-section">
				<div class="col-sm-8">
					<h3 style="font-weight:700; color:#1a1f2e;">Future Value Calculator</h3>
					<p style="color:#4b5563;">Wondering how inflation affects your future expenses? Our Future Value Calculator helps you estimate the future cost of any expense or investment based on the current cost, expected inflation rate, and time period.</p>
				</div>
				<div class="col-sm-4 text-end">
					<a href="javascript:void(0);" class="btn rounded-pill px-4 py-2 text-white" tabindex="0" onclick="downloadResult()" style="background:#009899; border:none; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">
                      <i class="fa fa-download me-2"></i> Download
                    </a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7">
					<div class="row calculator">
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.1s">
							<div class="premium-glass-card p-4 pb-0">
							
								<p class="m-0 pb-2 fw-bold text-dark">Current Cost (Rs)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="2500000" id="current_amount" maxlength="9" onchange="currentAmountChange()"/>
								</p>
								
								<p class="m-0">
									<div id="current_amount_slider" style="margin:0px;"></div>
									<div class="steps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">1 Lakh</span></span><span style="left: 24.8%;" class="tick">|<br />
										<span class="marker">2.5 Crores</span></span><span style="left: 49.8%;" class="tick">|<br />
										<span class="marker">5 Crores</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">7.5 Crores</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">10 Crores</span></span>
									</div>
								</p>
							</div>
						</div>
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.2s">
						   <div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">Inflation (% per annum)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="6" id="inflation" maxlength="4" onchange="inflationChange()" />
								</p>
								
								<p class="m-0">
									<div id="inflation_slider" style="margin:0px;"></div>
									<div class="steps" id="loantermsteps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 24.66%" class="tick">|<br />
										<span class="marker">5</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">10</span></span><span style="left:75%;" class="tick">|<br />
										<span class="marker">15</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">20</span></span>
									</div>
								</p>
							</div>
						</div>
						
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.3s">
							<div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">Number of Years</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="10" id="year" maxlength="2" onchange="yearChange()"/>
								</p>
								
								<p class="m-0">
									<div id="year_slider" style="margin:0px;"></div>
									<div class="steps" id="loantermsteps">
										<div style="left: 0%;" class="tick">|<br /> <span class="marker">0</span></div>
										<div style="left: 16.4%;" class="tick">|<br /> <span class="marker">5</span></div>
										<div style="left: 33.1%;" class="tick">|<br /> <span class="marker">10</span></div>
										<div style="left: 50%;" class="tick">|<br /> <span class="marker">15</span></div>
										<div style="left: 66.6%;" class="tick">|<br /> <span class="marker">20</span></div>
										<div style="left: 83.3%;" class="tick">|<br /> <span class="marker">25</span></div>
										<div style="left: 100%;" class="tick">|<br /> <span class="marker">30</span></div>
									</div>
								</p>
							</div>
						</div>
						
					</div>
				</div>
				<div class="col-md-5 my-3">
					<div class="row pb-4 sr-section" data-sr-reveal-delay="0.1s"> 
						<div class="col-sm-12">
							<div class="premium-chart-card p-4 pb-0">
								<div id="emipiechart"></div>
							</div>
						</div>
					</div>
					<div class="card mb-5 text-center premium-result-card sr-child" data-sr-reveal-delay="0.3s">
						<div class="card-body p-4">
							<ul class="list-group list-group-flush">
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Current Cost</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_current_amount"></span></p>
									</div>
								</li>
							   <li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Inflation (% per annum)</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold"><span id="res_inflation"></span>%</p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Number of Years</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold"><span id="res_year"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent border-0">
									<div class="row">
										<span class="text-white-50 p mb-2">Future Cost</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_future_amount"></span></p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>