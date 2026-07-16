<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<style>
	.page-heading {
	    padding-top: 6rem;
	    padding-bottom: 2rem;
	}
</style>
<style>
.member {
    box-shadow: 0px 5px 83px 0px rgb(9 29 62 / 15%);
}
/******************* Tools and calc **********************/

.row-eq-height {
	  display: -webkit-box;
	  display: -webkit-flex;
	  display: -ms-flexbox;
	  display: flex;
	}
	
.tick {
    color: #000000;
    font-size: 9px;
    height: 11px;
    left: 0;
    line-height: 11px;
    margin-left: -24px;
    position: absolute;
    text-align: center;
  	letter-spacing: 0px;
  	width: 50px;
}


.hide {
    display: none !important;
}
.slider {
    width: 100% !important;
    box-shadow: none !important;
    margin-top: 10px;
}
.slider-track {
    background-color: #eee !important;
    background-image: none !important;
}
.slider-selection {
    background: #fbce00 !important;
}
.slider-handle {
    opacity: 1 !important;
}

#emi input[type="text"] {
   margin-top: 0px;
	color: #172460;
	font-weight: bold;
	text-align: center;
	float: right;
	width: 100%;
	height: 40px;
	padding: 0px 10px !important;
	letter-spacing: 2px;
	border-radius: 0;
    border: 1px solid #d8d8d8;
    font-size: 14px;
}
.calc_div {
	margin: 0px auto;    
	background-color:#fff;
	margin-bottom: 5%;
	margin-top: 2%;
	box-shadow: 0px 0px 10px 5px #ccc;
	border-radius: 10px;
	padding-top: 3%;
}
#emi {
    float: left;
    width: 100%;
    border-right: 1px dotted #aaa;
    background: #fff;
    padding-right:30px;
}
.inside_emi {
    padding: 20px 30px;
}
.small_line {
    border-bottom: 1px dotted #aaa;
} 
#emipaymentsummary h4 {
    color: #333;
    font-size: 14px;
    margin: 0px;
    line-height: 25px;
    font-weight: normal;    
}
.emitotalinterest {
    border-bottom: 1px dotted #aaa;
    padding: 10px;
    text-align: center;
}
#emipaymentsummary {
    float: left;
    width: 100%;
    background: #fff;
}
#emipiechart {
    height: 300px;
    overflow: hidden;
    width: 100%;
    margin-bottom: 10px;
    text-align: center;
}
#emipaymentsummary p {
    font-size: 18px;
    font-weight: bold;
    color: #000;        
}

.steps {
	border-color: rgba(0, 0, 0, 0);
	border-style: none solid;
	border-width: 0 1px;
	margin: 0px 0px 35px !important;
	position: relative;
	width: 100%;
}

.highcharts-title tspan {
	letter-spacing: 0px;
}

.slider-handle{
	background-color: #fff;
    border: 2px solid #fbce00;
}

.inside_emi .ques{
	font-family: "Poppins", sans-serif;
    float: left;
    font-weight: 500 !important;
    color: #999;
    font-size: 0.84rem;
    padding-bottom: 5px;
}

.ques{
	font-family: "Poppins", sans-serif;
    font-weight: 500 !important;
    color: #999;
    padding-bottom: 5px;
}

.envision_action{
	font-family: "Poppins", sans-serif;
    font-size: 16px;
    text-decoration: underline;
    color: #ffffff;
    text-decoration-color: #f14141;
}

#tenurechoice {
    float: left;
    margin-left: 20px;
}

.toggle {
    background: url(../img/toggle-closed.webp) no-repeat scroll 50% 50% rgba(0,0,0,0);
    cursor: pointer;
}
.toggle-open {
    background: url(../img/toggle-open.webp) no-repeat scroll 50% 50% rgba(0,0,0,0);
    cursor: pointer;
}
.member .member__info .member__job {
	font-size: 1.3rem;
}

.member_detail {
    font-size: 0.99rem !important;
    line-height: 25px;
}

.member__info_detail {
	padding: 25px 30px !important;
}

.form-control {
    font-size: 14px;
    height: 45px;
    padding: 0 20px;
    background-color: #f9fafb;
    border: 1px solid #e5e7eb;
    width: 100%;
    border-radius: 12px;
    transition: all 0.2s;
}
.form-control:focus {
    background: #fff;
    border-color: #009899;
    box-shadow: 0 0 0 4px rgba(0,152,153,0.1);
    outline: none;
}
.btn {
    height: 45px;
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
.form-group {

    margin-bottom: 0px;
}

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
  
  /* Result Table Teal Gradient */
  .premium-result-card {
    background: linear-gradient(135deg, #009899 0%, #007A7A 100%);
    border-radius: 24px;
    color: #ffffff;
    box-shadow: 0 20px 40px rgba(0,152,153,0.2);
    border: none;
    overflow: hidden;
    padding: 0;
  }
  .premium-result-card table th, 
  .premium-result-card table td {
    color: white !important;
    border-color: rgba(255,255,255,0.1);
  }
  
/********************* Tools and calc end ******************/
</style>

<script type="text/javascript">
var accountMap = "";

$(document).ready(function(){

	var childName1 = '${childName1}';
	var childName2 = '${childName2}';
	var childAge1 = '${childAge1}';
	var childAge2 = '${childAge2}';
	var profEduAge1 = '${profEduAge1}';
	var profEduAge2 = '${profEduAge2}';
	var eduAmount1 = '${eduAmount1}';
	var eduAmount2 = '${eduAmount2}';
	var priceIncRate = '${priceIncRate}';
	var rateOfReturn = '${rateOfReturn}';
	var investAmount = '${investAmount}';
	accountMap = '${accountMap}';	
	
	$('#childName1').val(childName1);
    $('#childName2').val(childName2);
    $('#childAge1').val(childAge1);
    $('#childAge2').val(childAge2);
    $('#profEduAge1').val(profEduAge1);
    $('#profEduAge2').val(profEduAge2);
    $('#eduAmount1').val(eduAmount1);
    $('#eduAmount2').val(eduAmount2);
    $('#priceIncRate').val(priceIncRate);
    $('#rateOfReturn').val(rateOfReturn);
    $('#investAmount').val(investAmount);
    
    calculateEduAmount();
	
});


function downloadResult()
{
	
	var childName1 = $('#childName1').val();
    var childName2 = $('#childName2').val();
    var childAge1 = $('#childAge1').val();
    var childAge2 = $('#childAge2').val();
    var profEduAge1 = $('#profEduAge1').val();
    var profEduAge2 = $('#profEduAge2').val();
    var eduAmount1 = $('#eduAmount1').val();
    var eduAmount2 = $('#eduAmount2').val();
    var priceIncRate = $('#priceIncRate').val();
    var rateOfReturn = $('#rateOfReturn').val();
    var investAmount = $('#investAmount').val();
    
    if($('#result').css('display') == 'none')
    { 
    	alert("Please fill all the fields");
    	return;
    }
	
	var child_total_amount = $("#child_total_amount").html();
	var child_1_year = $("#child_1_year").html();
	var child_1_increase_amount = $("#child_1_increase_amount").html();
	var child_total_increase_amount = $("#child_total_increase_amount").html();
	var child_1_invest_amount = $("#child_1_invest_amount").html();
	var child_total_invest_amount = $("#child_total_invest_amount" ).html();
	var child_1_monthly_amount = $("#child_1_monthly_amount").html();
	var child_total_monthly_amount = $("#child_total_monthly_amount").html();
	var child_2_year = $("#child_2_year").html();
	var child_2_increase_amount = $("#child_2_increase_amount").html();
	var child_2_invest_amount = $("#child_2_invest_amount").html();
	var child_2_monthly_amount = $("#child_2_monthly_amount").html();
	
	eduAmount1 = numbersWithComma(eduAmount1);
	eduAmount2 = numbersWithComma(eduAmount2);
	investAmount = numbersWithComma(investAmount);
	var calc_url = window.location.href;
	
	
		var param = "?childName1="+childName1+"&childName2="+childName2+"&childAge1="+childAge1+"&childAge2="+childAge2+"&profEduAge1="+profEduAge1+"&profEduAge2="+profEduAge2;
		param += "&eduAmount1="+eduAmount1+"&eduAmount2="+eduAmount2+"&priceIncRate="+priceIncRate+"&rateOfReturn="+rateOfReturn+"&investAmount="+investAmount;
		param += "&child_total_amount="+child_total_amount+"&child_1_year="+child_1_year+"&child_1_increase_amount="+child_1_increase_amount+"&child_total_increase_amount="+child_total_increase_amount;
		param += "&child_1_invest_amount="+child_1_invest_amount+"&child_total_invest_amount="+child_total_invest_amount+"&child_1_monthly_amount="+child_1_monthly_amount;
		param += "&child_total_monthly_amount="+child_total_monthly_amount+"&child_2_year="+child_2_year+"&child_2_increase_amount="+child_2_increase_amount;
		param += "&child_2_invest_amount="+child_2_invest_amount+"&child_2_monthly_amount="+child_2_monthly_amount+"&url="+calc_url;
		
		var url = '/tools-and-calculators/downloadEducationPlannerCalcResult'+param;
		window.location = url;
		
		$('#send_email_model').modal('hide');
        setTimeout(function(){
        	swal({title:"",text:"Thanks for the Download."});
    	},1000);
	
}

function calculateEduAmount() 
{
    var childName1 = $('#childName1').val();
    var childName2 = $('#childName2').val();
    var childAge1 = $('#childAge1').val();
    var childAge2 = $('#childAge2').val();
    var profEduAge1 = $('#profEduAge1').val();
    var profEduAge2 = $('#profEduAge2').val();
    var eduAmount1 = $('#eduAmount1').val();
    var eduAmount2 = $('#eduAmount2').val();
    var priceIncRate = $('#priceIncRate').val();
    var rateOfReturn = $('#rateOfReturn').val();
    var investAmount = $('#investAmount').val();
    
    childName1 = $.trim(childName1);
    childName2 = $.trim(childName2);
    childAge1 = $.trim(childAge1);
    childAge2 = $.trim(childAge2);
    profEduAge1 = $.trim(profEduAge1);
    profEduAge2 = $.trim(profEduAge2);
    eduAmount1 = $.trim(eduAmount1);
    eduAmount2 = $.trim(eduAmount2);
    priceIncRate = $.trim(priceIncRate);
    rateOfReturn = $.trim(rateOfReturn);
    investAmount = $.trim(investAmount);
    
   	if(childName1 == "")
    {
    	alert("Please enter valid child name1");
    	return false;
    }
   	if(childAge1 == "" || childAge1 < 0)
    {
    	alert("Please enter valid child current Age1");
    	return false;
    }
    if(profEduAge1 == "" || profEduAge1 < 0)
    {
    	alert("Please enter valid child professional education Age1");
    	return false;
    }
   	if(eduAmount1 == "" || eduAmount1 < 0)
    {
    	alert("Please enter valid child need education amount1");
    	return false;
    }
    if(childName2 != "")
    {
    	if(childAge2 == "" || childAge2 < 0)
        {
        	alert("Please enter valid child current Age2");
        	return false;
        }
    	if(profEduAge2 == "" || profEduAge2 < 0)
        {
    		alert("Please enter valid professional education Age2");
        	return false;
        }
    	if(eduAmount2 == "" || eduAmount2 < 0)
        {
    		alert("Please enter valid child need education amount2");
        	return false;
        }
    }
    if(priceIncRate == "" || priceIncRate < 5 || priceIncRate > 15)
    {
    	alert("Please enter price increase rate between 5  to 15");
    	return false;
    }
    if(rateOfReturn == "" || priceIncRate < 5 || priceIncRate > 20)
    {
    	alert("Please enter rate of return between 5  to 20");
    	return false;
    }
    if(investAmount == "" || investAmount < 0)
    {
    	alert("Please enter valid current investment amount");
    	return false;
    }
    
    var child_count = 0;
    if(childName1 != "")
    {
    	child_count++;
    }
    if(childName2 != "")
    {
    	child_count++;
    }
    
    if(childAge2 == "")
    {
    	childAge2 = 0;
    }
	if(profEduAge2 == "")
    {
		profEduAge2 = 0;
    }
	if(eduAmount2 == "")
    {
		eduAmount2 = 0;
    }
        
    childAge1 = parseInt(childAge1);
    childAge2 = parseInt(childAge2);
    profEduAge1 = parseInt(profEduAge1);
    profEduAge2 = parseInt(profEduAge2);
    eduAmount1 = parseInt(eduAmount1);
    eduAmount2 = parseInt(eduAmount2);
    priceIncRate = parseFloat(priceIncRate, 10);
    rateOfReturn = parseFloat(rateOfReturn, 10);
    investAmount = parseInt(investAmount);
    
	var total_education_amount = "";
	var child1_prof_education_age = "";
	var child2_prof_education_age = "";
	var child1_inflation_adjust_education_amount = "";
	var child2_inflation_adjust_education_amount = "";
	var toal_inflation_adjust_education_amount = "";
	var child1_savings_amount = "";
	var child2_savings_amount = "";
	var total_savings_amount = "";
	var child1_monthly_savings = "";
	var child2_monthly_savings = "";
	var total_monthly_savings = "";
    
	$.ajaxSetup({async:false});
	$.post("/tools-and-calculators/getEducationPlannerResult", {child1_name : "" + childName1 + "",child2_name : "" + childName2 + "",child1_current_age : "" + childAge1 + "",child2_current_age : "" + childAge2 + "",child1_education_age : "" + profEduAge1 + "",child2_education_age : "" + profEduAge2 + "",child1_education_amount : "" + eduAmount1 + "",child2_education_amount : "" + eduAmount2 + "",inflation_rate : "" + priceIncRate + "",expected_return : "" + rateOfReturn + "",savings_amount : "" + investAmount + ""}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status == 400)
		{
			alert(obj.msg);
			return false;
		}
		
		total_education_amount = obj.total_education_amount;
		child1_prof_education_age = obj.child1_prof_education_age;
		child2_prof_education_age = obj.child2_prof_education_age;
		child1_inflation_adjust_education_amount = obj.child1_inflation_adjust_education_amount;
		child2_inflation_adjust_education_amount = obj.child2_inflation_adjust_education_amount;
		toal_inflation_adjust_education_amount = obj.toal_inflation_adjust_education_amount;
		child1_savings_amount = obj.child1_savings_amount;
		child2_savings_amount = obj.child2_savings_amount;
		total_savings_amount = obj.total_savings_amount;
		child1_monthly_savings = obj.child1_monthly_savings;
		child2_monthly_savings = obj.child2_monthly_savings;
		total_monthly_savings = obj.total_monthly_savings;
		
    },'text');
	
	$('#child_1_name').html(childName1);
	$('#child_1_amount').html(numbersWithComma(eduAmount1));
	$('#child_total_amount').html(numbersWithComma(total_education_amount));
	$('#child_1_year').html(child1_prof_education_age);
	$('#expect_interest_rate_1').html(rateOfReturn);
	$('#child_1_increase_amount').html(numbersWithComma(child1_inflation_adjust_education_amount));
	$('#child_total_increase_amount').html(numbersWithComma(toal_inflation_adjust_education_amount));
	$('#child_1_invest_amount').html(numbersWithComma(child1_savings_amount));
	$('#child_total_invest_amount').html(numbersWithComma(total_savings_amount));
	$('#child_1_monthly_amount').html(numbersWithComma(child1_monthly_savings));
	$('#child_total_monthly_amount').html(numbersWithComma(total_monthly_savings));
	
	if (childName2 != "") 
	{
		$('#child_2_name').html(childName2);
		$('#child_2_amount').html(numbersWithComma(eduAmount2));
		$('#child_2_year').html(child2_prof_education_age);
		$('#expect_interest_rate_2').html(rateOfReturn);
		$('#child_2_increase_amount').html(numbersWithComma(child2_inflation_adjust_education_amount));
		$('#child_2_invest_amount').html(numbersWithComma(child2_savings_amount));
		$('#child_2_monthly_amount').html(numbersWithComma(child2_monthly_savings));
	}else{
		$('#child_2_name').html("-");
		$('#child_2_amount').html("-");
		$('#child_2_year').html(0);
		$('#expect_interest_rate_2').html("-");
		$('#child_2_increase_amount').html("-");
		$('#child_2_invest_amount').html("-");
		$('#child_2_monthly_amount').html("-");
	}
	
    $('#result').show();
    $(".result_btn").show();
}
function saveResult() 
{	
	var childName1 = $('#childName1').val();
    var childName2 = $('#childName2').val();
    var childAge1 = $('#childAge1').val();
    var childAge2 = $('#childAge2').val();
    var profEduAge1 = $('#profEduAge1').val();
    var profEduAge2 = $('#profEduAge2').val();
    var eduAmount1 = $('#eduAmount1').val();
    var eduAmount2 = $('#eduAmount2').val();
    var priceIncRate = $('#priceIncRate').val();
    var rateOfReturn = $('#rateOfReturn').val();
    var investAmount = $('#investAmount').val();
	
	var title = "Child Education Planner - Plan education of 2 children";
	var url = "/tools-and-calculators/children-education-planner?childName1="+childName1+"&childName2="+childName2+"&childAge1="+childAge1+"&childAge2="+childAge2+"&profEduAge1="+profEduAge1+"&profEduAge2="+profEduAge2+"&eduAmount1="+eduAmount1+"&eduAmount2="+eduAmount2+"&priceIncRate="+priceIncRate+"&rateOfReturn="+rateOfReturn+"&investAmount="+investAmount;
	
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
  .premium-result-card .table {
    color: #ffffff !important;
  }
  .premium-result-card .table td, 
  .premium-result-card .table th {
    border-color: rgba(255,255,255,0.1);
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

<main>
<section class="premium-calculator-hero text-center">
  <div class="container">
    <div class="hero-label">Tools &amp; Calculators</div>
    <h1>Children Education Planner</h1>
    <p>Ensure a bright future for your child by estimating future costs and required savings.</p>
  </div>
</section>
 
 
        <!-- Section -->
        <section class="bg-light pt-5" id="mfResearch" style="position:relative; z-index:1;">
            <div class="container py-5">
                <div class="row justify-content-lg-between">
                <div class="col-lg-12 sr-child">
                <div class="row align-items-center mb-5">
					<div class="col-sm-8 ">
							<h3 style="font-weight:700; color:#1a1f2e;">Children Education Planner</h3>
							<p style="color:#4b5563;">Ensure a bright future for your child with our Children Education Planner! This tool helps you estimate the future cost of education by considering factors like current education costs, inflation, expected returns on investments, and your savings.</p>
					</div>
				<div class="col-sm-4 text-end">
					<button type="button" class="btn rounded-pill px-4 py-2 text-white" onclick="downloadResult()" data-loading-text="Please wait..." style="background:#009899; border:none; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">
						<i class="fa fa-download me-2"></i> Download
					</button>
				</div>
			</div>
                        <div class="row calculator">
                            <div class="col-sm-12 my-3">
                                <div class="premium-glass-card p-4 pb-0">
                                
                                				   	<div class="table-responsive" id="input_table">
				   	<table class="table table-striped table-bordered" style="background:transparent;">
				   	<tbody style="border-top:none;">
					<tr>
						<td class="ques fw-bold text-dark">Enter your first child name</td>
						<td>
							<div class="form-group"> 
				            	<input id="childName1" maxlength="45" type="text" class="form-control premium-calc-input"  placeholder="Enter the first child name">
				          	</div>
						</td>
					</tr>
					<tr>
						<td class="ques fw-bold text-dark">Enter your second child name</td>
						<td>
							<div class="form-group"> 
				            	<input id="childName2" maxlength="45" type="text" class="form-control premium-calc-input"  placeholder="Enter the second child name">
				          	</div>
						</td>
					</tr>
					<tr>
						<td class="ques fw-bold text-dark">Enter your first child current age (in years)</td>
						<td>
							<div class="form-group"> 
				            	<input id="childAge1" maxlength="2" type="text" class="form-control premium-calc-input"  placeholder="Enter the first child age">
				          	</div>
						</td>
					</tr>
					<tr>
						<td class="ques fw-bold text-dark">Enter your second child current age (in years)</td>
						<td>
							<div class="form-group"> 
				            	<input id="childAge2" maxlength="2" type="text" class="form-control premium-calc-input"  placeholder="Enter the second child age">
				          	</div>
						</td>
					</tr>
					<tr>
					    <td class="ques fw-bold text-dark">Enter the age at which your first child would be ready for professional education (in years)</td>
					    <td>
					    	<div class="form-group"> 
				            	<input id="profEduAge1" maxlength="2" type="text" class="form-control premium-calc-input"  placeholder="Enter first child prof edu age">
				          	</div>
					    </td>
					</tr>
					<tr>
					    <td class="ques fw-bold text-dark">Enter the age at which your second child would be ready for professional education (in years)</td>
					    <td>
					    	<div class="form-group"> 
				            	<input id="profEduAge2" maxlength="2" type="text" class="form-control premium-calc-input"  placeholder="Enter second child prof edu age">
				          	</div>
					    </td>
					</tr>
					<tr>
					    <td width="70%" class="ques fw-bold text-dark">Enter the amount you would need at today's cost to fulfil your first child educational needs (Rs)</td>
					    <td>
					    	<div class="form-group"> 
				            	<input id="eduAmount1" maxlength="7" type="text" class="form-control premium-calc-input"  placeholder="Enter first child edu amount">
				          	</div>
					    </td>
					</tr>
					<tr>
					    <td class="ques fw-bold text-dark">Enter the amount you would need at today's cost to fulfil your second child educational needs (Rs)</td>
					    <td>
					    	<div class="form-group"> 
				            	<input id="eduAmount2" maxlength="7" type="text" class="form-control premium-calc-input"  placeholder="Enter second child edu amount">
				          	</div>
					    </td>
					</tr>
					<tr>
					    <td class="ques fw-bold text-dark">The expected rate of inflation over the years (% per annum)</td>
					    <td>
					    	<div class="form-group"> 
				            	<input id="priceIncRate" maxlength="4" type="text" class="form-control premium-calc-input"  placeholder="Enter the inflation rate">
				          	</div>
					    </td>
					</tr>
					<tr>
					    <td class="ques fw-bold text-dark">What rate of return would you expect your investment? (% per annum)</td>
					    <td>
					    	<div class="form-group"> 
				            	<input id="rateOfReturn" maxlength="4" type="text" class="form-control premium-calc-input"  placeholder="Enter the return rate">
				          	</div>
					    </td>
					</tr>
					<tr>
					    <td class="ques fw-bold text-dark">How much savings you have now? (Rs)</td>
					    <td>
					    	<div class="form-group"> 
				            	<input id="investAmount" maxlength="7" type="text" class="form-control premium-calc-input"  placeholder="Enter the savings amount">
				          	</div>
					    </td>
					</tr>
					<tr id="submit_btn_row" style="border:none;">
					    <td colspan="2" style="border:none;">
					    <div class="text_center text-center mt-3 mb-3">
					    	<a class="btn rounded-pill px-5 py-2 text-white" href="javascript:void(0);" onclick="calculateEduAmount()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Calculate Now</a>
					    </div>
					    </td>
					</tr>
					</tbody>
					</table>
					</div>
                                   
                                </div>
                            </div>

                        </div>
                        
                        
                        <!--  <div class="row">
							<div class="col-sm-12 text-right">
								<a href="javascript:void(0);" class="btn-sm btn-primary" tabindex="0" onclick="downloadResult()">
			                      <span>Download</span>
			                      <i class="icon-arrow-right"></i>
			                    </a>
							</div>
						</div> -->
                        <div class="row calculator sr-section" data-sr-reveal-delay="0.3s">
                            <div class="col-sm-12 my-3">
                                <div class="premium-result-card">
                                						<div class="table-responsive" id="result">
					<table id="result-table-1" class="table mb-0" cellspacing="0" width="100%" style="font-family: 'Poppins', sans-serif;font-size: 14px; background:transparent;">
				   	<thead>
				   	<tr>
					  <th colspan="4" style="background: rgba(0,0,0,0.1); border:none;"><div class="text-center py-2 h5 mb-0 text-white fw-bold">Result</div></th>
					</tr>
					<tr style="background: rgba(255,255,255,0.05);">
					  <th width="35%" style="border-color:rgba(255,255,255,0.1);">Education Planner</th>
					  <th width="22%" style="border-color:rgba(255,255,255,0.1);">Cost of <span id="child_1_name"></span>'s education</th>
					  <th width="22%" style="border-color:rgba(255,255,255,0.1);">Cost of <span id="child_2_name"></span>'s education</th>
					  <th width="21%" style="border-color:rgba(255,255,255,0.1);">Total cost for both</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					  <td width="35%" style="border-color:rgba(255,255,255,0.1);">Amount at today's prices</td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_1_amount"></span></td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_2_amount"></span></td>
					  <td width="21%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_total_amount"></span></td>
					</tr>
					<tr>
					  <td width="35%" style="border-color:rgba(255,255,255,0.1);">Your child will take up professional education in</td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);"><span id="child_1_year"></span> year(s)</td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);"><span id="child_2_year"></span> year(s)</td>
					  <td width="21%" style="border-color:rgba(255,255,255,0.1);"> - </td>
					</tr>
					<tr>
					  <td width="35%" style="border-color:rgba(255,255,255,0.1);">Expected rate of return from investments (% per annum)</td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);"><span id="expect_interest_rate_1"></span> %</td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);"><span id="expect_interest_rate_2"></span> %</td>
					  <td width="21%" style="border-color:rgba(255,255,255,0.1);"> - </td>
					</tr>
					<tr>
					  <td width="35%" style="border-color:rgba(255,255,255,0.1);">Future cost of education (Inflation adjusted)</td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_1_increase_amount"></span></td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_2_increase_amount"></span></td>
					  <td width="21%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_total_increase_amount"></span></td>
					</tr>
					<tr>
					  <td width="35%" style="border-color:rgba(255,255,255,0.1);">Your current savings amount</td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_1_invest_amount"></span></td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_2_invest_amount"></span></td>
					  <td width="21%" style="border-color:rgba(255,255,255,0.1);">Rs. <span id="child_total_invest_amount"></span></td>
					</tr>
					<tr style="background: rgba(255,255,255,0.1);">
					  <td width="35%" style="border-color:rgba(255,255,255,0.1); font-weight:bold;">Monthly Savings required</td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1); font-weight:bold;">Rs. <span id="child_1_monthly_amount"></span></td>
					  <td width="22%" style="border-color:rgba(255,255,255,0.1); font-weight:bold;">Rs. <span id="child_2_monthly_amount"></span></td>
					  <td width="21%" style="border-color:rgba(255,255,255,0.1); font-weight:bold;">Rs. <span id="child_total_monthly_amount"></span></td>
					</tr>
					</tbody>
					</table>
					</div>
                                </div>
                           </div>
                       </div>
                        
                        
                    </div>

                    
                </div>
            </div>
            <div class="container">
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