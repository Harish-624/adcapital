<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script src="https://twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js">

</script>
<c:set var="userAgent" value="${header['User-Agent']}" />
<input type="hidden" id="isMobileUserAgent" value="${not empty userAgent and fn:contains(userAgent, 'Mobile')}" />
        <script>
function getStartAndEndDate()
{
	if($("#chk_date").is(":checked"))
	{
		var fundname1 = $("#txt_fund1").val();
		var fundname2 = "";
		var fundname3 = "";
		var fundname4 = "";
		var fundname5 = "";
		var fund_array = new Array();
		
		if(fundname1 == "")
		{
			swal({title:"",text:"Please select the fund 1"});
			return;
		}else{
			fund_array.push(fundname1);
		}
		if($("#txt_fund2").length != 0)
		{
			fundname2 = $("#txt_fund2").val();
			if(fundname2 == "")
			{
				swal({title:"",text:"Please select the fund 2"});
				return;
			}else{
				fund_array.push(fundname2);
			}
		}
		if($("#txt_fund3").length != 0)
		{
			fundname3 = $("#txt_fund3").val();
			if(fundname3 == "")
			{
				swal({title:"",text:"Please select the fund 3"});
				return;
			}else{
				fund_array.push(fundname3);
			}
		}
		if($("#txt_fund4").length != 0)
		{
			fundname4 = $("#txt_fund4").val();
			if(fundname4 == "")
			{
				swal({title:"",text:"Please select the fund 4"});
				return;
			}else{
				fund_array.push(fundname4);
			}
		}
		if($("#txt_fund5").length != 0)
		{
			fundname5 = $("#txt_fund5").val();
			if(fundname5 == "")
			{
				swal({title:"",text:"Please select the fund 5"});
				return;
			}else{
				fund_array.push(fundname5);
			}
		}
		var dates_array = new Array();
		for(var k=0;k<fund_array.length;k++)
		{
			var scheme_name = fund_array[k];
			var schemeName = encodeURIComponent(scheme_name);
			
			$.ajaxSetup({async:false});
			$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
		    {
				var schemes = $.trim(data);
				var schemes_obj = jQuery.parseJSON(schemes);
				var schemes_array = $.makeArray(schemes_obj);
				var from = schemes_array[0].split("-");
				var startdate = new Date(from[2], from[1] - 1, from[0]);
				dates_array.push(startdate);
		    },'text');
		}
		dates_array.sort(date_sort_asc);
		var inception_date =  dates_array[0];
		//$("#txt_start_date").val(inception_date.format("dd-mm-yyyy"));
		$("#txt_start_date").val(moment(inception_date).format("DD-MM-YYYY"));
		$('#txt_start_date').datepicker('setDate', inception_date);
	}
}
var date_sort_asc = function (date1, date2) 
{
	if (date1 > date2) return 1;
  	if (date1 < date2) return -1;
  	return 0;
};
function checkStartDate()
{
	var fundname1 = $("#txt_fund1").val();
	var fundname2 = "";
	var fundname3 = "";
	var fundname4 = "";
	var fundname5 = "";
	var startdate = $("#txt_start_date").val();
	var fund_array = new Array();
	
	if(fundname1 == "")
	{
		swal({title:"",text:"Please select the fund 1"});
		return;
	}else{
		fund_array.push(fundname1);
	}
	if($("#txt_fund2").length != 0)
	{
		fundname2 = $("#txt_fund2").val();
		if(fundname2 == "")
		{
			swal({title:"",text:"Please select the fund 2"});
			return;
		}else{
			fund_array.push(fundname2);
		}
	}
	if($("#txt_fund3").length != 0)
	{
		fundname3 = $("#txt_fund3").val();
		if(fundname3 == "")
		{
			swal({title:"",text:"Please select the fund 3"});
			return;
		}else{
			fund_array.push(fundname3);
		}
	}
	if($("#txt_fund4").length != 0)
	{
		fundname4 = $("#txt_fund4").val();
		if(fundname4 == "")
		{
			swal({title:"",text:"Please select the fund 4"});
			return;
		}else{
			fund_array.push(fundname4);
		}
	}
	if($("#txt_fund5").length != 0)
	{
		fundname5 = $("#txt_fund5").val();
		if(fundname5 == "")
		{
			swal({title:"",text:"Please select the fund 5"});
			return;
		}else{
			fund_array.push(fundname5);
		}
	}
	if(startdate == "")
	{
		swal({title:"",text:"Please select the start date"});
		return;
	}
	var start_date_arr = startdate.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var start_date = new Date(start_date_str);
	for(var k=0;k<fund_array.length;k++)
	{
		var scheme_name = fund_array[k];
		var schemeName = encodeURIComponent(scheme_name);
		var flag = false;
		
		$.ajaxSetup({async:false});
		$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
	    {
			var schemes = $.trim(data);
			var schemes_obj = jQuery.parseJSON(schemes);
			var schemes_array = $.makeArray(schemes_obj);
			var from = schemes_array[0].split("-");
			var scheme_inception_date = new Date(from[2], from[1] - 1, from[0]);
			if(start_date < scheme_inception_date)
			{
				swal({title:"",text:scheme_name+" inception date is "+ scheme_inception_date.format("dd-mm-yyyy") +".Please select a start date which is greater than or equal to scheme inception date."});
		   	 	flag = true;
				return false;
			}
	    },'text');
		
		if(flag)
		{
			return false;
			break;
		}
	}
}
function gotoTop()
{
	$('html,body').animate({
        scrollTop: 0
    }, 700);
}

function gotoSIPEnhancement()
{
	var fundname = $("#txt_fund1").val();
	var amount = $("#txt_amount").val();
	var startdate = $("#txt_start_date").val();
	var enddate = $("#txt_end_date").val();
	var frequency = $("#sel_frequency").val();
	
	if(fundname == "")
	{
		swal({title:"",text:"Please select the fund 1"});
		return;
	}
	if(amount == "" || isNaN(amount) || parseInt(amount) < 1)
	{
		swal({title:"",text:"Please enter the valid amount"});
		return;
	}
	if(startdate == "")
	{
		swal({title:"",text:"Please select the start date"});
		return;
	}
	if(enddate == "")
	{
		swal({title:"",text:"Please select the end date"});
		return;
	}
	if(frequency == "0")
	{
		swal({title:"",text:"Please select the frequency"});
		return;
	}
	
	top.location = "/mutual-funds-research/sip-with-annual-increase/"+fundname+"?amount="+amount+"&frequency="+frequency+"&start_date="+startdate+"&end_date="+enddate+"&enhancement_percentage=10";
}

$(document).ready(function(){
	
	initializeTypeAhead();
	 $('.datepicker').datepicker({
		format: 'dd-mm-yyyy',
		endDate: '-1d',
		autoclose:true,
		disableTouchKeyboard:true
	}).on('changeDate', function(ev) {
		var ID = $(this).attr("id");
		if(ID == "txt_start_date")
		{
			checkStartDate();
		}
	});
	var fund = '${fund}';
	if(fund != "")
	{
		var fund_array = fund.split(",");
		for(var k=0;k<fund_array.length;k++)
		{
			var fund_name = fund_array[k];
			
			if(k == 0)
			{
				$("#txt_fund1").val(fund_name);
			}
			if(k == 1)
			{
				addMoreFund();
				$("#txt_fund2").val(fund_name);
			}
			if(k == 2)
			{
				addMoreFund();
				$("#txt_fund3").val(fund_name);
			}
			if(k == 3)
			{
				addMoreFund();
				$("#txt_fund4").val(fund_name);
			}
			if(k == 4)
			{
				addMoreFund();
				$("#txt_fund5").val(fund_name);
			}
		}
	}
	
	$("#sel_schemeCategories").change(function(){
		$(".txt_fund").val("");
		$("#txt_fund1").focus();		
	});
	
	$("#final_result").dataTable({
		"bPaginate": false,
        "bFilter": false,
        "bInfo": false,
        "bSort": false,
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
	
	$('#tbl_scheme_returns').on( 'draw.dt', function (e, settings) {
		var isMobileEl = document.getElementById("isMobileUserAgent");
		var isMobile = isMobileEl ? isMobileEl.value === "true" : false;
		if (isMobile) {
			var table = settings.oInstance.api();
			setTimeout(function(){
			  table.rows(':not(.parent)').nodes().to$().find('td:first-child').trigger('click');
			}, 1000);
		}
	});
	
});

function initializeTypeAhead()
{	
	$('.txt_fund').typeahead({
	    source: function (query, process) {
	    	
	    
	        return $.ajax({
	            url: './autoSuggestAllMfSchemes',
	            type: 'post',
	            data: { 
	            	query: query,
	                category: $("#sel_schemeCategories").val()
	            },
	            dataType: 'json',
	            success: function (result) {
	                return process(result);
	            }
	        });
	    },
	    items:10,
	    matcher: function(item) {
	        return true;
	    }
	});
}

function getData()
{
	var category = $("#sel_schemeCategories").val();
 	var fundname1 = $("#txt_fund1").val();
	var fundname2 = "";
	var fundname3 = "";
	var fundname4 = "";
	var fundname5 = "";
	var amount = $("#txt_amount").val();
	var startdate = $("#txt_start_date").val();
	var enddate = $("#txt_end_date").val();
	var frequency = $("#sel_frequency").val();
	var fund_array = new Array();
	
	if(fundname1 == "")
	{
		swal({title:"",text:"Please select the fund 1"});
		return;
	}else{
		fund_array.push(fundname1);
	}
	if($("#txt_fund2").length != 0)
	{
		fundname2 = $("#txt_fund2").val();
		if(fundname2 == "")
		{
			swal({title:"",text:"Please select the fund 2"});
			return;
		}else{
			fund_array.push(fundname2);
		}
	}
	if($("#txt_fund3").length != 0)
	{
		fundname3 = $("#txt_fund3").val();
		if(fundname3 == "")
		{
			swal({title:"",text:"Please select the fund 3"});
			return;
		}else{
			fund_array.push(fundname3);
		}
	}
	if($("#txt_fund4").length != 0)
	{
		fundname4 = $("#txt_fund4").val();
		if(fundname4 == "")
		{
			swal({title:"",text:"Please select the fund 4"});
			return;
		}else{
			fund_array.push(fundname4);
		}
	}
	if($("#txt_fund5").length != 0)
	{
		fundname5 = $("#txt_fund5").val();
		if(fundname5 == "")
		{
			swal({title:"",text:"Please select the fund 5"});
			return;
		}else{
			fund_array.push(fundname5);
		}
	}
	if(amount == "" || isNaN(amount) || parseInt(amount) < 1)
	{
		swal({title:"",text:"Please enter the valid amount"});
		return;
	}
	if(startdate == "")
	{
		swal({title:"",text:"Please select the start date"});
		return;
	}
	if(enddate == "")
	{
		swal({title:"",text:"Please select the end date"});
		return;
	}
	if(frequency == "0")
	{
		swal({title:"",text:"Please select the frequency"});
		return;
	}
	var start_date_arr = startdate.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var end_date_arr = enddate.split("-");
	var end_date_str = end_date_arr[2] + "-" + end_date_arr[1] + "-" + end_date_arr[0];
	
	var start_date = new Date(start_date_str);
	var end_date = new Date(end_date_str);
	
	if(end_date <= start_date)
	{
		swal({title:"",text:"Please select valid start date and end date"});
		return;
	}
	if(frequency == "Monthly")
	{
		start_date.setMonth(start_date.getMonth() + 1);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	if(frequency == "Fortnightly")
	{
		start_date.setDate(start_date.getDate() + 15);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	if(frequency == "Quarterly")
	{
		start_date.setMonth(start_date.getMonth() + 3);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	/* for(var k=0;k<fund_array.length;k++)
	{
		var scheme_name = fund_array[k];
		var schemeName = encodeURIComponent(scheme_name);
		var flag = false;
		
		$.ajaxSetup({async:false});
		$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
	    {
			var schemes = $.trim(data);
			var schemes_obj = jQuery.parseJSON(schemes);
			var schemes_array = $.makeArray(schemes_obj);
			var scheme_inception_date =  new Date(schemes_array[0])
			if(start_date < scheme_inception_date)
			{
				swal({title:"",text:"scheme_name+" inception date is "+ scheme_inception_date.format("dd-mm-yyyy") +". Please select a start date which is greater than or equal to scheme inception date.");
		   	    $("#adv-alert").modal('show');
		   	 	flag = true;
				return false;
			}
	    },'text');
		
		if(flag)
		{
			return false;
			break;
		}
	} */
	var scheme_array = new Array();
	for(var k=0;k<fund_array.length;k++)
	{
		var scheme_name = fund_array[k];
		scheme_name = encodeURIComponent(scheme_name);
		scheme_array.push(scheme_name);
	}
	top.location = "/mutual-funds-research/mutual-fund-sip-investment-calculator?category="+category+"&fund="+scheme_array+"&amount="+amount+"&frequency="+frequency+"&startdate="+startdate+"&enddate="+enddate;	
}

function downloadXl()
{
	var category = $("#sel_schemeCategories").val();
 	var fundname1 = $("#txt_fund1").val();
	var fundname2 = "";
	var fundname3 = "";
	var fundname4 = "";
	var fundname5 = "";
	var amount = $("#txt_amount").val();
	var startdate = $("#txt_start_date").val();
	var enddate = $("#txt_end_date").val();
	var frequency = $("#sel_frequency").val();
	var fund_array = new Array();
	
	if(fundname1 == "")
	{
		swal({title:"",text:"Please select the fund 1"});
		return;
	}else{
		fund_array.push(fundname1);
	}
	if($("#txt_fund2").length != 0)
	{
		fundname2 = $("#txt_fund2").val();
		if(fundname2 == "")
		{
			swal({title:"",text:"Please select the fund 2"});
		}else{
			fund_array.push(fundname2);
		}
	}
	if($("#txt_fund3").length != 0)
	{
		fundname3 = $("#txt_fund3").val();
		if(fundname3 == "")
		{
			swal({title:"",text:"Please select the fund 3"});
			return;
		}else{
			fund_array.push(fundname3);
		}
	}
	if($("#txt_fund4").length != 0)
	{
		fundname4 = $("#txt_fund4").val();
		if(fundname4 == "")
		{
			swal({title:"",text:"Please select the fund 4"});
			return;
		}else{
			fund_array.push(fundname4);
		}
	}
	if($("#txt_fund5").length != 0)
	{
		fundname5 = $("#txt_fund5").val();
		if(fundname5 == "")
		{
			swal({title:"",text:"Please select the fund 5"});
			return;
		}else{
			fund_array.push(fundname5);
		}
	}
	if(amount == "" || isNaN(amount) || parseInt(amount) < 1)
	{
		swal({title:"",text:"Please enter the valid amount"});
		return;
	}
	if(startdate == "")
	{
		swal({title:"",text:"Please select the start date"});
		return;
	}
	if(enddate == "")
	{
		swal({title:"",text:"Please select the end date"});
		return;
	}
	if(frequency == "0")
	{
		swal({title:"",text:"Please select the frequency"});
		return;
	}
	var start_date_arr = startdate.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var end_date_arr = enddate.split("-");
	var end_date_str = end_date_arr[2] + "-" + end_date_arr[1] + "-" + end_date_arr[0];
	
	var start_date = new Date(start_date_str);
	var end_date = new Date(end_date_str);
	
	if(end_date <= start_date)
	{
		swal({title:"",text:"Please select valid start date and end date"});
		return;
	}
	if(frequency == "Monthly")
	{
		start_date.setMonth(start_date.getMonth() + 1);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	if(frequency == "Fortnightly")
	{
		start_date.setDate(start_date.getDate() + 15);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	if(frequency == "Quarterly")
	{
		start_date.setMonth(start_date.getMonth() + 3);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	
	var scheme_array = new Array();
	for(var k=0;k<fund_array.length;k++)
	{
		var scheme_name = fund_array[k];
		scheme_name = encodeURIComponent(scheme_name);
		scheme_array.push(scheme_name);
	}
	//top.location = "/mutual-funds-research/downloadMutualFundSIPCalculatorXl?category="+category+"&fund="+scheme_array+"&amount="+amount+"&frequency="+frequency+"&startdate="+startdate+"&enddate="+enddate;
	
	top.location =  "/mutual-funds-research/downloadMutualFundSIPCalculatorXl?category="+category+"&fund="+scheme_array+"&amount="+amount+"&frequency="+frequency+"&startdate="+startdate+"&enddate="+enddate+"&download=yes";   	
}

function openLogin(){
	
	var category = $("#sel_schemeCategories").val();
 	var fundname1 = $("#txt_fund1").val();
	var fundname2 = "";
	var fundname3 = "";
	var fundname4 = "";
	var fundname5 = "";
	var amount = $("#txt_amount").val();
	var startdate = $("#txt_start_date").val();
	var enddate = $("#txt_end_date").val();
	var frequency = $("#sel_frequency").val();
	var fund_array = new Array();
	
	if(fundname1 == "")
	{
		swal({title:"",text:"Please select the fund 1"});
		return;
	}else{
		fund_array.push(fundname1);
	}
	if($("#txt_fund2").length != 0)
	{
		fundname2 = $("#txt_fund2").val();
		if(fundname2 == "")
		{
			swal({title:"",text:"Please select the fund 2"});
			return;
		}else{
			fund_array.push(fundname2);
		}
	}
	if($("#txt_fund3").length != 0)
	{
		fundname3 = $("#txt_fund3").val();
		if(fundname3 == "")
		{
			swal({title:"",text:"Please select the fund 3"});
			return;
		}else{
			fund_array.push(fundname3);
		}
	}
	if($("#txt_fund4").length != 0)
	{
		fundname4 = $("#txt_fund4").val();
		if(fundname4 == "")
		{
			swal({title:"",text:"Please select the fund 4"});
			return;
		}else{
			fund_array.push(fundname4);
		}
	}
	if($("#txt_fund5").length != 0)
	{
		fundname5 = $("#txt_fund5").val();
		if(fundname5 == "")
		{
			swal({title:"",text:"Please select the fund 5"});
			return;
		}else{
			fund_array.push(fundname5);
		}
	}
	if(amount == "" || isNaN(amount) || parseInt(amount) < 1)
	{
		$swal({title:"",text:"Please enter the valid amount"});
		return;
	}
	if(startdate == "")
	{
		swal({title:"",text:"Please select the start date"});
		return;
	}
	if(enddate == "")
	{
		swal({title:"",text:"Please select the end date"});
		return;
	}
	if(frequency == "0")
	{
		swal({title:"",text:"Please select the frequency"});
		return;
	}
	var start_date_arr = startdate.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var end_date_arr = enddate.split("-");
	var end_date_str = end_date_arr[2] + "-" + end_date_arr[1] + "-" + end_date_arr[0];
	
	var start_date = new Date(start_date_str);
	var end_date = new Date(end_date_str);
	
	if(end_date <= start_date)
	{
		swal({title:"",text:"Please select valid start date and end date"});
		return;
	}
	if(frequency == "Monthly")
	{
		start_date.setMonth(start_date.getMonth() + 1);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	if(frequency == "Fortnightly")
	{
		start_date.setDate(start_date.getDate() + 15);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	if(frequency == "Quarterly")
	{
		start_date.setMonth(start_date.getMonth() + 3);
		if(end_date <= start_date)
		{
			swal({title:"",text:"Please select valid start date and end date"});
			return;
		}
	}
	
	var scheme_array = new Array();
	for(var k=0;k<fund_array.length;k++)
	{
		var scheme_name = fund_array[k];
		scheme_name = encodeURIComponent(scheme_name);
		scheme_array.push(scheme_name);
	}
	downloadPath = "/mutual-funds-research/downloadMutualFundSIPCalculatorXl?category="+category+"&fund="+scheme_array+"&amount="+amount+"&frequency="+frequency+"&startdate="+startdate+"&enddate="+enddate;
	imageDownload = "no";
	chartId = "";
	filename = "";
	
	$("#adv-login").modal("show");
}

function addMoreFund()
{
	var fundname1 = $("#txt_fund1").val();
	if(fundname1 == "")
	{
		swal({title:"",text:"Enter an value for Fund 1"});
		return;
	}
	var fundname2 = $("#txt_fund2").val();
	if(fundname2 == "")
	{
		swal({title:"",text:"Enter an value for Fund 2"});
		return;
	}
	var fundname3 = $("#txt_fund3").val();
	if(fundname3 == "")
	{
		swal({title:"",text:"Enter an value for Fund 3"});
		return;
	}
	var fundname4 = $("#txt_fund4").val();
	if(fundname4 == "")
	{
		swal({title:"",text:"Enter an value for Fund 4"});
		return;
	}
	var fundname5 = $("#txt_fund5").val();
	if(fundname5 == "")
	{
		swal({title:"",text:"Enter an value for Fund 5"});
		return;
	}

    var count = 0;
	$(".fund").each(function(){
		count++;
	});
	count++;
	
	var fund_count = 5 - count;
	$("#fund_count").html(fund_count);
	
	if(count == 5)
	{
		$("#more_funds_div").hide();
	}else{
		$("#more_funds_div").show();
	}

	if(count == 2)
	{
		var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
		friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
		friends_html += '<div class="input-group">';
		friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
        friends_html += '</div>';
		friends_html += '</div>';
		
		$("#div_txt_funds").append(friends_html);
	}
	if(count == 3)
	{
		if($("#div_fund_2").length == 0) 
		{
			count = count - 1;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund name '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_3").length != 0)
			{
				$( "#div_fund_3" ).before(friends_html);
			}else if($("#div_fund_4").length != 0)
			{
				$( "#div_fund_4" ).before(friends_html);
			}else if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_fund_1").append(friends_html);
			}
		}else if($("#div_fund_3").length == 0) 
		{
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_4").length != 0)
			{
				$( "#div_fund_4" ).before(friends_html);
			}else if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_txt_funds").append(friends_html);
			}
		}else if($("#div_fund_4").length == 0) 
		{
			count = count + 1;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_txt_funds").append(friends_html);
			}
		}else
		{
			count = count + 2;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			$("#div_txt_funds").append(friends_html);
		}
	}
	if(count == 4)
	{
		if($("#div_fund_2").length == 0) 
		{
			count = count - 2;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_3").length != 0)
			{
				$( "#div_fund_3" ).before(friends_html);
			}else if($("#div_fund_4").length != 0)
			{
				$( "#div_fund_4" ).before(friends_html);
			}else if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_txt_funds").append(friends_html);
			}
		}else if($("#div_fund_3").length == 0) 
		{
			count = count - 1;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_4").length != 0)
			{
				$( "#div_fund_4" ).before(friends_html);
			}else if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_txt_funds").append(friends_html);
			}
		}else if($("#div_fund_4").length == 0) 
		{
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_txt_funds").append(friends_html);
			}
		}else
		{
			count = count + 1;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			$("#div_txt_funds").append(friends_html);
		}
	}
	if(count == 5)
	{
		if($("#div_fund_2").length == 0) 
		{
			count = count - 3;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_3").length != 0)
			{
				$( "#div_fund_3" ).before(friends_html);
			}else if($("#div_fund_4").length != 0)
			{
				$( "#div_fund_4" ).before(friends_html);
			}else if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_txt_funds").append(friends_html);
			}
		}else if($("#div_fund_3").length == 0) 
		{
			count = count - 2;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_4").length != 0)
			{
				$( "#div_fund_4" ).before(friends_html);
			}else if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_txt_funds").append(friends_html);
			}
		}else if($("#div_fund_4").length == 0) 
		{
			count = count - 1;
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			if($("#div_fund_5").length != 0)
			{
				$( "#div_fund_5" ).before(friends_html);
			}else{
				$("#div_txt_funds").append(friends_html);
			}
		}else
		{
			var friends_html = '<div id="div_fund_' + count + '" class="form-group fund">';
			friends_html += '<label class="bold-smaller">Fund '+ count +'</label>';
			friends_html += '<div class="input-group">';
			friends_html += '<input id="txt_fund' + count + '" type="text" class="txt_fund form-control">';
	        friends_html += '<span class="input-group-addon" style="cursor:pointer;"  onclick="removeMoreFund(\'div_fund_' + count + '\')"><i class="fa fa-close"></i></span>';
	        friends_html += '</div>';
			friends_html += '</div>';
			
			$("#div_txt_funds").append(friends_html);
		}
	}
	initializeTypeAhead();
}

function removeMoreFund(id)
{
     $("#" + id).remove();
     if($("#transaction_details").is(":visible"))
   	 {
    	 getData();
   	 }
     
    var count = 0;
 	$(".fund").each(function(){
 		count++;
 	});
 	
 	var fund_count = 5 - count;
 	$("#fund_count").html(fund_count);
 	
 	if(count == 5)
 	{
 		$("#more_funds_div").hide();
 	}else{
 		$("#more_funds_div").show();
 	}
}


function removeFunds(scheme)
{
	var count = 0;
	$(".fund").each(function(){
		count++;
	});
	for(var k=1;k<=count;k++)
	{
		if($("#txt_fund"+k).val() == scheme)
		{
			if(k == 1)
			{
				if(count > 1)
				{
					if($("#div_fund_2").length != 0)
					{
						var value2 = $("#txt_fund2").val();
						$("#txt_fund1").val(value2);
						$("#div_fund_2").remove();
						getData();
					}else if($("#div_fund_3").length != 0)
					{
						var value3 = $("#txt_fund3").val();
						$("#txt_fund1").val(value3);
						$("#div_fund_3").remove();
						getData();
					}else if($("#div_fund_4").length != 0)
					{
						var value4 = $("#txt_fund4").val();
						$("#txt_fund1").val(value4);
						$("#div_fund_4").remove();
						getData();
					}else
					{
						var value5 = $("#txt_fund5").val();
						$("#txt_fund1").val(value5);
						$("#div_fund_5").remove();
						getData();
					}
				}else{
					$("#txt_fund"+k).val("");
				}
			}else
			{
				 $("#div_fund_" + k).remove();
				 getData();
			}
		}
	}
} 



</script>

<!-- ── PAGE HERO ──────────────────────────────────────────────── -->
<div class="page-hero-curved">
  <div class="container position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center sr-reveal" data-sr-reveal-delay="0.1s">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="/tools-and-calculators">Calculators</a></li>
        <li class="breadcrumb-item active" aria-current="page">Mutual Fund SIP Calculator</li>
      </ol>
    </nav>
    <div class="text-center">
      <span class="category-label sr-reveal" data-sr-reveal-delay="0.2s">Tools &amp; Calculators</span>
      <h1 class="sr-reveal mt-2 mb-0" data-sr-reveal-delay="0.3s" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Mutual Fund SIP Calculator</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<section class="bg-light" id="mfResearch" style="padding: 60px 0 20px;">
	<div class="container">
		<div class="col-md-12">
			<div class="premium-card mb-4">
				<div class="card-body p-4">
					<div class="row">
						<div class="col-md-12 col-sm-12 nopadding">
							 <div class="row pl-4 pr-4">
								<div class="col-md-6 col-sm-6">
								   <div class="form-group">
									  <label class="bold-smaller">Select Category</label>
									  <select id="sel_schemeCategories" class="form-control rounded-pill bg-light" data-width="100%">
										 <option value="All">All</option>
										 <c:forEach var="categories" items="${schemeCategories}">
											<c:choose>
											   <c:when test="${category eq categories}">
												  <option selected value="
												  <c:out value="${categories}"/>
												  ">
												  <c:out value="${categories}"/>
												  </option>
											   </c:when>
											   <c:otherwise>
												  <c:if test="${categories != 'Fixed Maturity Plans' && categories != 'Gold Funds'}">
													 <option value="
													 <c:out value="${categories}"/>
													 ">
													 <c:out value="${categories}"/>
													 </option>
												  </c:if>
											   </c:otherwise>
											</c:choose>
										 </c:forEach>
									  </select>
								   </div>
								</div>
								<div class="col-md-6 col-sm-6">
								   <div id="div_txt_funds">
									  <div id="div_fund_1" class="form-group fund">
										 <label class="bold-smaller width-100">Fund 1</label>
										 <input id="txt_fund1" type="text" class="txt_fund form-control no-radius rounded-pill bg-light">
									  </div>
								   </div>
								</div>
								<div class="col-md-6 offset-lg-6 col-sm-6 offset-md-6">
								   <div class="form-group" id="more_funds_div">
									  <a href="javascript:void(0);" class="stepsAddmore" onclick="addMoreFund()"><i class="fa fa-plus-square marginRight10"></i> Add another fund (upto <span id="fund_count">4</span>)</a>
								   </div>
								</div>
							 </div>
						  </div>
						  <div class="col-md-12 col-sm-12 mt-20">
							 <div class="row pl-4 pr-4">
								<div class="col-md-2 col-sm-3">
								   <div class="form-group">
									  <label class="bold-smaller">Installment Amount</label>
									  <input type="text" id="txt_amount" maxlength="7" class="form-control no-radius rounded-pill bg-light" value="${amount}" />
								   </div>
								</div>
								<div class="col-md-2 col-sm-3">
								   <div class="form-group">
									  <label class="bold-smaller block">Select Frequency</label>
									  <select id="sel_frequency" class="form-control rounded-pill bg-light" data-width="100%">
										 <option value="0">Select</option>
										 <option value="Fortnightly" 
										 <c:if test="${frequency eq 'Fortnightly' }">
											<c:out value="selected" />
										 </c:if>
										 >Fortnightly</option>
										 <option value="Monthly" 
										 <c:if test="${frequency eq 'Monthly' }">
											<c:out value="selected" />
										 </c:if>
										 >Monthly</option>
										 <option value="Quarterly" 
										 <c:if test="${frequency eq 'Quarterly' }">
											<c:out value="selected" />
										 </c:if>
										 >Quarterly</option>
									  </select>
								   </div>
								</div>
								<div class="col-md-3 col-sm-3">
								   <div class="form-group">
									  <label class="bold-smaller">Select Start Date</label>
									  <input type="text" id="txt_start_date" value="${start_date}" class="form-control datepicker no-radius rounded-pill bg-light" />
								   </div>
								</div>
								<div class="col-md-3 col-sm-3">
								   <div class="form-group">
									  <label class="bold-smaller">Select End Date</label>
									  <input type="text" id="txt_end_date" value="${end_date}" class="form-control margin-bottom5 datepicker no-radius rounded-pill bg-light" />
								   </div>
								</div>
								<div class="col-md-2 col-sm-2 text-end">
								   <div class="form-group">
									  <label class="bold block hidden-xs hidden-sm">&nbsp;</label>
									  <button class="btn rounded-pill px-4 py-2 text-white w-100" type="button" onclick="getData()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Submit</button>
								   </div>
								</div>
							 </div>
						  </div>
						  <div class="col-md-12 col-sm-12 nopadding">
							 <div class="row pl-4 pr-4 mt-3">
								<div class="col-md-4 col-sm-4">
								   <div class="form-group">
									  <div class="checkbox mt-1">
										 <label class="stepsAddmore"><input class="margin-top3" id="chk_date" type="checkbox" value="" onchange="getStartAndEndDate()"> Prefill start date with inception date</label>
									  </div>
								   </div>
								</div>
								<div class="col-md-6 col-sm-6 font-size-13"><small>To see SIP Returns with Yearly Enhancements scroll down to bottom of the Cash Flow table.</small></div>
							 </div>
						  </div>
					</div>
				</div>
			</div>
				<div class="row">
					<div class="col-lg-12 p-1">
						<div class="row">
							<div class="col-md-6">
								<h6 class="font-size-20 bold-smaller15 margin-bottom0  my-2 ms-2">Summary</h6>
							</div>
							<div class="col-md-6 text-end">
								<a onClick="downloadXl()" href="javascript:;"><i class="fas fa-download me-3" style="color: #ff7c08;"></i></a>
							</div>
						</div>
					</div>
				</div>
			<div class="card border-0 mb-4">
				<div class="card-body p-4">
				
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="adv-table table table-striped table-bordered mf-research-table" style="width:100%" id="final_result">
								  <thead>
								  <c:choose>
									  <c:when test="${fn:contains(header['User-Agent'],'Mobile')}">
										  <tr>
										  <th width="200">Fund Name</th>
										  <th class="text-center">Launch Date</th>
										  <th class="text-center">Nav Date</th>
										  <th class="text-center">Nav</th>
										  <th class="text-center">Units</th>
										  <th class="text-center">No of Installments</th>
										  <th class="text-center">Investment Amount</th>
										  <th class="text-center">SIP value as on ${end_date}</th>
										  <c:if test="${end_date!= latest_nav_date}">
										  <th class="text-center">SIP value as on ${latest_nav_date}</th>
										  </c:if>
										  <th class="text-center">XIRR (%) as on ${latest_nav_date}</th>
										  <!-- <th class="text-center">Action</th> -->
										  </tr>
									  </c:when>
									  <c:otherwise>
										  <tr>
										  <th width="200">Fund Name</th>
										  <th class="text-center">Launch Date</th>
										  <th class="text-center">Nav Date</th>
										  <th class="text-center">Nav</th>
										  <th class="text-center">Units</th>
										  <th class="text-center">No of<br/>Installments</th>
										  <th class="text-center">Investment<br/>Amount</th>
										  <th class="text-center">SIP value as on<br/>${end_date}</th>
										  <c:if test="${end_date!= latest_nav_date}">
										  <th class="text-center">SIP value as on<br/>${latest_nav_date}</th>
										  </c:if>
										  <th class="text-center">XIRR (%)<br/> as on ${latest_nav_date}</th>
										  <!-- <th class="text-center">Action</th> -->
										  </tr>
									  </c:otherwise>
									  </c:choose>
								  </thead>
								  <tbody>
								  <c:forEach items="${sip_list}" var="sip" varStatus="status">
								  <tr>
								  <td class="text-left"><a href='/mutual-funds-research/fund-card?scheme=<c:out value="${sip.scheme}"></c:out>' class="mutual-funds-anchor"><c:out value="${sip.scheme}"></c:out></a>
							   
								  </td>
								  <td class="nowrap text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${sip.inception_date}" /></td>
								  <td class="nowrap text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${sip.nav_date}" /></td>
								  <td class="text-center"><c:out value="${sip.nav}"></c:out></td>
								  <td class="text-center"><fmt:formatNumber value="${sip.units}" maxFractionDigits="4" /></td>
								  <td class="text-center"><c:out value="${sip.no_of_installment}"></c:out></td>
								  <td class="text-center"><fmt:formatNumber value="${sip.invested_amount}" maxFractionDigits="0" /></td>
								  <td class="text-center"><fmt:formatNumber value="${sip.current_value}" maxFractionDigits="0" /></td>
								  <c:if test="${end_date!= latest_nav_date}">
								  <td class="text-center"><fmt:formatNumber value="${sip.current_value_today}" maxFractionDigits="0" /></td>
								  </c:if>
								  <td class="text-center"><c:out value="${sip.returns}"></c:out></td>
								  <!-- <td class="text-center">
    <span style="cursor:pointer;" onclick="removeFunds('schemeValue')">
        <i class="fa fa-times-circle fa-2x"></i>
    </span>
</td> -->
								  </tr>
								  </c:forEach>		
								  </tbody></table>
						  
								 <div id="transaction_details" class="col-md-12 col-sm-12 pl-0 pr-0">
									 <h6 class='mt-4 mb-2'>Cash Flow</h6>
								  <div class='table-responsive sip_result'>
								  <table class="adv-table table table-striped table-bordered mf-research-table">
								  <tbody><tr>
									 
								  <c:forEach items="${sip_list}" var="scheme_details">
									 <td>
									 <table class="table adv-table text-center" style="margin-bottom:0px;">
									 <tr><th colspan="5"><h6 class="height10 font-size-12 bold text-center"><a href="/mutual-funds-research/${scheme_details.scheme}">${scheme_details.scheme}</a></h6></th></tr>
								  <tr><td class="bold">Nav Date</td>
								  <td class="bold">Nav</td>
								  <td class="bold">Cumulative Units</td>
								  <td class="bold">Cumulative Invested Amount</td>
								  <td class="bold">Market Value</td></tr>
								  
								  <c:forEach items="${scheme_details.sip_list}" var="scheme">
								  <tr>
								  <td><fmt:formatDate pattern="dd-MM-yyyy" value="${scheme.nav_date}" /></td>
								  <td><c:out value="${scheme.nav}"></c:out></td>
								  <td><fmt:formatNumber value="${scheme.cumulative_units}" maxFractionDigits="4" /></td>
								  <td><fmt:formatNumber value="${scheme.cumulative_invested_amount}" maxFractionDigits="0" /></td>
								  <td><fmt:formatNumber value="${scheme.current_value}" maxFractionDigits="0" /></td>
								  </tr>
								  </c:forEach>
								  </table>
									 </td>
									 </c:forEach>
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
	</div>	
	</div>
</section>
