<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="/vendors/nice-selector/css/nice-select.css">
<script src="/vendors/nice-selector/js/jquery.nice-select.min.js"></script>

<style>
.member {
    box-shadow: 0px 5px 83px 0px rgb(9 29 62 / 15%);
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


.counton-panel-header {
    background-color: #529100!important;
    color: #fff!important;
    font-size: 1rem!important;
}

/****new change**********/
.card-header:first-child {
    border-radius: 0.4rem 0.4rem 0 0;
}
.mf-research-header {
    background: #20C7BA;
    color: #ffffff;
    font-size: 14px;
    padding: 10px;
}
.card {
    box-shadow: 0 0 0 0.05rem rgb(8 60 130 / 6%), 0 0 1.25rem rgb(30 34 40 / 4%);
    border: 0;
}
.form-group {
    position: relative;
    margin-bottom: 4px;
}

table.dataTable tbody tr, table.dataTable tbody td {
    padding: 10px 18px;
    color: #60697b;
}
.mf-research-table th, .mf-research-table td {
    font-size: 13px;
}
label {
    font-weight: normal;
}

.nice-select {
    width: 100%;
    height: 45px;
    line-height: 43px;
    border-radius: 10px;
    margin-bottom: 0;
}
.btn {
    height: 45px;
}
.btn__rounded {
    border-radius: 10px;
}
.mf-research-table thead {
    background: #97e1e9;
}

table.dataTable tbody tr {
    background-color: #fff;
}

.table-striped tbody tr:nth-of-type(odd) {
    background-color: rgba(164, 174, 198, 0.07);
}

.mf-research-table tfoot {
    background: #d9f6f9;
}

.mf-research-table a {
	color: #000;
}
.table {
    color: #60697b;
}

.paginate_button {
    padding: 0px !important;
    font-size: 13px;
}

.dataTables_info {
    font-size: 13px;
}
.dataTables_wrapper .dataTables_paginate {
    float: right;
    text-align: right;
    padding-top: 0.45em;
}
.member .member__info {
    padding: 30px 25px;
}
.dataTables_wrapper .dataTables_filter input {
    border: 1px solid #aaa;
    border-radius: 3px;
    padding: 5px;
    background-color: transparent;
    margin-left: 3px;
}
.dataTables_wrapper .dataTables_length select {
    border: 1px solid #aaa;
    border-radius: 3px;
    padding: 5px;
    background-color: transparent;
    padding: 4px;
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
.multiselect {
    border: solid 1px #e8e8e8;
    border-radius: 0;
    background-color: #f9f9f9;
    font-size: 14px;
}
.hidden {
    display: none!important;
}
.border {
    border: 1px solid #dee2e6!important;
}
table.table-bordered.dataTable tbody th, table.table-bordered.dataTable tbody td {
    border-bottom-width: 0;
}
table.table-bordered.dataTable th, table.table-bordered.dataTable td {
    border-left-width: 0;
}
.dropdown-menu{
	padding: 15px;
}
.datepicker.dropdown-menu th, .datepicker.datepicker-inline th, .datepicker.dropdown-menu td, .datepicker.datepicker-inline td {
    padding: 4px 5px;
    font-size: 13px;
}
.datepicker td, .datepicker th {
    text-align: center;
    width: 20px;
    height: 20px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    border: none;
}
  /* ── Premium Hero & Cards ─────────────────────────────── */
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
</style>

<c:set var="userAgent" value="${header['User-Agent']}" />
<input type="hidden" id="isMobileUserAgent" value="${not empty userAgent and fn:contains(userAgent, 'Mobile')}" />
<script>
var swp_count = "";
function changeAmcCompany()
{
    var amc = $("#sel_amc").val();
    
    $.ajaxSetup({async:true});
	$.post("/mutual-funds-research/getSchemeByAmc", {amc : "" + amc + ""}, function(data)
    {
		var scheme = $.trim(data);
		var scheme_obj = jQuery.parseJSON(scheme);
		var scheme_array = $.makeArray(scheme_obj);
		var html = "";
		for (var i = 0; i < scheme_array.length; i++)
	    {
			html += '<option value="' + scheme_array[i]+ '">' + scheme_array[i] + '</option>';
	    }
		$("#sel_scheme").html(html);
		$('#sel_scheme').niceSelect('update');
		
    },'text');
}
function checkInitDate()
{
	var scheme_name = $("#sel_scheme").val();
	var init_start_date = $("#txt_init_amount_start_date").val();
	
	if(init_start_date == "")
 	{
 		$("#adv-alert-msg").html("Please select lumpsum amount investement date.");
   	    $("#adv-alert").modal('show');
		return;
 	}
	var schemeName = encodeURIComponent(scheme_name);
	var init_date_arr = init_start_date.split("-");
	var init_date_str = init_date_arr[2] + "-" + init_date_arr[1] + "-" + init_date_arr[0];
	var init_date = new Date(init_date_str);
	var flag = false;
	
	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
    {
		var schemes = $.trim(data);
		var schemes_obj = jQuery.parseJSON(schemes);
		var schemes_array = $.makeArray(schemes_obj);
		var inception_date =  new Date(schemes_array[0]);
		if(init_date < inception_date)
		{
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a lumpsum amount investment date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
    },'text');
	
	if(flag)
	{
		return false;
	}
}

function checkSWPDate()
{
	var scheme_name = $("#sel_scheme").val();
	var from_date = $("#txt_from_date").val();
	if(from_date == "")
 	{
 		$("#adv-alert-msg").html("Please select SWP start date.");
   	    $("#adv-alert").modal('show');
		return;
 	}
	var schemeName = encodeURIComponent(scheme_name);
	var start_date_arr = from_date.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var start_date = new Date(start_date_str);
	var flag = false;
	
	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
    {
		var schemes = $.trim(data);
		var schemes_obj = jQuery.parseJSON(schemes);
		var schemes_array = $.makeArray(schemes_obj);
		var inception_date =  new Date(schemes_array[0]);
		if(start_date < inception_date)
		{
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a SWP start date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
    },'text');
	
	if(flag)
	{
		return false;
	}
}
function getData()
{
	var amc = $("#sel_amc").val();
    var scheme_name = $("#sel_scheme").val();
    var initial_amount = $("#txt_init_amount").val();
    var init_start_date = $("#txt_init_amount_start_date").val();
    var withdrawal_amount = $("#txt_withdrawal_amount").val();  
    var amount_increase = $("#sel_amount_yearly_increase").val();
    var period = $("#sel_period").val();
    var from_date = $("#txt_from_date").val();
    var to_date = $("#txt_to_date").val();
    
 	if(initial_amount == "" || withdrawal_amount == "" || init_start_date == "" || from_date == "" || to_date == "")
 	{
 		$("#adv-alert-msg").html("All fields are mandatory");
   	    $("#adv-alert").modal('show');
		return;
 	}
	if(isNaN(initial_amount) || parseInt(initial_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid initial amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(isNaN(withdrawal_amount) || parseInt(withdrawal_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid transfer amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(parseInt(withdrawal_amount) < 500)
	{
		$("#adv-alert-msg").html("Withdrawal amount should be greater than 500");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(parseInt(initial_amount) <= parseInt(withdrawal_amount))
	{
		$("#adv-alert-msg").html("Please enter the initial amount greater than transfer amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	
	var init_date_arr = init_start_date.split("-");
	var init_date_str = init_date_arr[2] + "-" + init_date_arr[1] + "-" + init_date_arr[0];
	var start_date_arr = from_date.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var end_date_arr = to_date.split("-");
	var end_date_str = end_date_arr[2] + "-" + end_date_arr[1] + "-" + end_date_arr[0];
	
	var init_date = new Date(init_date_str);
	var start_date = new Date(start_date_str);
	var startDate = new Date(start_date_str);
	var end_date = new Date(end_date_str);
	
	if(start_date < init_date)
	{
		$("#adv-alert-msg").html("Please select SWP start date less than intial amount start date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(end_date <= start_date)
	{
		$("#adv-alert-msg").html("Please select valid start date and end date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(period == "Weekly")
	{
		start_date.setDate(start_date.getDate() + 7);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Fortnightly")
	{
		start_date.setDate(start_date.getDate() + 15);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Monthly")
	{
		start_date.setMonth(start_date.getMonth() + 1);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Quarterly")
	{			
		start_date.setMonth(start_date.getMonth() + 3);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	
	var schemeName = encodeURIComponent(scheme_name);
	var flag = false;
	
	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
    {
		var schemes = $.trim(data);
		var schemes_obj = jQuery.parseJSON(schemes);
		var schemes_array = $.makeArray(schemes_obj);
		var inception_date =  new Date(schemes_array[0])
		if(startDate < inception_date)
		{
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a SWP start date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
		if(init_date < inception_date && flag == false)
		{
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a lumpsum amount investment date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
    },'text');
	
	if(flag)
	{
		return false;
	}
	
	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getSchemeCategory", {scheme_name : "" + schemeName + ""}, function(data)
    {
		var category = $.trim(data);
		//alert("category--->"+category);
		
		if(category == "Equity: ELSS")
		{
			var init_date = new Date(init_date_str);
			var start_date = new Date(start_date_str);
			init_date.setFullYear(init_date.getFullYear() + 3);
			
			if(start_date < init_date)
			{
				$("#adv-alert-msg").html("ELSS schemes are locked-in for 3 years from the date of investment. SWP is not allowed during the lock-in period.");
		   	    $("#adv-alert").modal('show');
		   	 	flag = true;
				return false;
			}
		}
		
    },'text');
	
	if(flag)
	{
		return false;
	}
	
	amc = encodeURIComponent(amc);
	scheme_name = encodeURIComponent(scheme_name);
	
 	top.location = "/mutual-funds-research/swp-with-annual-increase?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date+"&amount_increase="+amount_increase;
}

$(document).ready(function(){
	
	$('.datepicker').datepicker({
		format: 'dd-mm-yyyy',
		endDate: '-1d',
		autoclose:true,
		disableTouchKeyboard:true
	}).on('changeDate', function(ev) {
		var ID = $(this).attr("id");
		if(ID == "txt_init_amount_start_date")
		{
			checkInitDate();
		}
		if(ID == "txt_from_date")
		{
			checkSWPDate();
		}
	});
	
	var amc = '${amc}';
	if(amc != '')
	{
		$("#sel_amc").val(amc);
		$('#sel_amc').niceSelect('update');
		//$("#sel_amc").selectpicker("refresh");
	}
	
	var swp_date = '${swp_date}';
	if(swp_date != '')
	{
		$("#sel_swp_date").val(swp_date);
		//$("#sel_swp_date").selectpicker("refresh");
	}
	
	var scheme_name = '${scheme_name}';
	if(scheme_name != '')
	{
		$("#sel_scheme").val(scheme_name);
		$('#sel_scheme').niceSelect('update');
		//$("#sel_scheme").selectpicker("refresh");
	}
	getInstallments();	
	
	$("#final_result").dataTable({
		"bPaginate": false,
		"bFilter": false,
		"bInfo": false,
		"bSort": false,
		 fixedHeader: {
	            headerOffset: 70
	        },
		"initComplete": function(settings, json) {
            var isMobileEl = document.getElementById("isMobileUserAgent");
            var isMobile = isMobileEl ? isMobileEl.value === "true" : false;
            if (isMobile) {
                var table = settings.oInstance.api();
                setTimeout(function(){
             	  table.rows(':not(.parent)').nodes().to$().find('td:first-child').trigger('click');
                }, 1000);
            }
        }
	});
	
	$("#swpTable").dataTable({
		"bPaginate": false,
		"bFilter": false,
		"bInfo": false,
		"bSort": false,
		 fixedHeader: {
	            headerOffset: 70
	        },
		"initComplete": function(settings, json) {
            var isMobileEl = document.getElementById("isMobileUserAgent");
            var isMobile = isMobileEl ? isMobileEl.value === "true" : false;
            if (isMobile) {
                var table = settings.oInstance.api();
                setTimeout(function(){
             	  table.rows(':not(.parent)').nodes().to$().find('td:first-child').trigger('click');
                }, 1000);
            }
        }
	});
});
function getInstallments() 
{	
	var swp_count = document.getElementById("swpTable").rows.length;
	swp_count = swp_count - 2;      
    //document.getElementById('swpInstallment').innerHTML= swp_count;  
    
    var last_date = $("#swpTable tr:last-child td:first-child").html();
    var current_value = $("#swpTable tr:last-child td:last-child").html();
    var initial_amount = $("#txt_init_amount").val();
    var withdrawal_amount = $("#txt_withdrawal_amount").val();
    var total_amount = parseInt(swp_count) * parseInt(withdrawal_amount);
    
    //document.getElementById('swp_withdraw_amount').innerHTML= commaSeparateNumber(total_amount);
    //document.getElementById('swp_current_value').innerHTML= current_value;
    document.getElementById('last_tran_date').innerHTML= last_date;
    document.getElementById('last_trans_date').innerHTML= last_date;
}
function commaSeparateNumber(x)
{
	x=x.toString();
	var afterPoint = '';
	if(x.indexOf('.') > 0)
	   afterPoint = x.substring(x.indexOf('.'),x.length);
	x = Math.floor(x);
	x=x.toString();
	var lastThree = x.substring(x.length-3);
	var otherNumbers = x.substring(0,x.length-3);
	if(otherNumbers != '')
	    lastThree = ',' + lastThree;
	var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
    return res;
}
function gotoTop()
{
	$('html,body').animate({
        scrollTop: 0
    }, 700);
}
function gotoLumpsumCalc()
{
	var scheme_name = $("#sel_scheme").val();
    var initial_amount = $("#txt_init_amount").val();
    var init_start_date = $("#txt_init_amount_start_date").val();
    var period = $("#sel_period").val();
    var from_date = $("#txt_from_date").val();
    var to_date = $("#txt_to_date").val();
    
 	if(initial_amount == "" || init_start_date == "" || from_date == "" || to_date == "")
 	{
 		$("#adv-alert-msg").html("All fields are mandatory");
   	    $("#adv-alert").modal('show');
		return;
 	}
	if(isNaN(initial_amount) || parseInt(initial_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid initial amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	
	var init_date_arr = init_start_date.split("-");
	var init_date_str = init_date_arr[2] + "-" + init_date_arr[1] + "-" + init_date_arr[0];
	var start_date_arr = from_date.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var end_date_arr = to_date.split("-");
	var end_date_str = end_date_arr[2] + "-" + end_date_arr[1] + "-" + end_date_arr[0];
	
	var init_date = new Date(init_date_str);
	var start_date = new Date(start_date_str);
	var startDate = new Date(start_date_str);
	var end_date = new Date(end_date_str);
	
	if(start_date < init_date)
	{
		$("#adv-alert-msg").html("Please select SWP start date less than intial amount start date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(end_date <= start_date)
	{
		$("#adv-alert-msg").html("Please select valid start date and end date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(period == "Daily")
	{
		start_date.setDate(start_date.getDate() + 1);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Weekly")
	{
		start_date.setDate(start_date.getDate() + 7);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Fortnightly")
	{
		start_date.setDate(start_date.getDate() + 15);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Monthly")
	{
		start_date.setMonth(start_date.getMonth() + 1);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Quarterly")
	{			
		start_date.setMonth(start_date.getMonth() + 3);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	
	scheme_name = encodeURIComponent(scheme_name);
	
 	top.location = "/mutual-funds-research/mutual-fund-lumpsum-returns-calculator?scheme="+scheme_name+"&amount="+initial_amount+"&startdate="+init_start_date+"&enddate="+to_date;
}
function gotoSIPCalc()
{
    var scheme_name = $("#sel_scheme").val();
    var initial_amount = $("#txt_init_amount").val();
    var init_start_date = $("#txt_init_amount_start_date").val();
    var swp_date = $("#sel_swp_date").val();
    var withdrawal_amount = $("#txt_withdrawal_amount").val();    
    var period = $("#sel_period").val();
    var from_date = $("#txt_from_date").val();
    var to_date = $("#txt_to_date").val();
    
 	if(initial_amount == "" || withdrawal_amount == "" || init_start_date == "" || from_date == "" || to_date == "")
 	{
 		$("#adv-alert-msg").html("All fields are mandatory");
   	    $("#adv-alert").modal('show');
		return;
 	}
	if(isNaN(initial_amount) || parseInt(initial_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid initial amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(isNaN(withdrawal_amount) || parseInt(withdrawal_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid transfer amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(parseInt(withdrawal_amount) < 500)
	{
		$("#adv-alert-msg").html("Withdrawal amount should be greater than 500");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(parseInt(initial_amount) <= parseInt(withdrawal_amount))
	{
		$("#adv-alert-msg").html("Please enter the initial amount greater than transfer amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	
	var init_date_arr = init_start_date.split("-");
	var init_date_str = init_date_arr[2] + "-" + init_date_arr[1] + "-" + init_date_arr[0];
	var start_date_arr = from_date.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var end_date_arr = to_date.split("-");
	var end_date_str = end_date_arr[2] + "-" + end_date_arr[1] + "-" + end_date_arr[0];
	
	var init_date = new Date(init_date_str);
	var start_date = new Date(start_date_str);
	var startDate = new Date(start_date_str);
	var end_date = new Date(end_date_str);
	
	if(start_date < init_date)
	{
		$("#adv-alert-msg").html("Please select SWP start date less than intial amount start date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(end_date <= start_date)
	{
		$("#adv-alert-msg").html("Please select valid start date and end date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(period == "Daily")
	{
		start_date.setDate(start_date.getDate() + 1);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Weekly")
	{
		start_date.setDate(start_date.getDate() + 7);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Fortnightly")
	{
		start_date.setDate(start_date.getDate() + 15);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Monthly")
	{
		start_date.setMonth(start_date.getMonth() + 1);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Quarterly")
	{			
		start_date.setMonth(start_date.getMonth() + 3);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}

	scheme_name = encodeURIComponent(scheme_name);
	
 	top.location = "/mutual-funds-research/mutual-fund-sip-investment-calculator?category=All&fund="+scheme_name+"&amount="+withdrawal_amount+"&frequency="+period+"&startdate="+from_date+"&enddate="+to_date;
}

function saveResult() 
{	
	var amc = $("#sel_amc").val();
    var scheme_name = $("#sel_scheme").val();
    var initial_amount = $("#txt_init_amount").val();
    var init_start_date = $("#txt_init_amount_start_date").val();
    var withdrawal_amount = $("#txt_withdrawal_amount").val();  
    var amount_increase = $("#sel_amount_yearly_increase").val();
    var period = $("#sel_period").val();
    var from_date = $("#txt_from_date").val();
    var to_date = $("#txt_to_date").val();
    
	var accountMap = '${accountMap}';
	var title = "SWP with Annual Increase -> AMC = " + amc + ", Scheme Name = " + scheme_name + ", Lumpsum Amount = " + initial_amount + ", Lumpsum Investment Date = " + init_start_date + ", Frequency = " + period + ", SWP Start Date = " + from_date + ", SWP End Date = " + to_date + " , Withdrawal Amount Yearly Increase = " + amount_increase + ", Withdrawal Amount = " + withdrawal_amount;
	var url = window.location;
	
	if(accountMap == undefined || accountMap == null || accountMap == "" || accountMap == "null")
	{
		advisorkhoj_result_title = title;
		advisorkhoj_result_url = window.location.href;
		
		$("#adv-contact-advisor-signin-signup").modal("show");
	}
	else
	{
		saveUserResult("MF Tools",title, url);
	}
}

function downloadExcel(){
	
	var amc = $("#sel_amc").val();
    var scheme_name = $("#sel_scheme").val();
    var initial_amount = $("#txt_init_amount").val();
    var init_start_date = $("#txt_init_amount_start_date").val();
    var withdrawal_amount = $("#txt_withdrawal_amount").val();  
    var amount_increase = $("#sel_amount_yearly_increase").val();
    var period = $("#sel_period").val();
    var from_date = $("#txt_from_date").val();
    var to_date = $("#txt_to_date").val();
    
 	if(initial_amount == "" || withdrawal_amount == "" || init_start_date == "" || from_date == "" || to_date == "")
 	{
 		$("#adv-alert-msg").html("All fields are mandatory");
   	    $("#adv-alert").modal('show');
		return;
 	}
	if(isNaN(initial_amount) || parseInt(initial_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid initial amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(isNaN(withdrawal_amount) || parseInt(withdrawal_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid transfer amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(parseInt(withdrawal_amount) < 500)
	{
		$("#adv-alert-msg").html("Withdrawal amount should be greater than 500");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(parseInt(initial_amount) <= parseInt(withdrawal_amount))
	{
		$("#adv-alert-msg").html("Please enter the initial amount greater than transfer amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	
	var init_date_arr = init_start_date.split("-");
	var init_date_str = init_date_arr[2] + "-" + init_date_arr[1] + "-" + init_date_arr[0];
	var start_date_arr = from_date.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var end_date_arr = to_date.split("-");
	var end_date_str = end_date_arr[2] + "-" + end_date_arr[1] + "-" + end_date_arr[0];
	
	var init_date = new Date(init_date_str);
	var start_date = new Date(start_date_str);
	var startDate = new Date(start_date_str);
	var end_date = new Date(end_date_str);
	
	if(start_date < init_date)
	{
		$("#adv-alert-msg").html("Please select SWP start date less than intial amount start date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(end_date <= start_date)
	{
		$("#adv-alert-msg").html("Please select valid start date and end date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(period == "Weekly")
	{
		start_date.setDate(start_date.getDate() + 7);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Fortnightly")
	{
		start_date.setDate(start_date.getDate() + 15);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Monthly")
	{
		start_date.setMonth(start_date.getMonth() + 1);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(period == "Quarterly")
	{			
		start_date.setMonth(start_date.getMonth() + 3);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	
	var schemeName = encodeURIComponent(scheme_name);
	var flag = false;
	
	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
    {
		var schemes = $.trim(data);
		var schemes_obj = jQuery.parseJSON(schemes);
		var schemes_array = $.makeArray(schemes_obj);
		var inception_date =  new Date(schemes_array[0])
		if(startDate < inception_date)
		{
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a SWP start date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
		if(init_date < inception_date && flag == false)
		{
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a lumpsum amount investment date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
    },'text');
	
	if(flag)
	{
		return false;
	}
	
	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getSchemeCategory", {scheme_name : "" + schemeName + ""}, function(data)
    {
		var category = $.trim(data);
		//alert("category--->"+category);
		
		if(category == "Equity: ELSS")
		{
			var init_date = new Date(init_date_str);
			var start_date = new Date(start_date_str);
			init_date.setFullYear(init_date.getFullYear() + 3);
			
			if(start_date < init_date)
			{
				$("#adv-alert-msg").html("ELSS schemes are locked-in for 3 years from the date of investment. SWP is not allowed during the lock-in period.");
		   	    $("#adv-alert").modal('show');
		   	 	flag = true;
				return false;
			}
		}
		
    },'text');
	
	if(flag)
	{
		return false;
	}
	
	amc = encodeURIComponent(amc);
	scheme_name = encodeURIComponent(scheme_name);
	
	//top.location = "/mutual-funds-research/swpWithAnnualIncrease?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date+"&amount_increase="+amount_increase;
	
	var path = "/mutual-funds-research/swpWithAnnualIncrease?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date+"&amount_increase="+amount_increase;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', path, true);
	xhr.responseType = 'text';
	xhr.onload = function () {
	    if (xhr.readyState === xhr.DONE) {
	        if (xhr.status === 200) {
	        	
	        	var contentType = xhr.getResponseHeader("Content-Type");
	        	if(contentType == "application/json;charset=ISO-8859-1"){
	        		var data = JSON.parse(xhr.response);
	        		alert(data.msg);
	    	    }
	    	    else{
	    	    	top.location =  "/mutual-funds-research/swpWithAnnualIncrease?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date+"&amount_increase="+amount_increase+"&download=yes";
	    	    }
	        }
	    }
	};
	xhr.send(null);
}

function openLogin(){
	
	var amc = $("#sel_amc").val();
    var scheme_name = $("#sel_scheme").val();
    var initial_amount = $("#txt_init_amount").val();
    var init_start_date = $("#txt_init_amount_start_date").val();
    var withdrawal_amount = $("#txt_withdrawal_amount").val();  
    var amount_increase = $("#sel_amount_yearly_increase").val();
    var period = $("#sel_period").val();
    var from_date = $("#txt_from_date").val();
    var to_date = $("#txt_to_date").val();
    
 	if(initial_amount == "" || withdrawal_amount == "" || init_start_date == "" || from_date == "" || to_date == "")
 	{
 		$("#adv-alert-msg").html("All fields are mandatory");
   	    $("#adv-alert").modal('show');
		return;
 	}
	if(isNaN(initial_amount) || parseInt(initial_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid initial amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(isNaN(withdrawal_amount) || parseInt(withdrawal_amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid transfer amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(parseInt(withdrawal_amount) < 500)
	{
		$("#adv-alert-msg").html("Withdrawal amount should be greater than 500");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(parseInt(initial_amount) <= parseInt(withdrawal_amount))
	{
		$("#adv-alert-msg").html("Please enter the initial amount greater than transfer amount");
   	    $("#adv-alert").modal('show');
		return;
	}
	
	var init_date_arr = init_start_date.split("-");
	var init_date_str = init_date_arr[2] + "-" + init_date_arr[1] + "-" + init_date_arr[0];
	var start_date_arr = from_date.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var end_date_arr = to_date.split("-");
	var end_date_str = end_date_arr[2] + "-" + end_date_arr[1] + "-" + end_date_arr[0];
	
	var init_date = new Date(init_date_str);
	var start_date = new Date(start_date_str);
	var startDate = new Date(start_date_str);
	var end_date = new Date(end_date_str);

	
	amc = encodeURIComponent(amc);
	scheme_name = encodeURIComponent(scheme_name);

	downloadPath = "/mutual-funds-research/swpWithAnnualIncrease?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date+"&amount_increase="+amount_increase;
	imageDownload = "no";
	chartId = "";
	filename = "";
	
	$("#adv-login").modal("show");
}
</script>
    <!-- ========================
       page title 
    =========================== -->
    <div class="page-hero-curved">
      <div class="container text-center position-relative" style="z-index:2">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb mb-3 justify-content-center">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item"><a href="/mutual-funds-research/top-performing-mutual-funds">Mutual Funds Research</a></li>
            <li class="breadcrumb-item active" aria-current="page">Mutual Fund Annual Returns</li>
          </ol>
        </nav>
        <div class="text-center">
          <span class="category-label">Research</span>
          <h1 class="mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Mutual Fund Annual Returns</h1>
        </div>
      </div>
      <div class="page-hero-curve-bottom"></div>
    </div>

    <!-- ========================
       Doctors Timetable
    ========================== -->


<div class="premium-calculator-hero text-center">
    <div class="container text-center">
        <div class="hero-label">MF Research</div>
        <h1 class="display-6 text-dark mb-4 animated slideInDown">SWP with Annual Increase</h1>
    </div>
</div>

    <section class="section py-5 bg-light pb-8">
      <div class="container">
        <div class="row">

          <div class="col-lg-12">
					<div class="col-lg-12 p-0">
				 		<div class="premium-glass-card mb-4 p-4">
						<h6 class="card-header mf-research-header d-none">
				        	<c:choose>
						  	<c:when test="${scheme eq ''}">
						  		SWP with Annual Increase">
						  	</c:when>
						  	<c:otherwise>
						  		SWP with Annual Increase - ${scheme}
						  	</c:otherwise>
						  	</c:choose>
						 </h6>
				        
				        <div class="card-body mf-research-body">
													<div class="row pl-4 pr-4">
      
				        <div class="col-md-4 col-sm-4">
				        	<div class="form-group">
				          	<label class="bold-smaller">Select AMC</label>
					        <select id="sel_amc" class="form-control" onchange="changeAmcCompany()" data-width="100%">
								<c:forEach items="${amcCompanies}" var="amc_name">
								<option value="<c:out value="${amc_name}"></c:out>"><c:out value="${amc_name}"></c:out></option>
								</c:forEach>
						    </select>
							</div>
						</div>
				        
				        <div class="col-md-4 col-sm-4">
				        	<div class="form-group">
						    <label class="bold-smaller">Select Scheme</label>
							<select id="sel_scheme" class="form-control" data-width="100%">
								<c:forEach items="${schemes}" var="scheme">
								<option value="<c:out value="${scheme}"></c:out>"><c:out value="${scheme}"></c:out></option>
								</c:forEach>
							</select>	
							</div>
				        </div>
				        
				        <div class="col-md-4 col-sm-4">
					          <div class="form-group">
					            <label class="bold-smaller width-100">Lumpsum Amount</label>
					            <input type="text" id="txt_init_amount" value="${initial_amount}" maxlength="8" class="form-control no-radius" />
					          </div>
					    </div>
				        
				        </div>
				        
				        <div class="row pl-4 pr-4 mt-20">
				        
				        	<div class="col-md-4 col-sm-4">
					          <div class="form-group">
					            <label class="bold-smaller">Lumpsum Amount Investement Date</label>
					            <input type="text" id="txt_init_amount_start_date" value="${init_start_date}" class="form-control datepicker no-radius" />
					          </div>
					        </div>
					        
					        <div class="col-md-4 col-sm-4">
					          <div class="form-group">
					            <label class="bold-smaller">Withdrawal Amount :</label>
					            <input type="text" id="txt_withdrawal_amount" value="${withdrawal_amount}" maxlength="6" class="form-control no-radius" />
					          </div>
					        </div>
					        
					        <div class="col-md-4 col-sm-4">
					          <div class="form-group">
					            <label class="bold-smaller">Withdrawal Amount Yearly Increase (%) :</label>
					            <select id="sel_amount_yearly_increase" class="form-control" data-width="100%">
									<option value="5" <c:if test="${amount_increase eq '5' }"><c:out value="selected" /></c:if>>5</option>
									<option value="10" <c:if test="${amount_increase eq '10' }"><c:out value="selected" /></c:if>>10</option>
									<option value="15" <c:if test="${amount_increase eq '15' }"><c:out value="selected" /></c:if>>15</option>
									<option value="20" <c:if test="${amount_increase eq '20' }"><c:out value="selected" /></c:if>>20</option>
									<option value="25" <c:if test="${amount_increase eq '25' }"><c:out value="selected" /></c:if>>25</option>
									<option value="50" <c:if test="${amount_increase eq '50' }"><c:out value="selected" /></c:if>>50</option>
									<option value="75" <c:if test="${amount_increase eq '75' }"><c:out value="selected" /></c:if>>75</option>
									<option value="100" <c:if test="${amount_increase eq '100' }"><c:out value="selected" /></c:if>>100</option>
								</select>
					          </div>
					        </div>
					        
						</div>
						
						<div class="row pl-4 pr-4 mt-20">
						
							<div class="col-md-3 col-sm-3">
					          <div class="form-group">
					            <label class="bold-smaller block">Select Period</label>
					            <select id="sel_period" class="form-control" data-width="100%">
									<option value="Weekly" <c:if test="${period eq 'Weekly' }"><c:out value="selected" /></c:if>>Weekly</option>
									<option value="Fortnightly" <c:if test="${period eq 'Fortnightly' }"><c:out value="selected" /></c:if>>Fortnightly</option>
					            	<option value="Monthly" <c:if test="${period eq 'Monthly' }"><c:out value="selected" /></c:if>>Monthly</option>
					            	<option value="Quarterly" <c:if test="${period eq 'Quarterly' }"><c:out value="selected" /></c:if>>Quarterly</option>
								</select>
					          </div>
					        </div>
					        
					        <div class="col-md-3 col-sm-3">
					          <div class="form-group">
					            <label class="bold-smaller">Select SWP Start Date</label>
					            <input type="text" id="txt_from_date" value="${from_date}" class="form-control datepicker no-radius" />
					          </div>
					        </div>
					        
					        <div class="col-md-3 col-sm-3">
					          <div class="form-group">
					            <label class="bold-smaller">Select SWP End Date</label>
					            <input type="text" id="txt_to_date" value="${to_date}" class="form-control margin-bottom10 datepicker no-radius" />
					          </div>
					        </div>
					        
					        <div class="col-md-3 col-sm-3 text-end">
					          	<div class="form-group mt-4">
					          	<label class="bold block hidden-xs">&nbsp;</label>
						      	<a href="javascript:void(0)" class="btn rounded-pill px-4 py-2 text-white w-100" onclick="getData()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Submit</a>
						    	</div>
					        </div>
					        
					        <div class="col-md-3">
					          
					        </div>
					        
					    </div>	
				        </div> 
	
				 		</div>
			 		</div>

				<div class="row">
				  	<div class="col-xs-12 col-md-12 col-sm-12 margin-bottom10 margin-top10">
			        	<h6 class="font-size-20 bold-smaller15 margin-bottom0 mb-3 mt-3" style="line-height: 25px;">Systematic Withdrawal Plan Calculator</h6>
			      	</div>
		      		</div>
		      		<div class="premium-glass-card p-4">
		      		
				<table class="adv-table table table-striped mf-research-table table-bordered" style="width:100%" id="final_result">
				<thead><tr>
				<th>Scheme</th>
				<th class="text-center">Withdrawal Period</th>
				<th class="text-center">No of ${period} Installments</th>
				<th class="text-center">Total Withdrawal Amount</th>
				<th class="text-center">Current Value as on <span id="last_tran_date"></span></th>
				<th class="text-center">Return (%) as on <span id="last_trans_date"></span></th>
				</tr></thead><tbody>
				<tr>
				<td><a href='/mutual-funds-research/<c:out value="${schemeMapping.scheme_amfi_url}"></c:out>' class="mutual-funds-anchor">${scheme_name}</a>
				
				</td>
				<td class="nowrap text-center">${from_date} to ${to_date}</td>
				<td class="text-center">${transfer_out_count}</td>
				<td class="text-center"><fmt:formatNumber value="${total_amount_transferred}" maxFractionDigits="0" /></td>
				<td class="text-center"><fmt:formatNumber value="${from_current_value}" maxFractionDigits="0" /></td>
				<td class="text-center"><fmt:formatNumber value="${from_returns}" maxFractionDigits="2" /></td>
				</tr>
				</tbody></table>
		
		        <div id="transaction_details">
				<h6 class='font-size-20 bold-smaller15 margin-bottom5 mt-3 mb-3'>${scheme_name}</h6>
				<table class="adv-table table table-striped mf-research-table table-bordered" style="width:100%" id="swpTable">
				<thead>
				<tr>
				<th class="text-center">Nav Date</th>
				<th class="text-center">Nav</th>
				<th class="text-center">Units</th>
				<th class="text-center">Cumulative Units</th>
				<th class="text-center">Cash Flow</th>
				<th class="text-center">Net Amount</th>
				<th class="text-center">Capital Gain/Loss</th>
				<th class="text-center">No. of Days<br>(Invested)</th>
				<th class="text-center">Current Value</th>
				</tr>
				<thead>
				<tbody>
				<c:forEach items="${from_scheme_list}" var="scheme">
				<tr>
				<td class="nowrap text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${scheme.nav_date}" /></td>
		    	<td class="text-center"><fmt:formatNumber value="${scheme.nav}" minFractionDigits="2" maxFractionDigits="2" /></td>
		    	<td class="text-center"><fmt:formatNumber value="${scheme.units}" maxFractionDigits="4" /></td>
		    	<td class="text-center"><fmt:formatNumber value="${scheme.cumulative_units}" maxFractionDigits="4" /></td>
		    	<td class="text-center"><fmt:formatNumber value="${scheme.cash_flow}" maxFractionDigits="0" /></td>
		    	<td class="text-center"><fmt:formatNumber value="${scheme.amount}" maxFractionDigits="0" /></td>
		    	<td class="text-center"><fmt:formatNumber value="${scheme.capital_gain}" minFractionDigits="2" maxFractionDigits="2" /></td>
		    	<td class="text-center"><fmt:formatNumber value="${scheme.no_of_days}" maxFractionDigits="0" /></td>
		    	<td class="text-center"><fmt:formatNumber value="${scheme.current_value}" maxFractionDigits="0" /></td>
		    	</tr>
				</c:forEach>
				</tbody>
				</table>
		       </div>
			   </div>
			 		
          </div><!-- /.col-lg-4 -->

        </div> <!-- /.row -->
      </div><!-- /.container -->
    </section><!-- /.Team layout 1  -->