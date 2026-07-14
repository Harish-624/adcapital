<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<style>
.paddingline{
         line-height:20px;
         margin-bottom:5px;
         text-align:justify;
         font-size:11px;
         color:#666;
}
.bg-blue-top{
	background: #098583 !important;
}
.bg-blue-top li, .bg-blue-top li a{
	color: #ffffff !important;
}
#div_fund_2,#div_fund_3, #div_fund_4,#div_fund_5 {
   display:none
}
.text-right{
	text-align:right;
}
.no-bold
{
	display: inline-block;
    margin-bottom: 0.5rem;
}
.form-group {
    margin-bottom: 1rem;
}
.sidebar-link{
	font-size: 14px;
	color: #003799;
	text-decoration: underline;
}
.btn-gradient.btn-sm{
	padding-top:5px;
	padding-bottom:5px;
}
.mf-research-header{
	background: #00ccc8;
	color: #ffffff;
	font-size: 14px;
	padding: 10px;
}
.mf-research-body{
	padding: 10px;
	padding-bottom: 20px;
}
.mf-research-body label, .mf-research-body .form-control-sm{
	font-size:14px;
}
.counton-table th, .counton-table td{
	font-size:13px;
}
.dataTables_wrapper label{
	font-size:14px;
}
.counton-table thead{
	background: #106d7c;
    color: #fff;
}
.counton-table tfoot{
	background: #d9f6f9;
}
.dataTables_filter{
	margin-bottom:1.25rem !important;
}
.dataTables_info{
	font-size: 13px;
}
.paginate_button{
	padding:0px !important;
    font-size: 13px;
}
.table{
 /*   display: block !important; */
   overflow-x: auto !important;
   width: 100% !important;
}
#more_funds_div_1
{
margin-top: 2%;
}
#more_funds_div_1 a
{
    font-size: 13px;
    font-weight: bold;
}
.margin-bottom0
{
	margin-bottom: 0%;
}
.mt3
{
    margin-top: -0.1rem !important;

}
.tableresponsive {
    -webkit-overflow-scrolling: touch;
    display: block !important;
    width: 100% !important;
    overflow-x: auto !important;
}
a.stepsAddmore {
    color: #349cbc;
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
		//$('#sel_scheme').niceSelect('update');
		//$('#sel_scheme').selectpicker('refresh');
		
    },'text');
}
function formatDate(d)
{
    var month = d.getMonth();
    var day = d.getDate();
    month = month + 1;

    month = month + "";

    if (month.length == 1)
    {
        month = "0" + month;
    }

    day = day + "";

    if (day.length == 1)
    {
        day = "0" + day;
    }
    return day + '-' + month + '-' + d.getFullYear();
}
function changePeriod()
{
	var period = $("#sel_period_years").val();
	if(period == "")
	{
		$("#adv-alert-msg").html("Please select period. The SWP start date and end date pre filled automatically.");
   	    $("#adv-alert").modal('show');
		return;
	}
	var d = new Date();
	var end_date = formatDate(d);
	var year = d.getFullYear();
	year = parseInt(year) - parseInt(period);
	d.setFullYear(year);
	var start_date = formatDate(d);
	$("#txt_from_date").val(start_date);
	$("#txt_to_date").val(end_date);
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
		//var inception_date =  new Date(schemes_array[0]);
		
		var from = schemes_array[0].split("-");
		var inception_date = new Date(from[2], from[1] - 1, from[0]);
		
		if(init_date < inception_date)
		{
			swal({
				  title: "Error!",
				  text: "Please select a Intial investement date which is greater than or equal to scheme inception date.!",
				  type: "error",
				  confirmButtonText: "OK"
				});
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
		//var inception_date =  new Date(schemes_array[0]);
		
		var from = schemes_array[0].split("-");
		var inception_date = new Date(from[2], from[1] - 1, from[0]);
		if(start_date < inception_date)
		{
			swal({
				  title: "Error!",
				  text: "Please select a Intial investement date which is greater than or equal to scheme inception date.!",
				  type: "error",
				  confirmButtonText: "OK"
				});
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
		
		var from = schemes_array[0].split("-");
		var inception_date = new Date(from[2], from[1] - 1, from[0]);
		
		if(startDate < inception_date)
		{
			
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ moment(inception_date).format("DD-MM-YYYY") +". Please select a SWP start date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
		if(init_date < inception_date && flag == false)
		{
			swal({
				  title: "Error!",
				  text: "Please select a Intial investement date which is greater than or equal to scheme inception date.!",
				  type: "error",
				  confirmButtonText: "OK"
				});
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
	
 	top.location = "/mutual-funds-research/mutual-fund-swp-investment-calculator?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&swp_date="+swp_date+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date;
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
		//$('#sel_amc').niceSelect('update');
		//$("#sel_amc").selectpicker("refresh");
	}
	
	var scheme_name = '${scheme_name}';
	if(scheme_name != '')
	{
		if(scheme_name == "SBI Magnum Balanced Fund - Regular Plan -Growth")
		{
			$("#sel_scheme").val("SBI Magnum Balanced Fund - REGULAR PLAN -Growth");
			//$("#sel_scheme").selectpicker("refresh");
		}else
		{
			$("#sel_scheme").val(scheme_name);
			//$('#sel_scheme').niceSelect('update');
			//$("#sel_scheme").selectpicker("refresh");
		}
	}
	
	var swp_date = '${swp_date}';
	if(swp_date != '')
	{
		$("#sel_swp_date").val(swp_date);
		//$("#sel_swp_date").selectpicker("refresh");
	}
	
	showChart();
	
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
	
	$(".comma_fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(0)));  
	});
	
	$(".units_comma_fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(2)));  
	});
	

	$(".units_comma_4fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(4)));  
	});
});

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
    var swp_date = $("#sel_swp_date").val();
    var withdrawal_amount = $("#txt_withdrawal_amount").val();    
    var period = $("#sel_period").val();
    var from_date = $("#txt_from_date").val();
    var to_date = $("#txt_to_date").val();
    
	var accountMap = '${accountMap}';
	var title = "Mutual Fund SWP Calculator -> AMC = " + amc + ", Scheme Name = " + scheme_name + ", Lumpsum Amount = " + initial_amount + ", Lumpsum Investment Date = " + init_start_date + ", Frequency = " + period + ", SWP Start Date = " + from_date + ", SWP End Date = " + to_date + " , SWP Date = " + swp_date + ", Withdrawal Amount = " + withdrawal_amount;
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
		//var inception_date =  new Date(schemes_array[0])
		
		var from = schemes_array[0].split("-");
		var inception_date = new Date(from[2], from[1] - 1, from[0]);
		
		if(startDate < inception_date)
		{
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ moment(inception_date).format("DD-MM-YYYY") +". Please select a SWP start date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
		if(init_date < inception_date && flag == false)
		{
			swal({
				  title: "Error!",
				  text: "Please select a Intial investement date which is greater than or equal to scheme inception date.!",
				  type: "error",
				  confirmButtonText: "OK"
				});
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

	//top.location = "/mutual-funds-research/mutualFundSwpInvestmentCalculator?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&swp_date="+swp_date+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date;
	var path = "/mutual-funds-research/mutualFundSwpInvestmentCalculator?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&swp_date="+swp_date+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date;
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
	    	    	top.location =  "/mutual-funds-research/mutualFundSwpInvestmentCalculator?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&swp_date="+swp_date+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date+"&download=yes";
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
		//var inception_date =  new Date(schemes_array[0])
		
		var from = schemes_array[0].split("-");
		var inception_date = new Date(from[2], from[1] - 1, from[0]);
		
		if(startDate < inception_date)
		{
			$("#adv-alert-msg").html(scheme_name+" inception date is "+ moment(inception_date).format("DD-MM-YYYY") +". Please select a SWP start date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
		if(init_date < inception_date && flag == false)
		{
			swal({
				  title: "Error!",
				  text: "Please select a Intial investement date which is greater than or equal to scheme inception date.!",
				  type: "error",
				  confirmButtonText: "OK"
				});
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
	
	downloadPath = "/mutual-funds-research/mutualFundSwpInvestmentCalculator?amc="+amc+"&scheme_name="+scheme_name+"&intial_amount="+initial_amount+"&swp_date="+swp_date+"&withdrawal_amount="+withdrawal_amount+"&period="+period+"&from_date="+from_date+"&to_date="+to_date+"&init_start_date="+init_start_date;
	imageDownload = "no";
	chartId = "";
	filename = "";
	
	$("#adv-login").modal("show");
}

/* function showChart()
{
	var start_date_list = '${date_list}';	
	var cumulative_withdrawal = '${cumulative_withdrawal}';
	var current_value = '${current_value_graph}';	
	
	var start_date_list_trim = $.trim(start_date_list);
	var start_date_list_obj = jQuery.parseJSON(start_date_list_trim);
	var start_date_list_array = $.makeArray(start_date_list_obj);

	var cumulative_withdrawal_trim = $.trim(cumulative_withdrawal);
	var cumulative_withdrawal_obj = jQuery.parseJSON(cumulative_withdrawal_trim);
	var cumulative_withdrawal_array = $.makeArray(cumulative_withdrawal_obj);	
	
	var current_value_trim = $.trim(current_value);
	var current_value_obj = jQuery.parseJSON(current_value_trim);
	var current_value_array = $.makeArray(current_value_obj);	
	
	if(start_date_list_array.length == 0 || current_value_array.length == 0)
	{
		return false;
	}
	
	var data_array = new Array();
	var colors = ['#FE581E','#2B3292','#000000','#194d30','#8B0045','#ff0000','#804000','#000066','#00ff00','#0A9BF5','#999999','#3b0066'];
	
	var obj = {
			name: 'Cumulative Withdrawal',
			data: cumulative_withdrawal_array,
			color : colors[3]
		};
	data_array.push(obj);	
		
	var obj = {
		name: 'Current Value',
		data: current_value_array,
		color : colors[4]
	};
		data_array.push(obj);	
	
	$('#ratio-based-asset-allocation').highcharts({
	    chart: {
	        zoomType: 'xy'
	    },
	    title: {
	        text: 'Regular withdrawal plan - ${scheme}'
	    },	   
	    xAxis: [{
	        categories: start_date_list_array,
	        crosshair: true
	    }],    
	    
	    yAxis: [{ // Primary yAxis
	        labels: {	           
	            style: {
	                color: Highcharts.getOptions().colors[1]
	            }
	        },
	        title: {
	            text: 'Current Value',
	            style: {
	                color: Highcharts.getOptions().colors[1]
	            }
	        },
	        opposite: false

	    }, { // Secondary yAxis
	        gridLineWidth: 0,
	        title: {
	            text: '',
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        },
	        labels: {	          
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        }

	    }, { // Tertiary yAxis
	        gridLineWidth: 0,
	        title: {
	            text: 'Cumulative Withdrawal',
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        },
	        labels: {	           
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        },
	        opposite: true,
	        
	        plotOptions: {
	            series: {
	                fillOpacity: 0.5
	            }
	        },
	    }],
	    tooltip: {
	        shared: true
	    },
	    legend: {
	        
	    	 enabled: true
	    },	 	 
	    
	    series: [{
	        name: 'Cumulative Withdrawal',
	        type: 'area',
	        yAxis: 2,	       
	        data: cumulative_withdrawal_array,
	        marker: {
	            enabled: false
	        },
	        dashStyle: 'line',
	        tooltip: {
	        	valuePrefix: 'Rs. '	            
	        },	 
	        
	      
	        
	        
	    }, {
	        name: 'Current Value',
	        type: 'spline',
	        data: current_value_array,
	        marker: {
	            enabled: false
	        },
	        dashStyle: 'line',
	        tooltip: {
	        	 valuePrefix: 'Rs. '
	        }
	    }]
	});
} */

function showChart()
{
	var start_date_list = '${date_list}';	
	var cumulative_withdrawal = '${cumulative_withdrawal}';
	var current_value = '${current_value_graph}';	
	
	var start_date_list_trim = $.trim(start_date_list);
	var start_date_list_obj = jQuery.parseJSON(start_date_list_trim);
	var start_date_list_array = $.makeArray(start_date_list_obj);

	var cumulative_withdrawal_trim = $.trim(cumulative_withdrawal);
	var cumulative_withdrawal_obj = jQuery.parseJSON(cumulative_withdrawal_trim);
	var cumulative_withdrawal_array = $.makeArray(cumulative_withdrawal_obj);	
	
	var current_value_trim = $.trim(current_value);
	var current_value_obj = jQuery.parseJSON(current_value_trim);
	var current_value_array = $.makeArray(current_value_obj);	
	
	if(start_date_list_array.length == 0 || current_value_array.length == 0)
	{
		return false;
	}
	
	var data_array = new Array();
    var colors = ['#009899', '#F5851F', '#F5851F', '#194d30', '#8B0045', '#ff0000', '#804000', '#000066', '#00ff00', '#0A9BF5', '#999999', '#3b0066'];

    // Cumulative Withdrawal series
    var cumulative_withdrawal_obj = {
        name: 'Cumulative Withdrawal',
        color: '#F5851F',  // Set color for Cumulative Withdrawal
        data: cumulative_withdrawal_array,
    };
    data_array.push(cumulative_withdrawal_obj);    

    // Current Value series
    var current_value_obj = {
        name: 'Current Value',
        color: ' #009899',  // Set color for Current Value
        data: current_value_array,
    };
    data_array.push(current_value_obj);

    // Initialize the Highcharts chart
    $('#ratio-based-asset-allocation').highcharts({
        chart: {
            type: 'area'
        },
        title: {
            text: 'Regular withdrawal plan - ${scheme}'
        },
        xAxis: {
            categories: start_date_list_array,
            tickmarkPlacement: 'on',
            title: {
                enabled: false
            }
        },
        yAxis: {
            title: {
                text: ''
            },
            labels: {}
        },
        tooltip: {
            split: true,
            valuePrefix: 'Rs. '            
        },
        plotOptions: {
            area: {            
                lineColor: '#666666',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#666666'
                }
            }
        },
        series: data_array  // Using the data_array with both series and their colors
    });
}

function checkInceptionDate(){
	var amc = $("#sel_amc").val();
    var scheme_name = $("#sel_scheme").val();
    var initial_amount = $("#txt_init_amount").val();
    var init_start_date = $("#txt_init_amount_start_date").val();
    
    var init_start_date_arr = init_start_date.split("-");
    
    var start_date = new Date(init_start_date_arr[2], init_start_date_arr[1] - 1, init_start_date_arr[0]);
    
    $.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + scheme_name + ""}, function(data)
    {
		var schemes = $.trim(data);
		var schemes_obj = jQuery.parseJSON(schemes);
		var schemes_array = $.makeArray(schemes_obj);
		var from = schemes_array[0].split("-");
		
		console.log("from --> "+from);
		var inception_date = new Date(from[2], from[1] - 1, from[0]);
		
		console.log("--inception_date--> "+inception_date);
		console.log("--start_date--> "+start_date);
		
		if(start_date < inception_date)
		{
			swal({
				  title: "Error!",
				  text: "Please select a Intial investement date which is greater than or equal to scheme inception date.!",
				  type: "error",
				  confirmButtonText: "OK"
				});	   	    
	   	    
			$("#txt_init_amount_start_date").val("");
		}
    },'text');
}
</script>

    <!-- Main -->
    <main>
        
         <!-- ========================
       page title 
    =========================== -->
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
</style>

<div class="premium-calculator-hero text-center">
    <div class="container text-center">
        <div class="hero-label">MF Research</div>
        <h1 class="display-6 text-dark mb-4 animated slideInDown">Mutual Fund SWP Calculator</h1>
    </div>
</div>
        
		<section class="section pt-5 pb-5 bg-light">
		
<div class="container ">
  	<div class="row"> 
  		<div class="col-lg-12">
  			<div class="premium-glass-card mb-4 p-4">
  				 <div class="card-body mf-research-body">
					<div class="row">	        
				        <div class="col-md-4 col-sm-4">
				        	<div class="form-group">
				          	<label class="bold-smaller">Select AMC</label>
					        <select id="sel_amc" class="form-control" onchange="changeAmcCompany()" data-width="100%">
					        	<option value="All">All</option>
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
				        
				        <div class="row mt-3">
				        
				        	<div class="col-md-4 col-sm-4">
					          <div class="form-group">
					            <label class="bold-smaller">Lumpsum Amount Investement Date</label>
					            <input type="text" id="txt_init_amount_start_date" value="${init_start_date}" class="form-control datepicker no-radius" onchange="checkInceptionDate()"/>
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
					            <label class="bold-smaller block">Select SWP Date</label>
					            <select id="sel_swp_date" class="form-control" data-width="100%">
									<c:forEach begin="1" end="31" step="1" varStatus="status">
									<option value="${status.count}">${status.count}</option>
									</c:forEach>
								</select>
					          </div>
					        </div>
					        
						</div>
						
						<div class="row mt-3">
					        
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
					        
					        <div class="col-md-3 col-sm-3 col-xs-12 nopadding">
					        <div class="row">
					        <div class="col-md-2 col-sm-1 col-xs-12 nopadding text-center px-0 pt-2">
					        	<div class="form-group">
							      <label class="bold block hidden-xs text-center">&nbsp;</label>
					        		<div><b>OR</b></div>
					        	</div>
					        </div>
					        <div class="col-md-10 col-sm-11 col-xs-12 pr-4">
					          <div class="form-group">
					            <label class="bold-smaller block">Period (in years)</label>
					            <select id="sel_period_years" class="form-control" data-width="100%" onchange="changePeriod()">
					            	<option value="">Select</option>
									<option value="1">1</option>
									<option value="2">2</option>
					            	<option value="3">3</option>
					            	<option value="4">4</option>
					            	<option value="5">5</option>
					            	<option value="7">7</option>
									<option value="10">10</option>
					            	<option value="12">12</option>
					            	<option value="15">15</option>
					            	<option value="18">18</option>
					            	<option value="20">20</option>
					            	<option value="25">25</option>
					            	<option value="30">30</option>
								</select>
					          </div>
					        </div>
					        </div>
					        </div>
					    </div>
					    
						<div class="row mt-3">
					        
					        <div class="col-md-3 col-sm-3 text-end">
					          	<div class="form-group">
						      	<a href="javascript:void(0)" class="btn rounded-pill px-4 py-2 text-white w-100" onclick="getData()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Submit</a>
						    	</div>
					        </div>
					        
					    </div>
   				</div>
  			</div>
  		</div>
  	</div>
</div>
		
	<div class="container premium-glass-card mb-5 p-4">
		<div class="row marginBottom20">
			<div class="col-md-12 table-responsive">
							      	<div class="row mt-20">
				  	<div class="col-xs-12 col-md-12 col-sm-12 margin-bottom10 margin-top10">

			        		<h6 class="font-size-20 bold-smaller15 margin-bottom0 mt-3 mb-2" style="line-height: 25px;">Systematic Withdrawal Plan Calculator</h6>

			      	</div>
		      		</div>
			 		
		
			        <div >
					<table class="adv-table table table-striped mf-research-table table-bordered" style="width:100%;" id="final_result">
					<thead><tr>
					<th>Scheme</th>
					<th class="text-center">Withdrawal Period</th>
					<th class="text-center">No of ${period} Installments</th>
					<th class="text-center">Total Withdrawal Amount</th>
					<th class="text-center">Current Value as on ${from_nav_date}</th>
					<th class="text-center">Return (%)</th>
					</tr></thead><tbody>
					<tr>
					<td><a href='/mutual-funds-research/fund-card?scheme=<c:out value="${scheme_name}"></c:out>' class="mutual-funds-anchor">${scheme_name}</a>
					 
					</td>
					<td class="nowrap text-center">${from_date} to ${to_date}</td>
					<td class="text-center">${transfer_out_count}</td>
					<td class="text-center comma_fixed">${total_amount_transferred}</td>
					<td class="text-center comma_fixed">${from_current_value}</td>
					<td class="text-center"><fmt:formatNumber value="${from_returns}" maxFractionDigits="2" /></td>
					</tr>
					</tbody></table>

			       	
			       	<div class="border mt-20">
					<div class="col-md-12 marginTop20">              
					    <div class="panel panel-default adv-panel marginTop10">
					      <div class="panel-body padding0 relative text-center" style="min-height:400px;" id="ratio-based-asset-allocation">
					<i id="rolling-returns-spinner" class="fa fa-cog fa-spin fa-2x" style="margin-top: 100px;margin-bottom: 100px;"></i>
					<div id="rolling-returns-container1" style="min-height:400px;min-width:600px;"></div>              
					    </div>
					  </div>    
					</div>
					</div>
			
			        <div id="transaction_details" class="remove-bootstrap-col-lr-padding">
					<h6 class='font-size-20 bold-smaller15 margin-bottom5 mt-3 mb-3'>${scheme_name}</h6>
					<div>
					<table class="adv-table table table-striped mf-research-table table-bordered" style="width:100%;" id="swpTable">
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
					</thead>
					<tbody>
					<c:forEach items="${from_scheme_list}" var="scheme">
					<tr>
					<td class="nowrap text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${scheme.nav_date}" /></td>
			    	<td class="text-center"><c:out value="${scheme.nav}"></c:out></td>
			    	<td class="text-center units_comma_4fixed">${scheme.units}</td>
			    	<td class="text-center units_comma_4fixed">${scheme.cumulative_units}</td>
			    	<td class="text-center comma_fixed">${scheme.cash_flow}</td>
			    	<td class="text-center comma_fixed">${scheme.amount}</td>
			    	<td class="text-center units_comma_fixed">${scheme.capital_gain}</td>
			    	<td class="text-center"><fmt:formatNumber value="${scheme.no_of_days}" maxFractionDigits="0" /></td>
			    	<td class="text-center comma_fixed">${scheme.current_value}</td>
			    	</tr>
					</c:forEach>
					</tbody>
					</table>
			       	</div>
			       </div>
			     
	       		</div>
			</div>
		</div>
		

				
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="row mt-3">
					<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;"><b>Disclaimer :</b> We have gathered all the data, information, statistics from the sources believed to be highly reliable and true. All necessary precautions have been taken to avoid any error, lapse or insufficiency; however, no representations or warranties are made (express or implied) as to the reliability, accuracy or completeness of such information. We cannot be held liable for any loss arising directly or indirectly from the use of, or any action taken in on, any information appearing herein. The user is advised to verify the contents of the report independently.</p>
					<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;">Returns less than 1 year are in absolute (%) and greater than 1 year are compounded annualised (CAGR %). SIP returns are shown in XIRR (%).</p>
					<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;">The Risk Level of any of the schemes must always be commensurate with the risk profile, investment objective or financial goals of the investor concerned. Mutual Fund Distributors (MFDs) or Registered Investment Advisors (RIAs) should assess the risk profile and investment needs of individual investors into consideration and make scheme(s) or asset allocation recommendations accordingly.</p>
					<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;"><b>Mutual Fund investments are subject to market risks, read all scheme related documents carefully.</b> Past performance may or may not be sustained in the future. Investors should always invest according to their risk profile and consult with their mutual fund distributors or financial advisor before investing.</p>
				</div>
			</div>
		</div>
	</div>
	
</section>
    </main>
    <!-- End Main -->
    
    
<!--     <div id="adv-alert" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="display: none;"> -->
<!-- 	  <div class="modal-body"> -->
<!-- 	    <p id="adv-alert-msg">Would you like to continue with some arbitrary task?</p> -->
<!-- 	  </div> -->
<!-- 	  <div class="modal-footer"> -->
<!-- 	    <button type="button" data-dismiss="modal" class="btn btn-default">Cancel</button> -->
<!-- 	    <button type="button" data-dismiss="modal" class="btn btn-warning">OK</button> -->
<!-- 	  </div> -->
<!-- 	</div> -->