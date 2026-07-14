<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<style>
	.page-heading {
	    padding-top: 8rem;
	    padding-bottom: 2rem;
	}
	
	.login-btn .active {
    background-color: #009899;
    color: #fff;
    border-color: #009899;
    font-size: 14px;
}



.login-btn:focus  {
    background-color: #009899;
    color: #fff;
    border-color: #009899;
    font-size: 14px;
}
</style>
<style type="text/css">
.inside_emi{
	padding:10px;
}
.small_line{
	border-bottom: 1px solid #cecece;
	clear: both;
}

.row-eq-height {
	  display: -webkit-box;
	  display: -webkit-flex;
	  display: -ms-flexbox;
	  display: flex;
	}
/* #emi {
    box-shadow: 0 0 5px 0 rgba(213, 213, 213, 1) inset;
} */
#emipaymentsummary {
    border: 1px solid #DDDDDD;
    margin-bottom:20px;
}
 #emitotalinterest {
    border-bottom: 1px dotted #DBDAD7;
    padding: 10px;
    text-align: center;
}
#emitotalamount {
    padding: 10px;
    text-align: center;
}
/* #emipaymentsummary h4 {
    color: #888888;
    font-size:12px;
    margin-bottom:10px;
    margin-top:0px;
} */
/* #emipaymentsummary p {
    font-size: 12px;
    font-weight: bold;
    margin:0px;
} */
.centerPageH1{
	margin-bottom:20px;
}
.download_calc{
	padding:10px;
	text-align:center;
}
.margintop20
{
margin-top:20px;
}
#res_amount,#res_rate,#res_loan_amount,#res_future_amount,#res_insurance_cover{
	color:#262a5a;
}
.inside_head {
    font-size: 12px;
    margin-top: 0px;
}
.textbox {
    background: none repeat scroll 0 0 #FCFCFC;
    border: 1px solid #DBDAD7;
    font-size: 14px;
    color: #1462af;
    text-align: center;
	font-weight: 600;
	padding: 7px;
	margin: 0 0 0 35px;
}
.slider {
    margin-top: -6px;
    margin-bottom: 0px;
}
.inside_head_textbox {
    text-align: right;
    margin-top: 10px;
    margin-left: -13px;
}
#emibarchart {
    float: left;
    height: 400px;
    text-align: center;
    width: 100%;
    border:1px solid #DBDAD7;
    padding:10px;
    margin-top:20px;
}
.chart_calendar{
	background-color:#EDEDED;
	border:1px solid #DBDAD7;
	padding:5px 0px;
	margin-bottom:20px;
	text-align:center;
	font-weight:bold;
	margin-top:20px;
}
.chart_calendar span{
	margin-right:20px;
}
.chart_calendar input[type="text"]{
	height:30px;
}
.entry-content{
	text-align:justify;
}
.ui-datepicker select {
	color: #000;
}
.ui-datepicker-calendar {
    display: none;
}
.centerPageH1{
	margin-bottom:20px;
}
.clear{
	clear:both;
}
.margintop20
{
margin-top:20px;
}
#res_total_amount,#res_total_interest,#res_amount_invest{
	
	color:#262a5a;
}
.inside_head {
    font-size: 12px;
    margin-top: 12px;
    font-weight: 600;
}
.textbox {
    background: none repeat scroll 0 0 #FCFCFC;
    border: 1px solid #DBDAD7;
    font-size: 14px;
    color: #1462af;
    text-align: center;
	font-weight: 600;
	padding: 7px;
}
.slider {
    margin-top: -15px;
    margin-top: 0px;
    margin-bottom: 9px;
}
.inside_head_textbox {
    text-align: right;
    margin-top: 16px;
}
.btn-primary:hover {
    background: #ffae11 !important;
    color: #000 !important;
    border-color: #ffae11 !important;
}


rect.highcharts-background {
    fill: #fafafa !important;
}
.input-text {
    outline: currentcolor none 0px;
    background: #fff none repeat scroll 0% 0%;
    color: inherit;
}
text.highcharts-title {
    font-size: 13px !important;
    font-weight: bold !important;
}
#emipiechart {
	min-width: 310px;
    max-width: 1200px;
    height: 380px;
    margin: 0 auto;
    margin: -73px 0 0 0px;
    
}
.calculator-head {
    font-size: 13px;
    margin-top: 12px;
    font-weight: 600;
}
.calculator-titles {
    /* display: flex;  */
    -moz-box-align: center;
    align-items: center;
    -moz-box-pack: justify;
    justify-content: space-between;
} 
.calculator-input {
    font-size: 17px;
    color: rgba(17, 20, 28, 0.8);
    letter-spacing: 0.3px;
    margin: 0px;
	text-align:right;
}
.calculator-sec {
    padding: 40px 25px;
    width: 55%;
}
.calculator-ans {
    display: flex;
    flex-direction: column;
    -moz-box-pack: justify;
    justify-content: inherit;
    width: 45%;
    padding: 50px 25px;
    }
    #res_amount,#res_rate,#res_loan_amount,#res_future_amount,#res_insurance_cover{
color:#262a5a;
}
.calc-title-ans {
    font-size: 12px !important;
    font-weight: bold !important;
    margin: 4px 0px 4px 0px !important;
}
@media (max-width: 768px) {
	.section {
    padding-top: 3rem;
    padding-bottom: 3rem;
    margin: -45px 0 0 0;
}
	.calculator {
    margin: 10px auto 0px;
    }
}
.form-control {
    font-size: 14px;
    height: 45px;
    padding: 0 20px;
    background-color: #ffffff;
    border: 2px solid #e6e8eb;
    width: 100%;
    height: 45px;
    border-radius: 10px;
}

.list-group-item .row > * {
    flex-shrink: 0;
    width: 100%;
    max-width: 100%;
    padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
    margin-top: var(--bs-gutter-y);
    font-weight: 700;
}

.login-btn:hover{
	background-color:#0085a1;
	color:#fff;
	border-color:#0085a1;
    font-size: 14px;
}
</style>

<script type="text/javascript">
var current_tab_value = 1;

/* var annual_income_expense = "";
var expected_increase_income_expense = "";
var loan_amount = "";
var accountMap = "";
var insurance_cover = 0;
var no_years = "";

var async = async || [];
async.push(["ready",function (){
	
	annual_income_expense = '${annual_income_expense}';
	expected_increase_income_expense = '${expected_increase_income_expense}';
	loan_amount = '${loan_amount}';
	no_years = '${no_years}';
	
	amount = parseInt(annual_income_expense);
	rate = parseFloat(expected_increase_income_expense,10);
	loan_amount = parseInt(loan_amount);
	no_years = parseInt(no_years);
	
	$('#amount').val(amount);
	$('#rate').val(rate);
	$('#year').val(no_years);
	
	accountMap = '${accountMap}'; */

$(document).ready(function(){
	
	$("#amount_slider").ionRangeSlider({
	    min: 0,
	    max: 10000000,
	    from: 2500000,
	    step: 1000,
	    hide_min_max: true,
	    hide_from_to: true,
	    onChange: function (data) {
            $("#amount").val("");
            $("#amount").val(numbersWithComma(data.from));
        },
	    onFinish: function (data) {
            $("#amount").val("");
            $("#amount").val(numbersWithComma(data.from));
            calculateValue();
        }
	});
	
	$("#rate_slider").ionRangeSlider({
	    min: 0,
	    max: 100,
	    from: 10,
	    step: 0.1,
	    hide_min_max: true,
	    hide_from_to: true,
	    onChange: function (data) {
            $("#rate").val("");
            $("#rate").val(data.from);
        },
	    onFinish: function (data) {
            $("#rate").val("");
            $("#rate").val(data.from);
            calculateValue();
        }
	});
		
	$("#loan_amount_slider").ionRangeSlider({
	    min: 0,
	    max: 10000000,
	    from: 0,
	    step: 1000,
	    hide_min_max: true,
	    hide_from_to: true,
	    onChange: function (data) {
            $("#loan_amount").val("");
            $("#loan_amount").val(numbersWithComma(data.from));
        },
	    onFinish: function (data) {
            $("#loan_amount").val("");
            $("#loan_amount").val(numbersWithComma(data.from));
            calculateValue();
        }
	});
	
	$("#year_slider").ionRangeSlider({
	    min: 0,
	    max: 100,
	    from: 10,
	    step: 1,
	    hide_min_max: true,
	    hide_from_to: true,
	    onChange: function (data) {
            $("#year").val("");
            $("#year").val(data.from);
        },
	    onFinish: function (data) {
            $("#year").val("");
            $("#year").val(data.from);
            calculateValue();
        }
	});
	
	/* $('input.number').change(function() {
		$(this).val(function(index, value) {
			value = value.replace(/,/g,'');
		    return numbersWithComma(value);
		});
	}); */

	calculateValue();
	
});

function amountChange()
{	
	var amount = $('#amount').val();
	amount = amount.replace(/,/g,'');
	var slider = $("#amount_slider").data("ionRangeSlider");
	slider.update({
	    from: amount
	});
	calculateValue();
}
function rateChange()
{	
	var rate = $('#rate').val();
	var slider = $("#rate_slider").data("ionRangeSlider");
	slider.update({
	    from: rate
	});
	calculateValue();
}
function loanAmountChange()
{
	var loan_amount = $('#loan_amount').val();
	loan_amount = loan_amount.replace(/,/g,'');
	var slider = $("#loan_amount_slider").data("ionRangeSlider");
	slider.update({
	    from: loan_amount
	});
	calculateValue();
}
function yearChange()
{
	var year = $('#year').val();
	year = year.replace(/,/g,'');
	var slider = $("#year_slider").data("ionRangeSlider");
	slider.update({
	    from: year
	});
	calculateValue();
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
function calculateValue()
{
	var amount = $('#amount').val();
	var rate = $('#rate').val();
	var loan_amount = $('#loan_amount').val();
	var year = $('#year').val();
	
	amount = amount.replace(/,/g,'');
	loan_amount = loan_amount.replace(/,/g,'');
	
	amount = parseInt(amount);
	rate = parseFloat(rate,10);
	loan_amount = parseInt(loan_amount);
	year = parseInt(year);
	
    var future_income = 0;
	var insurance_cover = 0;
	
	$.ajaxSetup({async:false});
	$.post("/tools-and-calculators/getHumanLifeValueCalcResult", {annual_income_expense : "" + amount + "",expected_increase_income_expense : "" + rate + "",loan_amount : "" + loan_amount + "",no_years : "" + year + ""}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status == 400)
		{
			alert(obj.msg);
			return false;
		}
		future_income = obj.cumulative_income_expense;
		insurance_cover = obj.life_cover_value;
    },'text');
	
	$('#res_amount').html(numbersWithComma(amount));
	$('#res_rate').html(numbersWithComma(rate));
	$('#no_years').html(year);
	$('#res_loan_amount').html(numbersWithComma(loan_amount));
	$('#res_future_amount').html(numbersWithComma(future_income));
	$('#res_insurance_cover').html(numbersWithComma(insurance_cover));	
	
}

function downloadResult()
{
	var amount = $('#amount').val();
	var rate = $('#rate').val();
	var loan_amount = $('#loan_amount').val();
	var year = $('#year').val();
	
	console.log("loan_amount = " + loan_amount);
	
	var res_amount = $( "#res_amount" ).html();
	var res_rate = $( "#res_rate" ).html();
	var res_loan_amount = $( "#res_loan_amount" ).html();
	var res_future_amount = $( "#res_future_amount" ).html();
	var res_insurance_cover = $( "#res_insurance_cover" ).html();
	
	/* principal = numbersWithComma(principal); */
	var calc_url = window.location.href;
	
	
		var param = "?amount="+amount+"&rate="+rate+"&loan_amount="+loan_amount+"&year="+year;
		param += "&res_amount="+res_amount+"&res_rate="+res_rate+"&res_loan_amount="+res_loan_amount+"&res_future_amount="+res_future_amount+"&res_insurance_cover="+res_insurance_cover+"&url="+calc_url;
		
		var url = '/tools-and-calculators/downloadHumanValueCalcResult'+param;

		window.location = url;
		
		$('#send_email_model').modal('hide');
        setTimeout(function(){
        	swal({title:"",text:"Thanks for the Download."});
    	},1000);
	
}
function tabChange(val)
{
	current_tab_value = val;
	var year = $('#year').val();
	year = parseInt(year);
	if(val == 1)
	{
		$("#amount_div b").text("Your Current Annual Income (Rs)");
		$("#rate_div b").text("Expected increase in income (% per annum)");
		$("#res_amount_txt").text("Your Current Annual Income");
		$("#res_rate_txt").text("Expected increase in income (% per annum)");
		$("#res_future_amount_txt").text("cumulative expense that you will have to take care in next "+ year +" years");
	}else
	{
		$("#amount_div b").text("Your Current Annual Expenses (Rs)");
		$("#rate_div b").text("Expected increase in expense (% per annum)");
		$("#res_amount_txt").text("Your Current Annual Expenses");
		$("#res_rate_txt").text("Expected increase in expense (% per annum)");
		$("#res_future_amount_txt").text("cumulative expense that you will have to take care in next "+ year +" years");
	}	
}
/* function renderChart(amount,insurance_cover)
{
	amount = parseFloat(amount);
	loan_amount = parseFloat(loan_amount);
	
	$('#emipiechart').highcharts({
		colors: ['#f47f36', '#262a5a', '#FAA74B', '#00a85b', '#858688', '#1cb7eb', '#FF9655', '#1686b0', '#6AF9C4'],
	    chart: {
	      plotBackgroundColor: null,
	      plotBorderWidth: null,
	      plotShadow: false,
	      type: 'pie'
	    },
	    title: {
	      text: 'Total Amount<br>'+'Rs '+insurance_cover,
	      y:175
	      
	    },
	  legend:{
	    enabled:true
	  },
	  credits: {
          enabled: false
      },
	    tooltip: {
	      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	      pie: {
	        allowPointSelect: false,
	        cursor: 'pointer',
	        dataLabels: {
	          enabled: false,
	          formatter:function(){
	            return this.key+ ': ' + this.y + '%';
	          },
	        },
	        showInLegend: true
	      },
	      series: {
	            animation: {
	                duration: 2000
	            }
	        }
	    },
	    series: [{
	      colorByPoint: true,
	        innerSize: '80%',
	      data: [{
	        name: 'Total SIP Amount Invested',
	        y: 78,
	      }, {
	        name: 'Total Growth',
	        y: 22
	      }]
	    }]
	  });
} */
/* function downloadResult()
{
	var amount = $('#amount').val();
	var rate = $('#rate').val();
	var loan_amount = $('#loan_amount').val();
	var year = $('#year').val();
	
	var res_amount = $( "#res_amount" ).html();
	var res_rate = $( "#res_rate" ).html();
	var res_loan_amount = $( "#res_loan_amount" ).html();
	var res_future_amount = $( "#res_future_amount" ).html();
	var res_insurance_cover = $( "#res_insurance_cover" ).html();
	
	 principal = numbersWithComma(principal); 
	var calc_url = window.location.href;
	
	
		var param = "?amount="+amount+"&rate="+rate+"&loan_amount="+numbersWithComma(loan_amount)+"&year="+year;
		param += "&res_amount="+res_amount+"&res_rate="+res_rate+"&res_loan_amount="+res_loan_amount+"&res_future_amount="+res_future_amount+"&res_insurance_cover="+res_insurance_cover+"&url="+calc_url;
		
		var url = '<c:url value="/tools-and-calculators/downloadHumanValueCalcResult" />'+param;

		window.location = url;
		
		$('#send_email_model').modal('hide');
        setTimeout(function(){
        	swal({title:"",text:"Thanks for the Download."});
    	},1000);
	
} */
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
  .premium-result-card .h6, 
  .premium-result-card h6 {
    color: rgba(255, 255, 255, 0.8) !important;
    font-size: 0.9rem;
  }
  .premium-result-card p {
    color: #ffffff !important;
    font-size: 1.25rem !important;
    font-weight: 700;
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

<main>

<section class="premium-calculator-hero text-center">
  <div class="container">
    <div class="hero-label">Tools &amp; Calculators</div>
    <h1>Human Life Value Calculator</h1>
    <p>Estimate the financial loss your family would incur if you were no longer around.</p>
  </div>
</section>

        <!-- Section -->
        <section class="section pt-5" style="position:relative; z-index:1;">
            <div class="container">
				   <div class="row mb-5 justify-content-center">
	            			<div class="col-md-3">
	            				<a href="/tools-and-calculators/human-life-value-calculator" class="px-4 btn rounded-pill login-btn active" style="background:#009899;color:#fff;">Income Method</a>
	            			</div>
	            			<div class="col-md-3">
	            				<a href="/tools-and-calculators/human-life-value-calculator_expand" class="px-4 btn rounded-pill login-btn" style="background:#fff;color:#000;">Expense Method</a>
	            			</div>
	            			
	            			
	            		</div>
				
				   
				    <div class="row align-items-center mb-5 sr-section">
				    <div class="col-md-8">
				    	<h3 style="font-weight:700; color:#1a1f2e;">Human Life Value Calculator</h3>
				    	<p style="color:#4b5563;">A Human Life Value (HLV) Calculator helps estimate the financial loss your family would incur if you were no longer around. It considers factors like your income, retirement age, tax rate, current life insurance, savings, and other assets to provide an approximate measure of your net contribution to your family. </p>
				    
				    </div>
				<div class="col-sm-4 text-end">
					<button type="button" class="btn rounded-pill px-4 py-2 text-white" onclick="downloadResult()" data-loading-text="Please wait..." style="background:#009899; border:none; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">
						<i class="fa fa-download me-2"></i> Download
					</button>
				</div>
			</div>
				      <div class="row justify-content-lg-between">
                <div class="col-lg-7 sr-child">
                        <div class="row calculator">
                            <div class="col-sm-12 my-3 row-eq-height">
                                <div class="premium-glass-card p-4 pb-0">
                                    <p class="m-0 pb-2 fw-bold text-dark" id="amount_div">
                                    	<b>Your Current Annual Income (Rs)</b>
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" class="premium-calc-input w-100 mb-3 number" value="25,00,000" id="amount" maxlength="10" onchange="amountChange()" />
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" id="amount_slider" name="amount_slider" value="" />
                                    	<div class="steps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0 Lakh</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">25 Lakh</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">50 Lakh</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">75 Lakh</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">1 Crores</span></span>
									</div>
                                    	
                                    </p>
                                </div>
                            </div>
                            
                            <div class="col-sm-12 my-3 row-eq-height">
                                <div class="premium-glass-card p-4 pb-0">
                                    <p class="m-0 pb-2 fw-bold text-dark" id="rate_div">
                                    	<b>Expected increase in income (% per annum)</b>
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" class="premium-calc-input w-100 mb-3" value="10" id="rate" maxlength="4" onchange="rateChange()" />
                                    	
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" id="rate_slider" name="rate_slider" value="" />
                                    	<div class="steps" id="loantermsteps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">25</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">50</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">75</span></span><span style="left: 100%" class="tick">|<br />
										<span class="marker">100</span></span>
										
									</div>
                                    </p>
                                </div>
                            </div>
                            
                            <div class="col-sm-12 my-3 row-eq-height">
                                <div class="premium-glass-card p-4 pb-0">
                                    <p class="m-0 pb-2 fw-bold text-dark">
                                    	<b>Outstanding loan amount  (Rs)</b>
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" class="premium-calc-input w-100 mb-3 number" value="0" id="loan_amount" maxlength="10" onchange="loanAmountChange()" />
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" id="loan_amount_slider" name="loan_amount_slider" value="" />
                                    	<div class="steps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">25 Lakh</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">50 Lakh</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">75 Lakh</span></span><span style="left: 100%;" class="tick">|<br />
										<span class="marker">1 Crores</span></span>
									</div>
                                    </p>
                                </div>
                            </div>
                            
                            <div class="col-sm-12 my-3 row-eq-height">
                                <div class="premium-glass-card p-4 pb-0">
                                    <p class="m-0 pb-2 fw-bold text-dark">
                                    	<b>Number of Years</b>
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" class="premium-calc-input w-100 mb-3 number" value="10" id="year" maxlength="4" onchange="yearChange()" />
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" id="year_slider" name="year_slider" value="" />
                                    	<div class="steps" id="loantermsteps">
										<span style="left: 0%;" class="tick">|<br />
										<span class="marker">0</span></span><span style="left: 25%;" class="tick">|<br />
										<span class="marker">25</span></span><span style="left: 50%;" class="tick">|<br />
										<span class="marker">50</span></span><span style="left: 75%;" class="tick">|<br />
										<span class="marker">75</span></span><span style="left: 100%" class="tick">|<br />
										<span class="marker">100</span></span>
										
									</div>
                                    </p>
                                </div>
                            </div>

                        </div>
                    </div>
                   <div class="col-lg-5 my-3 sr-child">

						
						<div class="card mb-5 text-center premium-result-card">
                                <div class="card-body p-4">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item bg-transparent">
                                            <div class="row">
                                                <span class="h6 text-white-50 p mb-2" id="res_amount_txt">Your Current Annual Income</span>
                                            	<p class="mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_amount"></span></p>
                                            </div>
                                        </li>
                                       <li class="list-group-item bg-transparent">
                                            <div class="row">
                                                <span class="h6 text-white-50 p mb-2" id="res_rate_txt">Expected increase in income (% per annum)</span>
                                            	<p class="mt-0 mb-0 d-lg-block fw-bold"><span id="res_rate"></span>%</p>
                                            </div>
                                        </li>
                                        <li class="list-group-item bg-transparent">
                                            <div class="row">
                                                <span class="h6 text-white-50 p mb-2">Outstanding loan amount</span>
                                            	<p class="mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_loan_amount"></span></p>
                                            </div>
                                        </li>
                                        <li class="list-group-item bg-transparent">
                                            <div class="row">
                                                <span class="h6 text-white-50 p mb-2" id="res_future_amount_txt">Cumulative income that you will have to take care in next <span id="no_years"></span> years</span>
                                            	<p class="mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_future_amount"></span></p>
                                            </div>
                                        </li>
                                        <li class="list-group-item bg-transparent border-0">
                                            <div class="row">
                                                <span class="h6 text-white-50 p mb-2">Your ideal life cover</span>
                                            	<p class="mt-0 mb-0 d-lg-block fw-bold">&#8377; <span id="res_insurance_cover"></span></p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>


                    </div>
                    
                </div>
				
				   
				  </div>
             

            
          
        </section>
        <section>
        	  <div class="container py-5">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;"><b>Disclaimer :</b> We have gathered all the data, information, statistics from the sources believed to be highly reliable and true. All necessary precautions have been taken to avoid any error, lapse or insufficiency; however, no representations or warranties are made (express or implied) as to the reliability, accuracy or completeness of such information. We cannot be held liable for any loss arising directly or indirectly from the use of, or any action taken in on, any information appearing herein. The user is advised to verify the contents of the report independently.</p>
							<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;">Returns less than 1 year are in absolute (%) and greater than 1 year are compounded annualised (CAGR %). SIP returns are shown in XIRR (%).</p>
							<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;">The Risk Level of any of the schemes must always be commensurate with the risk profile, investment objective or financial goals of the investor concerned. Mutual Fund Distributors (MFDs) or Registered Investment Advisors (RIAs) should assess the risk profile and investment needs of individual investors into consideration and make scheme(s) or asset allocation recommendations accordingly.</p>
							<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;"><b>Mutual Fund investments are subject to market risks, read all scheme related documents carefully.</b> Past performance may or may not be sustained in the future. Investors should always invest according to their risk profile and consult with their mutual fund distributors or financial advisor before investing.</p>
						</div>
					</div>
				</div>
			</div>
        </section> 
        <!-- End Section -->
  </main>