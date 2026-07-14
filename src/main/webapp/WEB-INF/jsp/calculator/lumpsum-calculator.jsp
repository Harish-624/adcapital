<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

var lumpsum_amount = "";
var years = "";
var expected_return = "";
var accountMap = "";
var future_value_amount = 0;
$(document).ready(function(){
	
	lumpsum_amount = '${lumpsum_amount}';
	years = '${years}';
	expected_return = '${expected_return}';
	
	dream_amount = parseFloat(lumpsum_amount);
	years = parseInt(years);
	rateofReturn = parseFloat(expected_return);
	
	$('#amount').val(numbersWithComma(dream_amount));
	$('#years').val(years);
	$('#interest').val(rateofReturn);
	
	accountMap = '${accountMap}';
	
	$("#amount_slider").slider({
	    min: 0,
	    max: 1000000000,
        tooltip: "show",
        step: 1,
        precision: 0,
        value: dream_amount
	}).on("slideStop", function(slideEvt) {		
		$("#amount").val(numbersWithComma(slideEvt.value));
		lumpsumAmountCalculator();
	});
	
	$("#years_slider").slider({
	    min: 10,
	    max: 100,
        tooltip: "show",
        step: 1,
        precision: 0,
        value: years
	}).on("slideStop", function(slideEvt) {
		$("#years").val(slideEvt.value);
		lumpsumAmountCalculator();
	});
	
	$("#interest_slider").slider({
		min: 0,
        max: 50,
        tooltip: "show",
        step: 0.1,
        precision: 1,
        value: rateofReturn
	}).on("slideStop", function(slideEvt) {
		$("#interest").val(slideEvt.value.toFixed(1));
		lumpsumAmountCalculator();
	});
	
	$("#top_up_slider").slider({
	    min: 0,
	    max: 100,
        tooltip: "show",
        step: 1,
        precision: 0,
        value: 10
	}).on("slideStop", function(slideEvt) {
		$("#top_up_percentage").val(slideEvt.value);
		lumpsumAmountCalculator();
	});
	
	lumpsumAmountCalculator();	
});

function amountChange()
{
	var amount = $('#amount').val();
	amount = amount.replace(/,/g,'');
	$( "#amount_slider" ).slider("setValue",amount);
	$('#amount').val(numbersWithComma(amount));
	lumpsumAmountCalculator();
}
function yearsChange()
{
	var years = $('#years').val();
	$( "#years_slider" ).slider("setValue",years);
	lumpsumAmountCalculator();
}
function interestChange()
{
	var interest = $('#interest').val();
	$( "#interest_slider" ).slider("setValue",interest);
	lumpsumAmountCalculator();
}
function topUpChange()
{
	var top_up = $('#top_up_percentage').val();
	$( "#top_up_slider" ).slider("setValue", top_up);
	monthlySavingsAmount();
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
function lumpsumAmountCalculator()
{
	var years = $('#years').val();
	var present_amount = $('#amount').val();
	var rateofReturn = $('#interest').val();
	
	present_amount = present_amount.replace(/,/g,'');

	if(isNaN(years))
	{
		alert("Please enter valid value for years.");
		return;
	}
	
	dream_amount = parseFloat(present_amount);
	rateofReturn = parseFloat(rateofReturn);
	years = parseInt(years);
	
	
	$.ajaxSetup({async:false});
	$.post("/tools-and-calculators/getLumpsumCalcResult", {lumpsum_amount : "" + dream_amount + "",years : "" + years + "",expected_return : "" + rateofReturn + ""}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status == 400)
		{
			alert(obj.msg);
			return false;
		}
		future_value_amount = obj.future_amount;
    },'text');
	
	$('#res_lumpsum_amount').html(numbersWithComma(present_amount));
	$('#res_years').html(years);
	$('#res_future_amount').html(numbersWithComma(future_value_amount));
	
	renderChart(present_amount, future_value_amount);
}

function renderChart(amount, total_interest)
{
	amount = parseFloat(amount);
	total_interest = parseFloat(total_interest);
	
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
              ['Amount Invested', amount],
              {
                  name: 'Total Growth',
                  y: total_interest,
                  sliced: true,
                  selected: true
              }
          ]
      }]
  });
}

function downloadResult()
{
	var amount = $('#amount').val();
	var years = $('#years').val();
	var interest = $('#interest').val();
	
	var res_amount = $( "#res_amount" ).html();
	var res_years = $( "#res_years" ).html();
	var res_future_amount = $( "#res_future_amount" ).html();
	
	var calc_url = window.location.href;
	
	
	var param = "?amount="+amount+"&years="+years+"&interest="+interest;
	param += "&res_amount="+res_amount+"&res_years="+res_years+"&res_future_amount="+res_future_amount+"&url="+calc_url;
		
		var url = '<c:url value="/tools-and-calculators/downloadLumpsumCalcResult" />'+param;
		window.location = url;
		
		$('#send_email_model').modal('hide');
        setTimeout(function(){
        	swal({title:"",text:"Thanks for the Download."});
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
    <h1>Lumpsum Investment Calculator</h1>
    <p>Estimate the future value of a one-time investment based on your expected rate of return.</p>
  </div>
</section>


<section class="bg-light" id="toolaAndCalculators" style="position:relative; z-index:1;">
	<div class="container py-5">
		<div class="col-md-12">
			<div class="row align-items-center mb-5 sr-section">
				<div class="col-sm-8">
					<h3 style="font-weight:700; color:#1a1f2e;">Lumpsum Investment Calculator</h3>
					<p style="color:#4b5563;">Maximize your wealth with our Lumpsum Investment Calculator! This tool helps you estimate the future value of a one-time investment based on your chosen investment period and expected rate of return.</p>
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
							
								<p class="m-0 pb-2 fw-bold text-dark">How much lumpsum amount you want to invest (Rs)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="50000" id="amount" maxlength="16" onchange="amountChange()"  />
								</p>
								
								<p class="m-0">
									<div id="amount_slider" style="margin:0px;"></div>
									<div class="steps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">25 cr</span></span><span style="left:50%;" class="tick">|<br />
										<span class="marker">50 cr</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">75 cr</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">100 cr</span></span>
									</div>
								</p>
							</div>
						</div>
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.2s">
						   <div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">How many years after you need this amount (Years)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="30" id="years" maxlength="3" onchange="yearsChange()"/>
								</p>
								
								<p class="m-0">
									<div id="years_slider" style="margin:0px;"></div>
									<div class="steps" id="loantermsteps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">10</span></span><span style="left: 16.66%;" class="tick">|<br />
										<span class="marker">25</span></span><span style="left: 44.44%;" class="tick">|<br />
										<span class="marker">50</span></span><span style="left: 72.22%;" class="tick">|<br />
										<span class="marker">75</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">100</span></span>
									</div>
								</p>
							</div>
						</div>
						
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.3s">
							<div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">Expected rate of return (% per annum)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="12" id="interest" maxlength="4" onchange="interestChange()" />
								</p>
								
								<p class="m-0">
									<div id="interest_slider" style="margin:0px;"></div>
									<div class="steps" id="loantermsteps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">12.5</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">25</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">37.5</span></span><span style="left: 100%" class="tick">|<br />
										<span class="marker">50</span></span>
										
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
										<span class="text-white-50 p mb-2">Your Lumpsum Amount</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_lumpsum_amount"></span></p>
									</div>
								</li>
							   <li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Number of years to achieve your goal</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold"> <span id="res_years"></span> Years</p>
									</div>
								</li>
								<li class="list-group-item bg-transparent border-0">
									<div class="row">
										<span class="text-white-50 p mb-2">Your Future Amount</span>
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




