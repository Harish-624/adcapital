<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">

var wealth_amount = "";
var inflation_rate = "";
var expected_return = "";
var period = "";
var accountMap = "";
    
$(document).ready(function(){

	wealth_amount = '${wealth_amount}';
	inflation_rate = '${inflation_rate}';
	expected_return = '${expected_return}';
	period = '${period}';
	
	wealth_amount = parseInt(wealth_amount);
	price_increase_rate = parseFloat(inflation_rate);
	rate_of_return = parseFloat(expected_return);
	years = parseInt(period);
	
	$('#years').val(years);
	$('#amount').val(numbersWithComma(wealth_amount));
	$('#inc_rate').val(price_increase_rate);
	$('#interest').val(rate_of_return);
	
	accountMap = '${accountMap}';
	
	$("#amount_slider").slider({
		min: 0,
        max: 1000000000,
        tooltip: "show",
        step: 1,
        value: wealth_amount
	}).on("slideStop", function(slideEvt) {		
		$("#amount").val(numbersWithComma(slideEvt.value));
		calculateWealthy();
	});
	
	$("#year_slider").slider({
		min: 10,
        max: 100,
        tooltip: "show",
        step: 1,
        value: years
	}).on("slideStop", function(slideEvt) {
		$("#years").val(slideEvt.value);
		calculateWealthy();
	});
	
	$("#increase_rate_slider").slider({
		min: 0,
        max: 10,
        tooltip: "show",
        step: 0.1,
        value: price_increase_rate
	}).on("slideStop", function(slideEvt) {
		$("#inc_rate").val(slideEvt.value);
		calculateWealthy();
	});
	
	$("#interest_slider").slider({
		min: 0,
        max: 25,
        tooltip: "show",
        step: 0.1,
        value: rate_of_return
	}).on("slideStop", function(slideEvt) {
		$("#interest").val(slideEvt.value);
		calculateWealthy();
	});
	
	$('input.number').change(function() {
		$(this).val(function(index, value) {
			value = value.replace(/,/g,'');
		    return numbersWithComma(value);
		});
	});
	
	calculateWealthy();
	
});

function amountChange()
{
	var amount = $('#amount').val();
	amount = amount.replace(/,/g,'');
	$( "#amount_slider" ).slider("setValue",amount);
	calculateWealthy();
}
function yearChange()
{
	var year = $('#years').val();
	$( "#year_slider" ).slider("setValue",year);
	calculateWealthy();
}
function increaseRateChange()
{
	var increaseRate = $('#inc_rate').val();
	$( "#increase_rate_slider" ).slider("setValue",increaseRate);
	calculateWealthy();
}
function interestChange()
{
	var interest = $('#interest').val();
	$( "#interest_slider" ).slider("setValue",interest);
	calculateWealthy();
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

function calculateWealthy()
{
	var years = $('#years').val();
	var wealth_amount = $('#amount').val();
	var price_increase_rate = $('#inc_rate').val();
	var rate_of_return = $('#interest').val();
	
	wealth_amount = wealth_amount.replace(/,/g, "");
	
	years = parseInt(years);
	wealth_amount = parseInt(wealth_amount);
	price_increase_rate = parseFloat(price_increase_rate,10);
	rate_of_return = parseFloat(rate_of_return,10);
	
	var target_wealth = 0;
	var monthly_savings = 0;
	var invested_amount = 0;
	var total_earnings = 0;
	
	$.ajaxSetup({async:false});
	$.post("/tools-and-calculators/getTargetAmountSIPCalcResult", {wealth_amount : "" + wealth_amount + "",inflation_rate : "" + price_increase_rate + "",expected_return : "" + rate_of_return + "",period : "" + years + ""}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status == 400)
		{
			alert(obj.msg);
			return false;
		}
		
		target_wealth = obj.target_wealth;
		monthly_savings = obj.sip_amount;
		invested_amount = obj.invested_amount;
		total_earnings = obj.growth_amount;
		
    },'text');
	
	$('#res_target_wealth').html(numbersWithComma(target_wealth));
	$('#res_years').html(years);
	$('#res_years_1').html(years);
	$('#res_rate_return').html(rate_of_return);
	$('#res_monthly_savings').html(numbersWithComma(monthly_savings));
	$('#res_invested_amount').html(numbersWithComma(invested_amount));
	$('#res_earning_amount').html(numbersWithComma(total_earnings));
	
	renderChart(invested_amount, total_earnings);
}
function saveResult() 
{	
	
	var years = $('#years').val();
	var wealth_amount = $('#amount').val();
	var price_increase_rate = $('#inc_rate').val();
	var rate_of_return = $('#interest').val();
	
	years = parseInt(years);
	wealth_amount = parseInt(wealth_amount);
	price_increase_rate = parseFloat(price_increase_rate,10);
	rate_of_return = parseFloat(rate_of_return,10);
	
	var title = "Target Amt SIP Calculator - "+(wealth_amount/100000)+" Lakhs in "+years+" yrs with "+price_increase_rate+"% inflation and "+rate_of_return+"% return";
	var url = "/tools-and-calculators/target-amount-sip-calculator?wealth_amount="+wealth_amount+"&inflation_rate="+price_increase_rate+"&expected_return="+rate_of_return+"&period="+years;	
	
	if(accountMap == undefined || accountMap == null || accountMap == "" || accountMap == "null")
	{
		advisorkhoj_result_title = title;
		advisorkhoj_result_url = url;
		
		$("#adv-contact-advisor-signin-signup").modal("show");
		
	}else
	{
		saveUserResult("Calculator",title, url);
	}
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
          text: 'Break-up of Total Payment'
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
var download_text = "";
function downloadResult()
{
	return false;
	download_text = "download";
	$("#send_email_model").modal('show');
}
function emailResult()
{
	return false;
	download_text = "email";
	$("#send_email_model").modal('show');
}

var async = async || [];
async.push(["ready",function (){	
    $(".send_email_form").find("input").jqBootstrapValidation(
    {
		preventSubmit: true,
		submitSuccess: function($form, event) {
		    event.preventDefault();
		    
		    var radio_value = $("input[type='radio'][name='inves_calc']:checked").val();
			if(radio_value == undefined)
			{
				$("#adv-alert-msg").html("Please choose Are you an Investor or Advisor?");
			    $("#adv-alert").modal('show');
		   	 	return false;
			}
		    var email = $("#send_email_id").val();
		    if(email == "")
		    {
		   		 $("#adv-alert-msg").html("Please enter email address!");
	        	 $("#adv-alert").modal('show');
		   		 return false;
		    }
		    if(!validateEmail(email))
		    {
		    	$("#adv-alert-msg").html("Please enter valid email address!");
	        	$("#adv-alert").modal('show');
		   	 	return false;
		    }
		    
			var flag = false;
		    
		    $.ajaxSetup({async:false});
		    $.post("/verifyEmail", {email : "" + email + ""}, function(data)
	   	    {
	   			var result = $.trim(data);
	   	        if(result == "false")
	   	        {
	   	        	flag = true;
	   	        	$("#adv-alert-msg").html("Please enter valid email address!");
		        	$("#adv-alert").modal('show');
	   	       	 	return false;
	   	        }
	   	    }, "text");
		    
		    if(flag == true)
	    	{
		    	return false;
	    	}
		   	
		    var page = "Crorepati Calculator - "+download_text;
		    
		    $.ajaxSetup({async:false});
			$.post("/subscribeForEmail", {email : "" + email + "", user_type : "" + radio_value + "", page : "" + page + "" }, function(data)
		    {
		    }, "text");
		    
		    init_download(email);
		}
    });
}]);

function downloadResult()
{
	var wealth_amount = $('#amount').val();
	var current_age = $('#years').val();
	var wealth_age = $('#inc_rate').val();
	var price_increase_rate = $('#inc_rate').val();
	var rate_of_return = $('#interest').val();
	/* var savings_amount = $('#savings_amount').val(); */
	
	var target_wealth = $('#res_target_wealth').html();
	var years = $('#res_years').html();
	/* var target_savings = $('#res_target_savings').html();
	var target_amount = $('#res_target_amount').html(); */
	
	var monthly_savings = $('#res_monthly_savings').html();
	var invested_amount = $('#res_invested_amount').html();
	var total_earnings = $('#res_earning_amount').html();
	
	//wealth_amount = numbersWithComma(wealth_amount);
	//ssavings_amount = numbersWithComma(savings_amount);
	var calc_url = window.location.href;
	
	
		var param = "?wealth_amount="+wealth_amount+"&current_age="+current_age+"&wealth_age="+wealth_age+"&price_increase_rate="+price_increase_rate+"&rate_of_return="+rate_of_return/* +"&savings_amount="+savings_amount */;
		param += "&target_wealth="+target_wealth+/* "&target_savings="+target_savings+"&target_amount="+target_amount+ */"&years="+years+"&monthly_savings="+monthly_savings+"&invested_amount="+invested_amount+"&total_earnings="+total_earnings+"&url="+calc_url;
		
		var url = '<c:url value="/tools-and-calculators/downloadTargetAmountSipCalcResult" />'+param;
		window.location = url;
		
		$('#send_email_model').modal('hide');
        setTimeout(function(){
	        	swal({title:"",text:"Thanks for download."});
	    		return;
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
    <h1>Target Amount SIP Calculator</h1>
    <p>Determine the monthly SIP investment needed to reach your desired future corpus.</p>
  </div>
</section>


<section class="bg-light" id="toolaAndCalculators" style="position:relative; z-index:1;">
	<div class="container py-5">
		<div class="col-md-12">
			<div class="row align-items-center mb-5 sr-section">
				<div class="col-sm-8">
					<h3 style="font-weight:700; color:#1a1f2e;">Target Amount SIP Calculator</h3>
					<p style="color:#4b5563;">Planning for a future financial goal? Our Target Amount SIP Calculator helps you determine the monthly SIP investment needed to reach your desired corpus. Simply enter your target amount, investment period, expected inflation rate, and expected rate of return to get an inflation-adjusted estimate.</p>
				</div>
				<div class="col-sm-4 text-end">
					<button type="button" class="btn rounded-pill px-4 py-2 text-white" onclick="downloadResult()" data-loading-text="Please wait..." style="background:#009899; border:none; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">
                      <i class="fa fa-download me-2"></i> Download
                    </button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7">
					<div class="row calculator">
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.1s">
							<div class="premium-glass-card p-4 pb-0">
							
								<p class="m-0 pb-2 fw-bold text-dark">Target Amount (Rs)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3 number" value="5,00,00,000" id="amount" maxlength="9" onchange="amountChange()" />
								</p>
								
								<p class="m-0">
									<div id="amount_slider" style="margin:0px;"></div>
									<div class="steps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0 Crore</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">25 Crores</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">50 Crores</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">75 Crores</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">100 Crores</span></span>
									</div>
								</p>
							</div>
						</div>
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.2s">
						   <div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">Investment Period (in years)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="30" id="years" maxlength="3" onchange="yearChange()" />
								</p>
								
								<p class="m-0">
									<div id="year_slider" style="margin:0px;"></div>
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
								<p class="m-0 pb-2 fw-bold text-dark">The expected rate of inflation over the years (% per annum)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="60" id="inc_rate" maxlength="3" onchange="increaseRateChange()" />
								</p>
								
								<p class="m-0">
									<div id="increase_rate_slider" style="margin:0px;"></div>
									<div class="steps" id="loantermsteps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">2.5</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">5.0</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">7.5</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">10.0</span></span>
									</div>
								</p>
							</div>
						</div>
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.4s">
							 <div class="premium-glass-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">What rate of return would you expect your SIP investment to generate (% per annum)</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="5" id="interest" maxlength="4" onchange="interestChange()" />
								</p>
								
								<p class="m-0">
									<div id="interest_slider" style="margin:0px;"></div>
									<div class="steps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 10%;" class="tick">|<br />
										<span class="marker">2.5</span></span><span style="left: 20%;" class="tick">|<br />
										<span class="marker">5</span></span><span style="left: 30%;" class="tick">|<br />
										<span class="marker">7.5</span></span><span style="left: 40%;" class="tick">|<br />
										<span class="marker">10</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">12.5</span></span><span style="left: 60%;" class="tick">|<br />
										<span class="marker">15</span></span><span style="left: 70%;" class="tick">|<br />
										<span class="marker">17.5</span></span><span style="left: 80%;" class="tick">|<br />
										<span class="marker">20</span></span><span style="left: 90%;" class="tick">|<br />
										<span class="marker">22.5</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">25</span></span>
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
										<span class="text-white-50 p mb-2">Monthly SIP investment required</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_monthly_savings"></span> <br><small class="text-white-50" style="font-size: 0.8rem;">(<span id="res_years"></span> years you need to save)</small></p>
									</div>
								</li>
							   <li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Number of years you need to save</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold"><span id="res_years_1"></span> Years</p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Your targeted Amount (Inflation adjusted)</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_target_wealth"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Total Amount Invested through SIP in <span id="res_years"></span> years</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_invested_amount"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent border-0">
									<div class="row">
										<span class="text-white-50 p mb-2">Total Growth Amount</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_earning_amount"></span></p>
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