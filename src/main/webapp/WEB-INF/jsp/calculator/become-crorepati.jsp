<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function(){

	var currentAge = '${current_age}';
	var retireAge = '${retirement_age}';
	var retireAmount = '${wealth_amount}';
	var inflation = '${inflation_rate}';
	var rate = '${expected_return}';
	var savingsAmount = '${savings_amount}';
	
	currentAge = parseInt(currentAge);
	retireAge = parseInt(retireAge);
	retireAmount = parseInt(retireAmount);
	inflation = parseFloat(inflation);
	rate = parseFloat(rate);
	savingsAmount = parseInt(savingsAmount);
	
	$("#amount_slider").slider({
		min: 10000000,
	    max: 200000000,
	    tooltip: "show",
	    step: 1,
	    value: retireAmount
	}).on("slideStop", function(slideEvt) {		
		$("#amount").val(numbersWithComma(slideEvt.value));
		calculateWealthy();
	});
	
	$("#current_age_slider").slider({				
		min: 10,
	    max: 100,
	    tooltip: "show",
	    step: 1,
	    value: currentAge
	}).on("slideStop", function(slideEvt) {		
		$("#current_age").val(slideEvt.value);
		calculateWealthy();
	});
	
	$("#retire_age_slider").slider({
		min: 10,
	    max: 100,
	    tooltip: "show",
	    step: 1,
	    value: retireAge
	}).on("slideStop", function(slideEvt) {
		$("#retire_age").val(slideEvt.value);
		calculateWealthy();
	});
	
	$("#increase_rate_slider").slider({
		min: 0,
	    max: 10,
	    tooltip: "show",
	    step: 0.1,
	    value: inflation
	}).on("slideStop", function(slideEvt) {
		$("#inc_rate").val(slideEvt.value);
		calculateWealthy();
	});
	
	$("#interest_slider").slider({
		min: 5,
	    max: 20,
	    tooltip: "show",
	    step: 0.1,
	    value: rate
	}).on("slideStop", function(slideEvt) {
		$("#interest").val(slideEvt.value);
		calculateWealthy();
	});
	
	$("#savings_amount_slider").slider({
		min: 0,
	    max: 10000000,
	    tooltip: "show",
	    step: 1,
	    value: savingsAmount
	}).on("slideStop", function(slideEvt) {
		$("#savings_amount").val(numbersWithComma(slideEvt.value));
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
function currentAgeChange()
{
	var currentAge = $('#current_age').val();
	$( "#current_age_slider" ).slider("setValue",currentAge);
	calculateWealthy();
}
function retireAgeChange()
{
	var retireAge = $('#retire_age').val();
	$( "#retire_age_slider" ).slider("setValue",retireAge);
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
function savingsAmountChange()
{
	var savingsAmount = $('#savings_amount').val();
	savingsAmount = savingsAmount.replace(/,/g,'');
	$( "#savings_amount_slider" ).slider("setValue",savingsAmount);
	calculateWealthy();
}
function calculateWealthy()
{	
	var currentAge = $('#current_age').val();
	var retireAge = $('#retire_age').val();
	var retireAmount = $('#amount').val();
	var savingsAmount = $('#savings_amount').val();
	var rate = $('#interest').val();
	var inflation = $('#inc_rate').val();
	
	retireAmount = retireAmount.replace(/,/g, "");
	savingsAmount = savingsAmount.replace(/,/g, "");
	
	currentAge = parseInt(currentAge);
	retireAge = parseInt(retireAge);
	retireAmount = parseInt(retireAmount);
	savingsAmount = parseInt(savingsAmount);
	rate = parseFloat(rate);
	inflation = parseFloat(inflation);
	
	
	currentAge = parseInt(currentAge);
	retireAge = parseInt(retireAge);
	retireAmount = parseInt(retireAmount);
	savingsAmount = parseInt(savingsAmount);
	rate = parseFloat(rate,10);
	inflation = parseFloat(inflation,10);
	
	if(retireAge <= currentAge)
	{
		alert("Please enter the retirement age not less than the current age");
		return;
	}
	if(savingsAmount >= retireAmount)
	{
		alert("Please enter the savings amount less than the retirement amount");
		return;
	}
	
	var target_wealth = 0;
	var target_savings = 0;
	var target_amount = 0;
	var years = 0;
	var expected_return = 0;
	var monthly_savings = 0;
	var invested_amount = 0;
	var total_earnings = 0;
	
	$.ajaxSetup({async:false});
	$.post("/tools-and-calculators/getCrorepatiResult", {current_age : "" + currentAge + "",retirement_age : "" + retireAge + "",wealth_amount : "" + retireAmount + "",
		inflation_rate : "" + inflation + "",expected_return : "" + rate + "",savings_amount : "" + savingsAmount + ""}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
	
		if(obj.status == 400)
		{
			alert(obj.msg);
			return false;
		}
		
		target_wealth = obj.target_wealth;
		target_savings = obj.target_savings;
		target_amount = obj.target_amount;
		years = obj.years;
		expected_return = obj.expected_return;
		monthly_savings = obj.monthly_savings;
		invested_amount = obj.invested_amount;
		total_earnings = obj.total_earnings;
		
    },'text');
	
	$('#res_target_wealth').html(numbersWithComma(target_wealth));
	$('#res_target_savings').html(numbersWithComma(target_savings));
	$('#res_target_amount').html(numbersWithComma(target_amount));
	$('#res_years').html(years);
	$('#res_years_1').html(years);
	$('#res_rate_return').html(expected_return);
	$('#res_monthly_savings').html(numbersWithComma(monthly_savings));
	$('#res_invested_amount').html(numbersWithComma(invested_amount));
	$('#res_earning_amount').html(numbersWithComma(total_earnings));
	
	renderChart(invested_amount,total_earnings);
}


function downloadResult() {

	var wealth_amount = $('#amount').val();
	var current_age = $('#current_age').val();
	var wealth_age = $('#retire_age').val();
	var price_increase_rate = $('#inc_rate').val();
	var rate_of_return = $('#interest').val();
	var savings_amount = $('#savings_amount').val();

	var target_wealth = $('#res_target_wealth').html();
	var target_savings = $('#res_target_savings').html();
	var target_amount = $('#res_target_amount').html();
	var years = $('#res_years').html();
	var monthly_savings = $('#res_monthly_savings').html();
	var invested_amount = $('#res_invested_amount').html();
	var total_earnings = $('#res_earning_amount').html();

	//wealth_amount = numbersWithComma(wealth_amount);
	//savings_amount = numbersWithComma(savings_amount);
	var calc_url = window.location.href;

	var param = "?wealth_amount=" + wealth_amount + "&current_age="
			+ current_age + "&wealth_age=" + wealth_age
			+ "&price_increase_rate=" + price_increase_rate
			+ "&rate_of_return=" + rate_of_return + "&savings_amount="
			+ savings_amount;
	param += "&target_wealth=" + target_wealth + "&target_savings="
			+ target_savings + "&target_amount=" + target_amount
			+ "&years=" + years + "&monthly_savings=" + monthly_savings
			+ "&invested_amount=" + invested_amount + "&total_earnings="
			+ total_earnings + "&url=" + calc_url;

	var url = '/tools-and-calculators/downloadCrorepatiCalcResult'
			+ param;
	window.location = url;

	$('#send_email_model').modal('hide');
	setTimeout(function() {
		swal({title : "",text : "Thanks for the Download."});
	}, 1000);

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

function renderChart(amount,total_interest)
{
	console.log("amount = " + amount);
	console.log("total_interest = " + total_interest);
	
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
</script>

<style>
  /* Result Card Teal Gradient */
  .premium-result-card {
    background: linear-gradient(135deg, var(--brand-primary) 0%, #007A7A 100%);
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
    color: var(--text-dark);
    background: #f9fafb;
    transition: all 0.2s;
  }
  .premium-calc-input:focus {
    background: #fff;
    border-color: var(--brand-primary);
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

<!-- ── PAGE HERO ──────────────────────────────────────────────── -->
<div class="page-hero-curved">
  <div class="container position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center sr-reveal" data-sr-reveal-delay="0.1s">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="/tools-and-calculators">Calculators</a></li>
        <li class="breadcrumb-item active" aria-current="page">Become A Crorepati</li>
      </ol>
    </nav>
    <div class="text-center">
      <span class="category-label sr-reveal" data-sr-reveal-delay="0.2s">Tools &amp; Calculators</span>
      <h1 class="sr-reveal mt-2 mb-0" data-sr-reveal-delay="0.3s" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Become A Crorepati Calculator</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>


<section class="bg-light" id="toolaAndCalculators" style="position:relative; z-index:1;">
	<div class="container py-5">
		<div class="col-md-12">
			<div class="row align-items-center mb-5 sr-section">
				<div class="col-sm-8">
					<h3 style="font-weight:700; color:#1a1f2e;">Calculate Your Path to a Crore</h3>
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
							<div class="premium-card p-4 pb-0">
							
								<p class="m-0 pb-2 fw-bold text-dark">
									How many Crores (at current value) you would need to consider yourself wealthy (Rs)
								</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="5,00,00,000" class="number" id="amount" maxlength="9" onchange="amountChange()" />
								</p>
								
								<p class="m-0">
									<div id="amount_slider" style="margin:0px;"></div>
									<div class="steps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">1 Crore</span></span><span style="left: 21.05%;" class="tick">|<br />
										<span class="marker">5 Crores</span></span><span style="left: 47.36%;" class="tick">|<br />
										<span class="marker">10 Crores</span></span><span style="left: 73.68%;" class="tick">|<br />
										<span class="marker">15 Crores</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">20 Crores</span></span>
									</div>
								</p>
							</div>
						</div>
						
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.2s">
						   <div class="premium-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">
									Your current age (in years)
								</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="30" id="current_age" maxlength="3" onchange="currentAgeChange()" />
								</p>
								
								<p class="m-0">
									<div id="current_age_slider" style="margin:0px;"></div>
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
							<div class="premium-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">
									The age when you want to become a Crorepati (in years)
								</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="60" id="retire_age" maxlength="3" onchange="retireAgeChange()" />
								</p>
								
								<p class="m-0">
									<div id="retire_age_slider" style="margin:0px;"></div>
									<div class="steps" id="loantermsteps">
										<div style="left: 0%;" class="tick">|<br /> <span class="marker">10</span></div>
										<div style="left: 16.66%;" class="tick">|<br /> <span class="marker">25</span></div>
										<div style="left: 44.44%;" class="tick">|<br /> <span class="marker">50</span></div>
										<div style="left: 72.22%;" class="tick">|<br /> <span class="marker">75</span></div>
										<div style="left: 100%;" class="tick">|<br /> <span class="marker">100</span></div>
									</div>
								</p>
							</div>
						</div>
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.4s">
							 <div class="premium-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">
									The expected rate of inflation over the years (% per annum)
								</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="5" id="inc_rate" maxlength="4" onchange="increaseRateChange()" />
								</p>
								
								<p class="m-0">
									<div id="increase_rate_slider" style="margin:0px;"></div>
									<div class="steps">
										<div style="left: 0%;" class="tick">|<br /> <span class="marker">0</span></div>
										<div style="left: 25%;" class="tick">|<br /> <span class="marker">2.5</span></div>
										<div style="left: 50%;" class="tick">|<br /> <span class="marker">5.0</span></div>
										<div style="left: 75%;" class="tick">|<br /> <span class="marker">7.5</span></div>
										<div style="left: 100%;" class="tick">|<br /> <span class="marker">10</span></div>
									</div>
								</p>
							</div>
						</div>
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.5s">
							 <div class="premium-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">
									What rate of return would you expect your SIP investment to generate (% per annum)
								</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" value="12" id="interest" maxlength="4" onchange="interestChange()" />
								</p>
								
								<p class="m-0">
									<div id="interest_slider" style="margin:0px;"></div>
									<div class="steps">
										<div style="left: 0%;" class="tick">|<br /> <span class="marker">5</span></div>
										<div style="left: 16.66%;" class="tick">|<br /> <span class="marker">7.5</span></div>
										<div style="left: 33.33%;" class="tick">|<br /> <span class="marker">10</span></div>
										<div style="left: 50%;" class="tick">|<br /> <span class="marker">12.5</span></div>
										<div style="left: 66.66%;" class="tick">|<br /> <span class="marker">15</span></div>
										<div style="left: 83.33%;" class="tick">|<br /> <span class="marker">17.5</span></div>
										<div style="left: 100%;" class="tick">|<br /> <span class="marker">20</span></div>
									</div>
								</p>
							</div>
						</div>
						<div class="col-sm-12 my-3 row-eq-height sr-child" data-sr-reveal-delay="0.6s">
							 <div class="premium-card p-4 pb-0">
								<p class="m-0 pb-2 fw-bold text-dark">
									How much savings you have now (Rs)
								</p>
								
								<p class="m-0">
									<input type="text" class="premium-calc-input w-100 mb-3" class="number" value="25,00,000" id="savings_amount" maxlength="8" onchange="savingsAmountChange()" />
								</p>
								
								<p class="m-0">
									<div id="savings_amount_slider" style="margin:0px;"></div>
									<div class="steps">
										<div style="left: 0%;" class="tick">|<br /> <span class="marker">0</span></div>
										<div style="left: 25%;" class="tick">|<br /> <span class="marker">25L</span></div>
										<div style="left: 50%;" class="tick">|<br /> <span class="marker">50L</span></div>
										<div style="left: 75%;" class="tick">|<br /> <span class="marker">75L</span></div>
										<div style="left: 100%;" class="tick">|<br /> <span class="marker">1 Crore</span></div>
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
										<span class="text-white-50 p mb-2">Monthly SIP Amount</span>
										<p class="h4 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_monthly_savings"></span> <br><small style="font-size:0.9rem;opacity:0.8;font-weight:normal;">( <span id="res_years"></span> years you need to save )</small></p>
									</div>
								</li>
							   <li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Total Amount Invested in <span id="res_years_1"></span> years</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_invested_amount"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Total Growth Amount</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_earning_amount"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Your targeted Wealth Amount (Inflation adjusted)</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_target_wealth"></span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent">
									<div class="row">
										<span class="text-white-50 p mb-2">Growth of your Savings Amount (<span id="res_rate_return">12</span>% p.a.)</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_target_savings">7,48,99,805</span></p>
									</div>
								</li>
								<li class="list-group-item bg-transparent border-0">
									<div class="row">
										<span class="text-white-50 p mb-2">Final Targeted Amount (Minus growth of savings)</span>
										<p class="h5 text-white mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_target_amount"></span></p>
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