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
	
	initializeTypeAhead();
	
	var fund = '${scheme}';
	if(fund != "")
	{
		$("#txt_fund_compare").val(fund);
	}
	
	$('.datepicker').datepicker({
		format: 'dd-mm-yyyy',
		endDate: '-1d',
		autoclose:true,
		disableTouchKeyboard:true
	}).on('changeDate', function(ev) {
		var ID = $(this).attr("id");
		if(ID == "txt_start_date")
		{
			checkInsuptionDate();
		}
	});
	
	calculateRollingReturns();
	
	$('[data-toggle="tooltip"]').tooltip();
	
	$("#save_img").on('click', function () {
		
		var fundname = $("#txt_fund_compare").val();
	 	var startDate = $("#txt_start_date").val();
	    var period = $("#sel_period").val();
		
		if(fundname == "")
		{
			$("#adv-alert-msg").html("Please enter value for fund");
	   	    $("#adv-alert").modal('show');
			return;
		}
		
		var scheme = fundname;
		var schemeName = encodeURIComponent(scheme);
		
	   /*  html2canvas(document.querySelector("#rolling-returns-container")).then(canvas => {
			getCanvas = canvas;
			var imgageData = getCanvas.toDataURL("image/png");
			img = imgageData.replace('data:image/png;base64,', '');
			$.ajaxSetup({async:false});
			$.post("/mutual-funds-research/base64toimage", {base64image : img, filename:"rolling-return-vs-benchmark"}, function(data){
				top.location = "/mutual-funds-research/downloadRollingReturnBenchmark?scheme="+schemeName+"&period="+period+"&start_date="+startDate;
			},'text');
	    }); */
	    
	    
	    var path = "/mutual-funds-research/downloadRollingReturnBenchmark?scheme="+schemeName+"&period="+period+"&start_date="+startDate;
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
		    	    	 html2canvas(document.querySelector("#rolling-returns-container")).then(canvas => {
		    	 			getCanvas = canvas;
		    	 			var imgageData = getCanvas.toDataURL("image/png");
		    	 			img = imgageData.replace('data:image/png;base64,', '');
		    	 			$.ajaxSetup({async:false});
		    	 			$.post("/mutual-funds-research/base64toimage", {base64image : img, filename:"rolling-return-vs-benchmark"}, function(data){
		    	 				top.location = "/mutual-funds-research/downloadRollingReturnBenchmark?scheme="+schemeName+"&period="+period+"&start_date="+startDate+"&download=yes";
		    	 			},'text');
		    	 	    });
		    	    }
		        }
		    }
		};
		xhr.send(null);
	    
	});
	
	 $("#tbl_scheme_returns").dataTable({
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

function openLogin(){
	
	var fundname = $("#txt_fund_compare").val();
 	var startDate = $("#txt_start_date").val();
    var period = $("#sel_period").val();
	
	if(fundname == "")
	{
		$("#adv-alert-msg").html("Please enter value for fund");
   	    $("#adv-alert").modal('show');
		return;
	}
	
	var scheme = fundname;
	var schemeName = encodeURIComponent(scheme);    
	downloadPath = "/mutual-funds-research/downloadRollingReturnBenchmark?scheme="+schemeName+"&period="+period+"&start_date="+startDate;
	imageDownload = "yes";
	chartId = "#rolling-returns-container";
	filename = "rolling-return-vs-benchmark";
    
	$("#adv-login").modal("show");
}

function getStartAndEndDate()
{
	if($("#chk_date").is(":checked"))
	{
		var fundname = $("#txt_fund_compare").val();
		if(fundname == "")
		{
			$("#adv-alert-msg").html("Please select the fund");
	   	    $("#adv-alert").modal('show');
			return;
		}
		var scheme_name = fundname;
		var schemeName = encodeURIComponent(scheme_name);
		
		$.ajaxSetup({async:false});
		$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
	    {
			var schemes = $.trim(data);
			var schemes_obj = jQuery.parseJSON(schemes);
			var schemes_array = $.makeArray(schemes_obj);
			var from = schemes_array[0].split("-");
			var inception_date = new Date(from[2], from[1] - 1, from[0]);
			$("#txt_start_date").val(moment(inception_date).format("DD-MM-YYYY"));
			$('#txt_start_date').datepicker('setDate', inception_date);		
			
			
	    },'text');
	}
}
function checkInsuptionDate()
{
	var fundname = $("#txt_fund_compare").val();
    var init_start_date = $("#txt_start_date").val();
    if(init_start_date == "")
 	{
 		$("#adv-alert-msg").html("Please select lumpsum amount investment date.");
   	    $("#adv-alert").modal('show');
		return;
 	}
    var scheme_name = fundname;
	var schemeName = encodeURIComponent(scheme_name);
	
	var start_date_arr = init_start_date.split("-");
	var start_date_str = start_date_arr[2] + "-" + start_date_arr[1] + "-" + start_date_arr[0];
	var start_date = new Date(start_date_str);
	
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
	
}
function initializeTypeAhead()
{	
	$('.txt_fund').typeahead({
	    source: function (query, process) {
	    	
	    	
	        return $.ajax({
	            url: '../mutual-funds-research/autoSuggestAllMfSchemes',
	            type: 'post',
	            data: { 
	            	query: query,
	            	category: 'All'
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
function showResult()
{
 	var fundname = $("#txt_fund_compare").val();
 	var startDate = $("#txt_start_date").val();
    var period = $("#sel_period").val();
    
	if(fundname == "")
	{
		$("#adv-alert-msg").html("Please enter value for fund");
   	    $("#adv-alert").modal('show');
		return;
	}
 	if(startDate == null || startDate == "")
    {
 		$("#adv-alert-msg").html("Please select start date");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
 	if(period == null || period == "")
    {
 		$("#adv-alert-msg").html("Please select period");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
 	
 	var date_arr = startDate.split("-");
 	var start_date_str = date_arr[2] + "-" + date_arr[1] + "-" + date_arr[0];
 	var start_date_init = new Date(start_date_str);
	
	var ele = document.getElementById("submit_btn");
 	/* var l = Ladda.create(ele);
 	l.start(); */
	
	var flag = false;
	var scheme = fundname;
	var schemeName = encodeURIComponent(scheme);
	
	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + schemeName + ""}, function(data)
    {
		var schemes = $.trim(data);
		var schemes_obj = jQuery.parseJSON(schemes);
		var schemes_array = $.makeArray(schemes_obj);
		var from = schemes_array[0].split("-");
		var inception_date = new Date(from[2], from[1] - 1, from[0]);
		if(start_date_init < inception_date)
		{
			$("#adv-alert-msg").html(scheme+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a start date which is greater than or equal to scheme inception date.");
	   	    $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
    },'text');
	
	/* l.stop(); */
	
	if(flag)
	{
		return false;
	}
	
 	top.location = "/mutual-funds-research/rolling-return-vs-benchmark?scheme="+schemeName+"&period="+period+"&start_date="+startDate;
}
function calculateRollingReturns()
{
 	var fundname = $("#txt_fund_compare").val();
 	var startDate = $("#txt_start_date").val();
    var period = $("#sel_period").val();
	
	if(fundname == "")
	{
		swal({title:"",text:"Please enter value for fund"});
    	return false;
	}
	
	var scheme = fundname;
	var schemeName = encodeURIComponent(scheme);
	
	var data_array = new Array();

	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getRollingReturnVsBenchmark", {scheme : "" + schemeName + "",start_date : "" + startDate + "",period : "" + period + ""}, function(data)
    {
		var result = $.trim(data);
		if(result == null || result == "null" || result == "")
		{
			swal({title:"",text:"Oops something wrong. Please try again later."});
	    	return false;
		}
		var obj = jQuery.parseJSON(result);
		data_array = $.makeArray(obj);
		
    },'text'); 
	
	
	var master_array = new Array();
	var colors = ['#047689','#fbb150','#000000','#194d30','#8B0045','#804000','#000066','#00ff00','#0A9BF5','#999999','#3b0066'];
	
	for(var k=0;k<data_array.length;k++)
	{
		var obj = data_array[k];
		var value_array = $.makeArray(obj);
		var scheme_data = new Array();
		var name = value_array[0].scheme_name;
		
		var color_name = colors[k];
		
		for(var m=0;m<value_array.length;m++)
		{
			var nav_date = value_array[m].nav_date;
			nav_date = new Date(nav_date).getTime();
			var scheme_rolling_returns = value_array[m].scheme_rolling_returns;
			
			if(scheme_rolling_returns!=null && scheme_rolling_returns!="")
			{
				var scheme_arr = new Array();
				scheme_arr.push(nav_date);
				scheme_arr.push(scheme_rolling_returns);
				scheme_data.push(scheme_arr);
			}
		}
		
		if(scheme_data.length > 0)
		{
			var obj = {
			        name : name,
			        data : scheme_data,
			        color : color_name
			};
			master_array.push(obj);
		}
	}
	
	var container_width = $("#rolling-returns-container-div").width();

    $('#rolling-returns-container').highcharts('StockChart', {
    	
	    	rangeSelector : {
	            enabled: false
	        },
	        navigator: {
	            enabled: false
	        },
	        credits: {
	            enabled: false
	        },
	        scrollbar : {
                enabled : false
            },
            xAxis: {
            	type: 'datetime',
            	labels: {
                    formatter: function() {
                        var monthStr = Highcharts.dateFormat('%b %Y', this.value);
                        var values = monthStr.split(' ');
                        if(values.length > 1)
                        {
                        	var add_value = parseInt(values[1])+parseInt(period);
                        	if(add_value.length == 1)
                            {
                        		add_value = "0"+add_value;
                            }
                        	return monthStr+"<br>to<br>"+values[0]+" "+add_value;
                        }else{
                        	return values;
                        }
                    },
                    style: {
                        fontSize:'10px'
                    }
            }
            },
            yAxis: {
            	labels: {
                    formatter: function() {
                        return this.value + '%';
                    }
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
                 }
            },
            tooltip: {
            	formatter: function() {
            		var dateMonthStr = Highcharts.dateFormat('%b %d', new Date(this.x));
            		var yearStr = Highcharts.dateFormat('%Y', new Date(this.x));
            		var year_int = parseInt(yearStr)+parseInt(period);
            		var str = Highcharts.dateFormat('%b %d, %Y', new Date(this.x)) + ' - '+ dateMonthStr + ', '+ year_int + '<br/>'
            		$.each(this.points, function (i, point) {
            			str += '<span style="color: ' + point.series.color + '">' + point.series.name + ':</span><b>' + Highcharts.numberFormat(point.y, 2)+'%</b><br/>';
                    });
                    return str;
                }
            },
            series: master_array,
            chart: {
            	events: {
            	load: function(event) {
            		$("#rolling-returns-spinner").addClass("hidden");
            		$("#rolling-returns-container").show();            		
            	}
            	},
                width : container_width,
            }
        }); 
}
function saveResult() 
{	
	var fundname = $("#txt_fund_compare").val();
 	var startDate = $("#txt_start_date").val();
    var period = $("#sel_period").val();
    
	var accountMap = '${accountMap}';
	var title = "Rolling Return vs Benchmark -> Scheme = " + fundname + ", Start Date = " + startDate + ", Rolling Return Time Period = " + period;
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

         <!-- ========================
       page title 
    =========================== -->


<div class="premium-calculator-hero text-center">
    <div class="container text-center">
        <div class="hero-label">MF Research</div>
        <h1 class="display-6 text-dark mb-4 animated slideInDown">Rolling Return vs Benchmark</h1>
    </div>
</div>
		<section class="section py-5 pb-8 bg-light">
		
	<div class="container ">
   		<div class="row">
   			<div class="col-lg-12">
   				<div class="premium-glass-card mb-4 p-4" >
   						<div class="card-body mf-research-body" >
							<div class="row">
						        <div class="col-md-6 col-sm-6">
									<div id="div_txt_funds">             
								        <div id="div_fund_1" class="form-group fund">
									        <label class="bold-smaller">Fund </label>
									        <input id="txt_fund_compare" type="text" class="txt_fund form-control">
								        </div>	              
							        </div>
						        </div>
								        
								<div class="col-md-6 col-sm-6">
							        <div class="form-group">
							          <label class="bold-smaller width-100">Select Start Date </label>
							          <input type="text" id="txt_start_date" value="${start_date}" class="form-control datepicker no-radius" />
							        </div>
									<div class="form-group">
										<div class="checkbox mt-1">
											<label class="stepsAddmore"><input id="chk_date"  style="margin-top: 3px;" type="checkbox" value="" onchange="getStartAndEndDate()"> Prefill start date with inception date</label>
										</div>
							        </div>
						        </div>
							</div>
										
					        <div class="row">
						        <div class="col-md-4 col-sm-4">
						       	   <div class="form-group">
							            <label class="bold-smaller block">Select Rolling Return Period
							            <i class="fa fa-question-circle" data-toggle="tooltip" title="The Rolling Return period should correspond to your typical investment holding period. For example, if you hold your investment for 3 years, then select 3 years in the Rolling Return Period"></i>
							            </label>
							            <select id="sel_period" class="form-control" data-width="100%">
							            	<option value="1 Month" <c:if test="${period eq '1 Month' }"><c:out value="selected" /></c:if>>1 Month</option>
											<option value="1 Year" <c:if test="${period eq '1 Year' }"><c:out value="selected" /></c:if>>1 Year</option>
											<option value="2 Year" <c:if test="${period eq '2 Year' }"><c:out value="selected" /></c:if>>2 Years</option>
							            	<option value="3 Year" <c:if test="${period eq '3 Year' }"><c:out value="selected" /></c:if>>3 Years</option>
							            	<option value="5 Year" <c:if test="${period eq '5 Year' }"><c:out value="selected" /></c:if>>5 Years</option>
							            	<option value="7 Year" <c:if test="${period eq '7 Year' }"><c:out value="selected" /></c:if>>7 Years</option>
							            	<option value="10 Year" <c:if test="${period eq '10 Year' }"><c:out value="selected" /></c:if>>10 Years</option>
							            	<option value="15 Year" <c:if test="${period eq '15 Year' }"><c:out value="selected" /></c:if>>15 Years</option>
										</select>
						          </div>
						        </div> 
								<div class="col-md-3 col-sm-3 text-end">
									<div class="form-group mt-4">
										<label class="bold block hidden-xs">&nbsp;</label>
								        <a href="javascript:void(0)" id="submit_btn" class="btn rounded-pill px-4 py-2 text-white w-100" onclick="showResult()" data-style="expand-right" data-size="l" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);"><span class="ladda-label">Submit</span></a>
							        </div>
								</div>
					        </div>	
					   </div>
   				</div>
   			</div>
   		</div>
	</div>
		
	<div class="container premium-glass-card border-0 mb-5 p-4">
		<div class="row marginBottom20">
			<div class="col-md-12 table-responsive">
				
				<div class="col-md-12 col-sm-12 remove-bootstrap-col-lr-padding table-responsive nopadding">
			      	<div class="col-md-12">
			           <!-- <h2 class="font-size-16">Rolling Return vs Benchmark</h2>   -->  
			            <div class="panel panel-default adv-panel">
			            <div class="panel-body padding0 relative text-center" id="rolling-returns-container-div">
						  <!-- <i id="rolling-returns-spinner" class="fa fa-cog fa-spin fa-2x" style="margin-top: 100px;margin-bottom: 100px;"></i> -->
			              <div id="rolling-returns-container" style="width:100%;"></div>              
			            </div>
			         </div>    
			     	</div>
			     </div>   
        		
        		
        		<%-- <div class="col-md-12 col-sm-12 mt-3 mb-3 pl-0 pr-0 table-responsive">
				       <table class="adv-table table table-striped table-bordered mf-research-table" id="tbl_scheme_returns">
				        <thead>
				        	<tr>
				                <th></th>
				                <th colspan="4" class="text-center">Key Parameters</th>
				               	<th colspan="6" class="text-center">Return Consistency (% of times)</th>
				            </tr>
				            <tr>
				                <th>Scheme / Category Name</th>
				                <th class="text-center">Average</th>
				                <th class="text-center">Median</th>
				               	<th class="text-center">Maximum</th>
				              	<th class="text-center">Minimum</th>
				               	<th class="text-center">Less than 0%</th>
				               	<th class="text-center">0 - 8%</th>
				               	<th class="text-center">8 - 12%</th>
				               	<th class="text-center">12 - 15%</th>
				               	<th class="text-center">15 - 20%</th>
				               	<th class="text-center">Greater than 20%</th>
				            </tr>
				            </thead>
				            <tbody>
				            <c:forEach items="${rollingReturnsSummaryList}" var="rollingReturns" varStatus="status">	              
				              <tr>
				                <td><a href='/mutual-funds-research/fund-card?scheme=<c:out value="${rollingReturns.scheme_name}"></c:out>' class="mutual-funds-anchor"><c:out value="${rollingReturns.scheme_name}"></c:out></a></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.average}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.median}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.maximum}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.minimum}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.less_than_0}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.less_than_5}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.less_than_10}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.less_than_15}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.less_than_20}" minFractionDigits="2" maxFractionDigits="2" /></td>
				                <td class="text-center"><fmt:formatNumber value="${rollingReturns.greater_than_20}" minFractionDigits="2" maxFractionDigits="2" /></td>
								</tr>
				            </c:forEach>
				            </tbody>
				       </table>
				</div> --%>
				
				<div class="mt-20">
			        <p style="text-align:justify;font-size:14px;">Rolling returns are the annualized returns of the scheme taken for a specified period (rolling returns period) 
			        on every day/week/month and taken till the last day of the duration. In this chart we are showing the annualized returns over the 
			        rolling returns period on every day from the start date and comparing it with the benchmark. Rolling returns is the best measure of a fund's performance. 
			        Trailing returns have a recency bias and point to point returns are specific to the period in consideration. Rolling returns, on the other hand, 
			        measures the fund's absolute and relative performance across all timescales, without bias.</p>
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