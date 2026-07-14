<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

var sip_amount = "";
var interest_rate = "";
var period = "";
var sip_stepup_value = "";
var accountMap = "";

$(document).ready(function(){

	sip_amount = '${sip_amount}';
	interest_rate = '${interest_rate}';
	period = '${period}';
	sip_stepup_value = '${sip_stepup_value}';
	
	sipAmount = parseInt(sip_amount);
	rateofReturn = parseFloat(interest_rate);
	sipMonth = parseInt(period);
	sipstepup = parseInt(sip_stepup_value);
	
	$('#sipamount').val(numbersWithComma(sipAmount));
	$('#sipinterest').val(rateofReturn);
	$('#sipmonth').val(sipMonth);
	$('#sipstepup').val(sipstepup);
	
	accountMap = '${accountMap}';	
	
	$("#amount_slider").slider({
        min: 0,
        max: 1000000000,
        tooltip: "hide",
        step: 1,
        precision: 0,
        value: sipAmount
	}).on("slideStop", function(slideEvt) {
		$("#sipamount").val(numbersWithComma(slideEvt.value));
		calculateSIP();
	});
	
	$("#month_slider").slider({
        min: 0,
        max: 450,
        tooltip: "hide",
        step: 1,
        precision: 0,
        value: sipMonth
	}).on("slideStop", function(slideEvt) {
		$("#sipmonth").val(slideEvt.value);
		calculateSIP();
	});
	
	$("#interest_slider").slider({
        min: 0,
        max: 50,
        tooltip: "hide",
        step: 0.1,
        precision: 1,
        value: rateofReturn
	}).on("slideStop", function(slideEvt) {
		var value = slideEvt.value;
		value = Math.round(value * 100) / 100;
		$( "#sipinterest" ).val(value);
		calculateSIP();
	});
	
	$("#stepup_slider").slider({
        min: 0,
        max: 60,
        tooltip: "hide",
        step: 1,
        precision: 0,
        value: sipstepup
	}).on("slideStop", function(slideEvt) {
		var value = slideEvt.value;
		value = Math.round(value * 100) / 100;
		$( "#sipstepup" ).val(value);
		calculateSIP();
	});
	
	$('input.number').change(function() {
		$(this).val(function(index, value) {
			value = value.replace(/,/g,'');
		    return numbersWithComma(value);
		});
	});

	calculateSIP();
	
});

function amountChange()
{
	var amount = $('#sipamount').val();
	amount = amount.replace(/,/g,'');
	$( "#amount_slider" ).slider("setValue",amount);
	calculateSIP();
}
function interestChange()
{
	var interest = $('#sipinterest').val();
	$( "#interest_slider" ).slider("setValue",interest);
	calculateSIP();
}
function stepUpChange()
{
	var stepup = $('#sipstepup').val();
	$( "#stepup_slider" ).slider("setValue",stepup);
	calculateSIP();
}
function monthChange()
{
	var month = $('#sipmonth').val();
	$( "#month_slider" ).slider("setValue", month);
	calculateSIP();
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
/* var sipAmount = 0;
var rateofReturn = 0;
var sipMonth = 0;
var sipstepup = 0; */

function calculateSIP()
{
	var sipAmount = $('#sipamount').val();
	var rateofReturn = $('#sipinterest').val();
	var sipMonth = $('#sipmonth').val();
	var sipstepup = $('#sipstepup').val();
	
	sipAmount = sipAmount.replace(/,/g, "");
	
	sipAmount = parseInt(sipAmount);
	sipMonth = parseInt(sipMonth);
	rateofReturn = parseFloat(rateofReturn,10);
	sipstepup = parseFloat(sipstepup,10);

	var invested_amount = 0;
	var growth_value = 0;
	var maturity_amount = 0;
	var stepup_invested_amount = 0;
	var stepup_growth_value = 0;
	var stepup_maturity_amount = 0;
	var html = "";
    html += '<table class="table table-striped table-bordered"><thead><tr><th>Year</th><th style="text-align:right;">SIP Amount / Month</th><th style="text-align:right;">Invested Amount / Year</th><th style="text-align:right;">Total Invested Amount</th></tr></thead><tbody>';
	
	$.ajaxSetup({async:false});
	$.post("/tools-and-calculators/getSIPCalcStepUpResult", {sip_amount : "" + sipAmount + "",interest_rate : "" + rateofReturn + "",period : "" + sipMonth + "",sip_stepup_value : "" + sipstepup + ""}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status == 400)
		{
			alert(obj.msg);
			return false;
		}
		
		invested_amount = obj.invested_amount;
		growth_value = obj.growth_value;
		maturity_amount = obj.maturity_amount;
		stepup_invested_amount = obj.stepup_invested_amount;
		stepup_growth_value = obj.stepup_growth_value;
		stepup_maturity_amount = obj.stepup_maturity_amount;
		var list = obj.list;
		var array = $.makeArray(list);
		
		for(var k=0;k<array.length;k++)
		{
			var year = array[k].year;
			var sip_amount_per_month = array[k].sip_amount_per_month;
			var invested_amount_per_year = array[k].invested_amount_per_year;
			var total_invested_amount = array[k].total_invested_amount;
			
			html += '<tr><td>'+year+'</td><td style="text-align:right;">'+numbersWithComma(sip_amount_per_month)+'</td><td style="text-align:right;">'+numbersWithComma(invested_amount_per_year)+'</td><td style="text-align:right;">'+numbersWithComma(total_invested_amount)+'</td></tr>';
		}
		
    },'text');
	
	html += '</tbody></table>';
	
    $('#res_amount_invest').html(numbersWithComma(invested_amount));
    $('#res_total_interest').html(numbersWithComma(growth_value));
	$('#res_total_amount').html(numbersWithComma(maturity_amount));
	
	$('#res_amount_invest_stepup').html(numbersWithComma(stepup_invested_amount));
    $('#res_total_interest_stepup').html(numbersWithComma(stepup_growth_value));
	$('#res_total_amount_stepup').html(numbersWithComma(stepup_maturity_amount));
	$('#summary_div').html(html);
	
 	renderChart(invested_amount, growth_value); 

}
function downloadResult()
{	
	var sipAmount = $('#sipamount').val();
	var rateofReturn = $('#sipinterest').val();
	var sipMonth = $('#sipmonth').val();
	var sipstepup = $('#sipstepup').val();
	
	var invested_amount = $('#res_amount_invest').html();
	var growth_value = $('#res_total_interest').html();
	var maturity_amount = $('#res_total_amount').html();
	var stepup_invested_amount = $('#res_amount_invest_stepup').html();
	var stepup_growth_value = $('#res_total_interest_stepup').html();
	var stepup_maturity_amount = $('#res_total_amount_stepup').html();
/* 	alert("sipAmount = " + sipAmount);
	alert("invested_amount = " + invested_amount);
	alert("growth_value = " + growth_value);
	alert("maturity_amount = " + maturity_amount); */

	
	console.log("sipAmount = " + sipAmount);
	console.log("invested_amount = " + invested_amount);
	console.log("growth_value = " + growth_value);
	console.log("maturity_amount = " + maturity_amount);
	
	var calc_url = window.location.href;

    var param = "?sipAmount="+sipAmount+"&rateofReturn="+rateofReturn+"&sipMonth="+sipMonth+"&sipstepup="+sipstepup;
	param += "&invested_amount="+invested_amount+"&growth_value="+growth_value+"&maturity_amount="+maturity_amount+"&stepup_invested_amount="+stepup_invested_amount+"&stepup_growth_value="+stepup_growth_value+"&stepup_maturity_amount="+stepup_maturity_amount+"&url="+calc_url;
	
	var url = '/tools-and-calculators/downloadSIPStepUpCalcResult'+param;
	window.location = url;

       setTimeout(function(){
    	   swal({title:"",text:"Thanks for the Download."});
   	},1000);
}
function renderChart(amount,total_interest)
{
	amount = parseFloat(amount);
	total_interest = parseFloat(total_interest);
	
	$('#emipiechart').highcharts({
		colors: ['#025b5c', '#51cdce', '#FF8900', '#DDDF00', '#24CBE5', '#64E572', 
		       '#FF9655', '#FFF263', '#6AF9C4'],
      chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false
      },
      title: {
          text: ''
      },
      tooltip: {
  	    pointFormat: '{point.percentage:.1f}%'
      },
      legend: {
          borderWidth: 1,
          borderRadius: 5,
      },
      credits: {
          enabled: false
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
              ['Total SIP Amount Invested', amount],
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
    <h1>SIP Step Up Calculator</h1>
    <p>Estimate the future value of your investments when you increase your SIP amount annually.</p>
  </div>
</section>


<section class="bg-light" id="toolaAndCalculators" style="position:relative; z-index:1;">
	<div class="container py-5">
		<div class="col-md-12">
			<div class="row align-items-center mb-5 sr-section">
				<div class="col-sm-8">
					<h3 style="font-weight:700; color:#1a1f2e;">SIP with Annual Step-Up Calculator</h3>
					<p style="color:#4b5563;">Invest smarter with our SIP with Step-Up Calculator! This tool helps you estimate the future value of your investments when you increase your SIP amount annually. By stepping up your contributions each year, you can accelerate wealth creation and stay ahead of inflation.</p>
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
								<p class="m-0 pb-2 fw-bold text-dark">
									How much you can invest through monthly SIP? (Rs)
								</p>
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="25000" id="sipamount" maxlength="16" onchange="amountChange()" />
								</p>
								<p class="m-0">
									<div id="amount_slider" style="margin:0px;"></div>
									<div class="steps" id="loanamountsteps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">25cr</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">50cr</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">75cr</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">100 cr</span></span>
									</div>
								</p>
							</div>
						</div>
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.2s">
							<div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">
									How many months will you continue the SIP?
								</p>
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="120" id="sipmonth" maxlength="3" onchange="monthChange()" />
								</p>
								<p class="m-0">
									<div id="month_slider" style="margin:0px;"></div>
									<div class="steps" id="loantermsteps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 16.66%;" class="tick">|<br />
										<span class="marker">75</span></span><span style="left: 33.33%;" class="tick">|<br />
										<span class="marker">150</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">225</span></span><span style="left: 66.66%;" class="tick">|<br />
										<span class="marker">300</span></span><span style="left: 83.33%;" class="tick">|<br />
										<span class="marker">375</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">450</span></span>
									</div>
								</p>
							</div>
						</div>
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.3s">
							<div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">
									What rate of return do you expect? (% per annum)
								</p>
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="12.5" id="sipinterest" maxlength="4" onchange="interestChange()" />
								</p>
								<p class="m-0">
									<div id="interest_slider" style="margin:0px;"></div>
									<div class="steps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">12.5</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">25</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">37.5</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">50</span></span>
									</div>
								</p>
							</div>
						</div>
						
						<div class="col-sm-12 my-3 sr-child" data-sr-reveal-delay="0.4s">
							<div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">
									How much percentage step up monthly SIP? (% per annum)
								</p>
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="10" id="sipstepup" maxlength="4" onchange="stepUpChange()" />
								</p>
								<p class="m-0">
									<div id="stepup_slider" style="margin:0px;"></div>
									<div class="steps">		
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">15</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">30</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">45</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">60</span></span>
										
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
										<span class="text-white-50 p mb-2">Total SIP Amount Invested without step up</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_amount_invest"></span></p>
									</div>
								</li>
							   <li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Total Growth without step up</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_total_interest"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Total Future Value without step up</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_total_amount"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Total SIP Amount Invested with step up</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_amount_invest_stepup"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Total Growth with step up</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_total_interest_stepup"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent border-0">
									<div class="row">
										<span class="text-white-50 p mb-2">Total Future Value with step up</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_total_amount_stepup"></span></p>
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