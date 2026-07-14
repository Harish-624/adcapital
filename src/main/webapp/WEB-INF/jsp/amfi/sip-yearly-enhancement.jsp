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


.table>:not(:last-child)>:last-child>* {
    border-bottom-color: #eeeeee;
    background-color:#009899;
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
$(document).ready(function(){
	
	$('#mf_fund_txt').typeahead({
	    source: function (query, process) {
	    	
	    	
	        return $.ajax({
	            url: '/mutual-funds-research/autoSuggestAllMfSchemes',
	            type: 'post',
	            data: { 
	            	query: query,
	            	category: "All"
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
	
	$('#div_results .collapse').on('show.bs.collapse', function () {

		$(this).prev().find(".fa-plus-circle").removeClass("fa-plus-circle").addClass("fa-minus-circle");
	});

	$('#div_results .collapse').on('hide.bs.collapse', function () {

		$(this).prev().find(".fa-minus-circle").removeClass("fa-minus-circle").addClass("fa-plus-circle");
	});
	
	$("#stp-transferee").dataTable({
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

		if($(this).html()!= '-'){
			$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(2)));  
		}
		else{
			$(this).html('-'); 
		}
	});
	
	getGraph();
	
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

function checkStartDate()
{
	
    var scheme_name = $("#mf_fund_txt").val();
    var from_date = $("#txt_start_date").val();
	
	if(scheme_name == null || scheme_name == "")
    {
 		$("#adv-alert-msg").html("Please select scheme");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
	if(from_date == "")
 	{
 		$("#adv-alert-msg").html("Please select start date.");
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
    var scheme = $("#mf_fund_txt").val();
    var amount = $("#txt_sip_amount").val();
    var frequency = $("#sel_frequency").val();
    var startdate = $("#txt_start_date").val();
    var enddate = $("#txt_end_date").val();
    var enhancement_percentage = $("#sel_enhancement").val();
    
 	if(scheme == "" || amount == "" || startdate == "" || enddate == "")
 	{
 		$("#adv-alert-msg").html("All fields are mandatory");
   	    $("#adv-alert").modal('show');
		return;
 	}
	if(isNaN(amount) || parseInt(amount) < 1)
	{
		$("#adv-alert-msg").html("Please enter the valid amount");
   	    $("#adv-alert").modal('show');
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
		$("#adv-alert-msg").html("Please select valid start date and end date");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(frequency == "0")
	{
		$("#adv-alert-msg").html("Please select frequency");
   	    $("#adv-alert").modal('show');
		return;
	}
	if(frequency == "Daily")
	{
		start_date.setDate(start_date.getDate() + 1);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(frequency == "Weekly")
	{
		start_date.setDate(start_date.getDate() + 7);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(frequency == "Fortnightly")
	{
		start_date.setDate(start_date.getDate() + 15);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(frequency == "Monthly")
	{
		start_date.setMonth(start_date.getMonth() + 1);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
	if(frequency == "Quarterly")
	{			
		start_date.setMonth(start_date.getMonth() + 3);
		if(end_date <= start_date)
		{
			$("#adv-alert-msg").html("Please select valid start date and end date");
	   	    $("#adv-alert").modal('show');
			return;
		}
	}
 	if(scheme == null || scheme == "")
    {
 		$("#adv-alert-msg").html("Please select schemes");
   	    $("#adv-alert").modal('show');
   	    return false;
    }	
 	var schemeName = encodeURIComponent(scheme);
 	//var schemeName = getSchemeAmfiUrl(scheme);
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
			$("#adv-alert-msg").html(scheme+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a start date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
    },'text');
	
	if(flag)
	{
		return false;
	}
 	document.location = "/mutual-funds-research/sip-with-annual-increase/" + scheme + "?amount="+amount+"&frequency="+frequency+"&start_date="+startdate+"&end_date="+enddate+"&enhancement_percentage="+enhancement_percentage
}

function getGraph()
{
	var scheme = $("#mf_fund_txt").val();
    var amount = $("#txt_sip_amount").val();
    var frequency = $("#sel_frequency").val();
    var startdate = $("#txt_start_date").val();
    var enddate = $("#txt_end_date").val();
    var enhancement_percentage = $("#sel_enhancement").val();
	
    var fundArray = new Array();
    fundArray.push(scheme + "||false");
    fundArray.push(scheme + "||true");
    
    var fundArrayName = new Array();
    fundArrayName.push(scheme);
    fundArrayName.push(scheme + " with "+enhancement_percentage+"% Enhancement yearly");
    
    var ele = document.getElementById("btn-submit");
 	/* var l = Ladda.create(ele); */
 	/* l.start();  */
 	$("#div_results").show();
 	
 	var container_width = $("#sip-gth-div").width();
    
	var seriesOptions = [],
    seriesCounter = 0,
    names = fundArray,
    // create the chart when all data is loaded
    createChart = function () {

		  $('#sip-gth-container').highcharts('StockChart', {
	        	colors: ['#009899','#D6AF67','#FF8900', '#DDDF00', '#24CBE5', '#64E572','#FF9655', '#FFF263', '#6AF9C4'],
	        	rangeSelector : {
		            enabled: false
		        },
		        navigator: {
		            enabled: false
		        },
		        credits: {
		        	enabled : false,
	                text: "Advisorkhoj.com",
	                href: "https://www.advisorkhoj.com/",
	                style: {
	                	cursor: 'pointer',
	                	color: '#F98D06',
	                	fontSize: '10px'
	                }
		        },
		        scrollbar : {
	                enabled : false
	            },
	            xAxis: {
	            	gridLineColor: "#666",
	            	gridLineWidth: 1,
	            	lineColor: "#666",
	            	tickColor: "#666"
	            },
	            yAxis: {
	            	gridLineColor: "#666",
	            	gridLineWidth: 1,
	            	lineColor: "#666",
	            	tickColor: "#666"
	            },
	            title: {
	                text: 'SIP with ' + enhancement_percentage + '% Yearly Enhancement',
	                style: {
	                    font: 'bold 12px Helvetica Neue, Helvetica, Arial, sans-serif',
	                }
	            },            
	            plotOptions: {
	            	series: {
	                    connectNulls: true,
	                    dataGrouping: {
	                        enabled: false
	                    }
	                }
	            },
	            legend: {
	             	 enabled: true,
	             	itemStyle: {
	              	  font: 'normal 12px Helvetica Neue, Helvetica, Arial, sans-serif',
	                  opacity: 1 // Set opacity for the series
	                 }
	           },
	            tooltip: {
	                headerFormat: '<small>{point.key}</small><br>',
	                pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b><br/>',
	                valueDecimals: 2,
	                xDateFormat : '%b %d, %Y'
	            },

	            series: seriesOptions,
	            chart: {
	            	width : container_width,
	            	events: {
	            	load: function(event) {
	            		$("#sip-gth-spinner").addClass("hidden");
	                    $("#sip-gth-container").show();
	            	}
	            	}
	            	}
	        });
	    };

	$.each(names, function (i, name) {

	    $.getJSON('/mutual-funds-research/getSipEnhancementGraph?scheme=' + encodeURIComponent(fundArray[i]) + "&amount="+amount+"&frequency="+frequency+"&start_date="+startdate+"&end_date="+enddate+"&enhancement_percentage="+enhancement_percentage,    function (data) {

	        seriesOptions[i] = {
	            name: fundArrayName[i],
	            data: data,
	            type: 'area'
	        };

	        // As we're loading the data asynchronously, we don't know what order it will arrive. So
	        // we keep a counter and create the chart when all the data is loaded.
	        seriesCounter += 1;

	        if (seriesCounter === names.length) {
	            createChart();
	        }
	    });
	});
	}

function saveResult() 
{	
	var scheme = $("#mf_fund_txt").val();
    var amount = $("#txt_sip_amount").val();
    var frequency = $("#sel_frequency").val();
    var startdate = $("#txt_start_date").val();
    var enddate = $("#txt_end_date").val();
    var enhancement_percentage = $("#sel_enhancement").val();
	
	var accountMap = '${accountMap}';
	var title = "SIP with Annual Increase -> Scheme = " + scheme + ", Enhancement Percentage = " + enhancement_percentage + "%, Frequency = " + frequency + ", Amount = " + amount + ", Start Date = " + startdate + ", End Date  = " + enddate ;
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

</script>

    <!-- Main -->
    <main>


<div class="premium-calculator-hero text-center">
    <div class="container text-center">
        <div class="hero-label">MF Research</div>
        <h1 class="display-6 text-dark mb-4 animated slideInDown">SIP with Annual Increase</h1>
    </div>
</div>
        
	<section class="section py-5 bg-light pb-8">
	
	<div class="container">
 		<div class="row">
 			<div class="col-lg-12">
 				<div class="premium-glass-card mb-4 p-4">
 					<div class="card-body mf-research-body">
						<div class="row">
					        <div class="col-md-6 col-sm-5 p-0">
					           <div class="form-group">
					           <label class="bold-smaller">Type Any Scheme Name</label>
					           <input id="mf_fund_txt" type="text" class="form-control no-radius" value="${scheme_name}" placeholder="Type Fund Name and Click Submit">
					           </div>
					        </div>
					
					        	<div class="col-md-3 col-sm-3">
						          <div class="form-group">
						            <label class="bold-smaller">Installment Amount</label>
						            <input type="text" id="txt_sip_amount" value="${amount}" maxlength="5" class="form-control no-radius" />
						          </div>
						        </div>
					        
					            <div class="col-md-3 col-sm-3">
						          <div class="form-group">
						            <label class="bold-smaller block">Select Frequency					            	
						            </label>
						            
						            <select id="sel_frequency" class="form-control" data-width="100%">
										<option value="0">Select</option>
										<option value="Fortnightly" <c:if test="${frequency eq 'Fortnightly' }"><c:out value="selected" /></c:if>>Fortnightly</option>
						            	<option value="Monthly" <c:if test="${frequency eq 'Monthly' }"><c:out value="selected" /></c:if>>Monthly</option>
						            	<option value="Quarterly" <c:if test="${frequency eq 'Quarterly' }"><c:out value="selected" /></c:if>>Quarterly</option>
									</select>
						          </div>
						        </div>
			        	</div>
			        </div>
					<div class="col-md-12 col-sm-12 p-0">
			          	<div class="row  pt-0 ">
					        <div class="col-md-3 col-sm-3">
					          <div class="form-group">
					            <label class="bold-smaller">Select Start Date</label>
					            <input type="text" id="txt_start_date" value="${start_date}" class="form-control datepicker no-radius" />
					          </div>
					        </div>
				        
					        <div class="col-md-3 col-sm-3">
					          <div class="form-group">
					            <label class="bold-smaller">Select End Date</label>
					            <input type="text" id="txt_end_date" value="${end_date}" class="form-control datepicker no-radius" />
					          </div>
					        </div>
				        
					        <div class="col-md-3 col-sm-3">
					          <div class="form-group" id="enhancement_select_div">
					            <label class="bold-smaller block">Select Yearly Enhancement(%)</label>
					            <select id="sel_enhancement" class="form-control" data-width="100%">
									<option value="5" <c:if test="${enhancementPercentage eq '5' }"><c:out value="selected" /></c:if>>5</option>
									<option value="10" <c:if test="${enhancementPercentage eq '10' }"><c:out value="selected" /></c:if>>10</option>
									<option value="15" <c:if test="${enhancementPercentage eq '15' }"><c:out value="selected" /></c:if>>15</option>
									<option value="20" <c:if test="${enhancementPercentage eq '20' }"><c:out value="selected" /></c:if>>20</option>
									<option value="25" <c:if test="${enhancementPercentage eq '25' }"><c:out value="selected" /></c:if>>25</option>
									<option value="50" <c:if test="${enhancementPercentage eq '50' }"><c:out value="selected" /></c:if>>50</option>
									<option value="75" <c:if test="${enhancementPercentage eq '75' }"><c:out value="selected" /></c:if>>75</option>
									<option value="100" <c:if test="${enhancementPercentage eq '100' }"><c:out value="selected" /></c:if>>100</option>
								</select>
					          </div>
				        	</div>
				        
					        <div class="col-md-3 col-sm-3 text-end">
					            <div class="form-group marginTop25">
						         	<a id="btn-submit" href="javascript:void(0)" class="btn rounded-pill px-4 py-2 text-white w-100" onclick="getData()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Submit</a>
						        </div>
					        </div>
				       	</div>
 					</div>
 				</div>
 			</div>
 		</div>					
	</div>
		
	<div class="container premium-glass-card mb-5 p-4 border-0">
		<div class="row marginBottom20">
			<div class="card p-4 col-md-12 table-responsive">
									<div id="div_results" class="mt-30"> 
			         <table class="adv-table table table-bordered table-striped mf-research-table" id="stp-transferee">
					  <thead>
						  <tr>
							  <th>Scheme</th>
							  <th class="text-center">SIP Investment Cost </th>
							  <th class="text-center">SIP Value as on ${end_date}</th>
							  <th class="text-center">Growth Amount</th>
							  <th class="text-center">Enhanced Growth Amount</th>
							  <th class="text-center">Enhanced Growth (%)</th>
							  <th class="text-center">Cash Flow</th>
						  </tr>
					  </thead>
					  <tbody>
				     <c:forEach items="${sipYearlyEnhancementResponse}" var="sipYearlyEnhancement" varStatus="status">
				     
				      <c:set var="ep" value="00.00"></c:set>
				      <c:if test="${sipYearlyEnhancement.enhancementPercentage != '.00'}">
				      <fmt:parseNumber var="ep" integerOnly="true" type="number" value="${sipYearlyEnhancement.enhancementPercentage}" />
				      </c:if>
				      
				      
				      <c:choose>	       
				       <c:when test="${enhancementPercentage eq ep}">
					      <tr>
					       <td style="background-color:#edfbf5;"><a class="mutual-funds-anchor" href="/mutual-funds-research/fund-card?scheme=${scheme_name}">${scheme_name} with ${sipYearlyEnhancement.enhancementPercentage}% yearly enhancement </a></td>
					       <td style="background-color:#edfbf5;" class="text-center">${sipYearlyEnhancement.investmentAmount}</td>
					       <td style="background-color:#edfbf5;" class="text-center">${sipYearlyEnhancement.investmentValue}</td>
					       <td style="background-color:#edfbf5;" class="text-center">${sipYearlyEnhancement.sipGrowth}</td>
					       <td style="background-color:#edfbf5;" class="text-center">${sipYearlyEnhancement.enhancementGrowth}</td>
					       <td style="background-color:#edfbf5;" class="text-center">${sipYearlyEnhancement.enhancementGrowthPercent}<c:if test="${sipYearlyEnhancement.enhancementGrowthPercent != '-'}">%</c:if></td>
					       <td class="bg-color text-center" style="cursor:pointer;background-color:#edfbf5;" data-bs-toggle="collapse" data-bs-target="#collapseOne${status.index}" style="cursor:pointer;"><a href="javascript:void();"><i class="fa fa-lg fa-plus-circle" aria-hidden="true"></i></a></td>
					      </tr>
				       </c:when>
				       <c:otherwise>
				          <tr>
				           <%-- <td>${enhancementPercentage} - ${ep}</td> --%>
					       <td><a class="mutual-funds-anchor" href="/mutual-funds-research/fund-card?scheme=${scheme_name}">${scheme_name} with ${sipYearlyEnhancement.enhancementPercentage}% yearly enhancement</a>
					       
					       </td>
					       <td class="text-center units_comma_fixed">${sipYearlyEnhancement.investmentAmount}</td>
					       <td class="text-center units_comma_fixed">${sipYearlyEnhancement.investmentValue}</td>
					       <td class="text-center units_comma_fixed">${sipYearlyEnhancement.sipGrowth}</td>
					       <td class="text-center units_comma_fixed">${sipYearlyEnhancement.enhancementGrowth}</td>
					       <td class="text-center">${sipYearlyEnhancement.enhancementGrowthPercent}<c:if test="${sipYearlyEnhancement.enhancementGrowthPercent != '-'}">%</c:if></td>
					       <td class="text-center" data-bs-toggle="collapse" data-bs-target="#collapseOne${status.index}" style="cursor:pointer;"><a href="javascript:void();"><i class="fa fa-lg fa-plus-circle" aria-hidden="true"></i></a></td>
					      </tr>
				       </c:otherwise>
				      </c:choose>	
				      
				    <tr id="collapseOne${status.index}" class=" accordion-collaps collapse accordion-body">									    
					<td colspan="7">
					<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover font-12">
					<thead style="background-color:#009899;">
					<tr>
					<th class="text-center">NAV Date</th>
					<th class="text-center">NAV</th>	
					<th class="text-center">Units</th>
					<th class="text-center">Cumulative Units</th>
					<th class="text-center">Invested Amount</th>
					<th class="text-center">Cumulative Invested Amount</th>		       
					<th class="text-center">Market Value</th>              
					</tr>
					</thead>
					<tbody> 										            
					<c:forEach var="sipNavResponse" items="${sipNavResponseList[status.index]}">
					<tr> 
					<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${sipNavResponse.nav_date}" /></td>
					<td class="text-center"><fmt:formatNumber value="${sipNavResponse.net_asset_value}" maxFractionDigits="4" /></td>
					<td class="text-center"><fmt:formatNumber value="${sipNavResponse.units}" maxFractionDigits="2" /></td>
					<td class="text-center units_comma_fixed">${sipNavResponse.cumulative_units}</td>
					<td class="text-center units_comma_fixed">${sipNavResponse.amount}</td>
					<td class="text-center units_comma_fixed">${sipNavResponse.cumulative_amount}</td>
					<td class="text-center units_comma_fixed">${sipNavResponse.current_value}</td>
					</tr>
					</c:forEach>										        
					</tbody>
					</table>
					</div>
					</td>	
					<td style="display:none;"></td>		
					<td style="display:none;"></td>	
					<td style="display:none;"></td>	
					<td style="display:none;"></td>	
					<td style="display:none;"></td>	
					<td style="display:none;"></td>								    						
					</tr>
				      
				     </c:forEach>
				     </tbody>
				     </table>
				   </div>
				   
				<div id="sip-gth-div" class="text-center mt-30">
				<!-- <i id="sip-gth-spinner" class="fa fa-cog fa-spin fa-2x" style="margin-top: 100px;margin-bottom: 100px;"></i> -->
				<div id="sip-gth-container" style="min-width: 100%;"></div>
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