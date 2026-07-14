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

.datepicker .datepicker-dropdown .dropdown-menu .datepicker-orient-left .datepicker-orient-top{

   top:181px !important;
    left: 755.156px;
    z-index:99999;
    display: bloc
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

<script>




function getStartDate()
{
	if($("#chk_date").is(":checked"))
	{
		var scheme = $("#txt_scheme").val();
	    if(scheme == null || scheme == "")
	    {
	 		alert("Please select scheme");
	   	    // $("#adv-alert").modal('show');
	   	    return false;
	    }
	    
	    $.ajaxSetup({async:true});
		$.post("/mutual-funds-research/getSchemeStartAndEndDate", {scheme_name : "" + scheme + ""}, function(data)
	    {
			var schemes = $.trim(data);
			var schemes_obj = jQuery.parseJSON(schemes);
			var schemes_array = $.makeArray(schemes_obj);
			var from = schemes_array[0].split("-");
			
			startdate =  new Date(from[2], from[1] - 1, from[0]);
			
			$("#txt_start_date").val(startdate.format("dd-mm-yyyy"));
			
	    },'text');
	}
}


function checkStartDate()
{
	var scheme_name = $("#txt_scheme").val();
	var from_date = $("#txt_start_date").val();
	
	if(scheme_name == null || scheme_name == "")
    {
 		alert("Please select scheme");
   	    // $("#adv-alert").modal('show');
   	    return false;
    }
	if(from_date == "")
 	{
 		alert("Please select start date.");
   	    // $("#adv-alert").modal('show');
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
			alert(scheme_name+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a start date which is greater than or equal to scheme inception date.");
	   	    // $("#adv-alert").modal('show');
	   	 	flag = true;
			return false;
		}
    },'text');
	
	if(flag)
	{
		return false;
	}
}
function showResult()
{
    var scheme = $("#txt_scheme").val();
    var startDate = $("#txt_start_date").val();
    var period = $("#sel_period").val();
    
 	if(scheme == null || scheme == "")
    {
 		swal({title:"",text:"Please select scheme"});
   	    return false;
    }	
 	if(startDate == null || startDate == "")
    {
 		swal({title:"",text:"Please select start date"});
   	    return false;
    }
 	if(period == null || period == "")
    {
   	 	swal({title:"",text:"Please select period"});
   	    return false;
    }
 	var period1 = period.charAt(0);
 	
 	var date_arr = startDate.split("-");
 	var start_date_str = date_arr[2] + "-" + date_arr[1] + "-" + date_arr[0];
 	
 	var start_date = new Date(start_date_str);
	start_date.setHours(0, 0, 0, 0);
	var increased_year = start_date.getFullYear() + period;
	start_date.setFullYear(increased_year);
	var current_date = new Date();
	current_date.setHours(0, 0, 0, 0);
	
	if(start_date.getTime() >= current_date.getTime())
	{
   	 	swal({title:"",text:"Please select start date and period less then today date"});
		return;
	}
	var schemeName = encodeURIComponent(scheme);
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
			alert(scheme+" inception date is "+ inception_date.format("dd-mm-yyyy") +". Please select a start date which is greater than or equal to scheme inception date.");
	   	 	flag = true;
		}
    },'text');
	
	if(flag)
	{
		return false;
	}
 	scheme = encodeURIComponent(scheme);
 	
 	console.log("scheme = " + scheme);
 	
 	top.location = "/mutual-funds-research/mutual-fund-rolling-returns-comparison-with-gold-and-sensex?scheme="+scheme+"&start_date="+startDate+"&period="+period;
}

function calculateRollingReturns()
{
    var scheme = $("#txt_scheme").val();
    var startDate = $("#txt_start_date").val();
    var period = $("#sel_period").val();
    
 	if(scheme == null || scheme == "")
    {
 		alert("Please select scheme");
   	    // $("#adv-alert").modal('show');
   	    return false;
    }	
 	if(startDate == null || startDate == "")
    {
 		alert("Please select start date");
   	    // $("#adv-alert").modal('show');
   	    return false;
    }
 	if(period == null || period == "" )
    {
 		alert("Please select period");
   	    // $("#adv-alert").modal('show');
   	    return false;
    }
 	period1 = parseInt(period.charAt(0));
 	
 	var date_arr = startDate.split("-");
 	var start_date_str = date_arr[2] + "-" + date_arr[1] + "-" + date_arr[0];
 	
 	var start_date = new Date(start_date_str);
	start_date.setHours(0, 0, 0, 0);
	var increased_year = start_date.getFullYear() + period1;
	start_date.setFullYear(increased_year);
	var current_date = new Date();
	current_date.setHours(0, 0, 0, 0);
	
	if(start_date.getTime() >= current_date.getTime())
	{
		alert("Please select start date and period less then today date");
   	    // $("#adv-alert").modal('show');
		return;
	}
 	var schemeName = encodeURIComponent(scheme);	
	var data_array = new Array();

	$.ajaxSetup({async:false});
	$.post("/mutual-funds-research/getMutualFundRollingReturnsComparison", {scheme : "" + schemeName + "",start_date : "" + startDate + "",period : "" + period + ""}, function(data)
    {
		var result = $.trim(data);
		if(result == null || result == "null" || result == "")
		{
			alert("Oops something wrong. Please try again later.");
	   	    // $("#adv-alert").modal('show');
	   	    return false;
		}
		var obj = jQuery.parseJSON(result);
		data_array = $.makeArray(obj);
		
    },'text'); 
	
	var master_array = new Array();
	var colors = ['#DB2B1C','#f5851f','#000','#2F3C91','#DB2B1C','#804000','#000066','#00ff00','#0A9BF5','#999999','#3b0066'];
	
	
	
	for(var k=0;k<data_array.length;k++)
	{
		var obj = data_array[k];
		var value_array = $.makeArray(obj);
		var scheme_data = new Array();
		var name = value_array[0].scheme_name;
		var color_name = "";
		if(name == "S&P BSE SENSEX TRI")
		{
			color_name = "#3299bb";
		}else if(name == "Gold")
		{
			color_name = "#69cdc1";
		}else{
			color_name = colors[k];
		}
		
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
                        	var add_value = parseInt(values[1])+period;
                        	if(add_value.length == 1)
                            {
                        		add_value = "0"+add_value;
                            }
                        	return monthStr+"<br>to<br>"+values[0]+" "+add_value;
                        }else{
                        	return values;
                        }
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
                width : container_width,
            }
        }); 
}

$(document).ready(function(){		
	$('#txt_scheme').typeahead({
	    source: function (query, process) {
	    	
	    	var spaceCheckAtEnd = /(\S.*\S)?\s+$/.test(query);
			query = $.trim(query);
	        if (query.length === 0 || !spaceCheckAtEnd) {
	            return process([]);
	        }
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
		checkStartDate();
	});
	
	var scheme = '${scheme}';
	if(scheme != '')
	{
		$("#txt_scheme").val(scheme);
	}
	
	var scheme_inception_date = '${scheme_inception_date}';
	var start_date = '${start_date}';
	if(scheme_inception_date == start_date)
	{
		$("#chk_date").prop("checked", true);
	}
	
	/* var start_date = '${start_date}';
	if(start_date != '')
	{
		$("#txt_start_date").val(start_date);
	} */
	
	calculateRollingReturns();
	
	 $('[data-toggle="tooltip"]').tooltip();
	 //data-placement="top"
});
function getResp()
{	
	$('#research-model').modal('show');
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
        <h1 class="display-6 text-dark mb-4 animated slideInDown">Mutual Fund Rolling Returns Comparison with Gold and Sensex</h1>
    </div>
</div>
        
	<section class="section py-5 pb-8 bg-light">
		<div class="container">
		   <div class="row">
		 		<div class="col-lg-12">
		 			<div class="premium-glass-card p-4 mb-4">
		 				<div class="card-body mf-research-body">
							<div class="row">
						        <div class="col-md-4 col-sm-3">
							        <div class="form-group">
								        <label class="bold-smaller">Enter Scheme Name</label>
								        <input id="txt_scheme" type="text" class="form-control no-radius" placeholder="Enter Scheme Name">
							        </div>
								</div>
						        <div class="col-md-3 col-sm-3">
							        <div class="form-group">
							          <label class="bold-smaller">Select Start Date</label>
							          <input type="text" id="txt_start_date" value="${start_date}" class="form-control datepicker no-radius form-control-sm" />
							        </div>
						        </div>
						        <div class="col-md-3 col-sm-4">
						       	   <div class="form-group">
						            <label class="bold-smaller block">Select Rolling Return Period
						            	<i class="fa fa-question-circle" data-toggle="tooltip" title="The Rolling Return period should correspond to your typical investment holding period. For example, if you hold your investment for 3 years, then select 3 years in the Rolling Return Period"></i>
						            </label>
						            <select id="sel_period" class="form-control form-control-sm" data-width="100%">
										<option value="1 Year" <c:if test="${period eq '1 Year' }"><c:out value="selected" /></c:if>>1 year</option>
										<option value="2 Year" <c:if test="${period eq '2 Year' }"><c:out value="selected" /></c:if>>2 years</option>
										<option value="3 Year" <c:if test="${period eq '3 Year' }"><c:out value="selected" /></c:if>>3 years</option>
										<option value="5 Year" <c:if test="${period eq '5 Year' }"><c:out value="selected" /></c:if>>5 years</option>
										<option value="10 Year" <c:if test="${period eq '10 Year' }"><c:out value="selected" /></c:if>>10 years</option>
										<option value="15 Year" <c:if test="${period eq '15 Year' }"><c:out value="selected" /></c:if>>15 years</option>
									</select>
						          </div>
						        </div> 
						        
						         <div class="col-md-2 col-sm-2 text-end">
								      <div class="form-group mt-4">
								         <label class="bold block hidden-xs">&nbsp;</label>
								         <a href="javascript:void(0)" class="btn rounded-pill px-4 py-2 text-white w-100" onclick="showResult()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Submit</a>
								      </div>
								</div>
						        <div class="row pl-3 pr-3 mt-1">
							        <!-- <div class="col-md-12 col-sm-6">
										<div class="form-group">
								           <div class="checkbox mt-1">
											  <label>
											    <input id="chk_date" type="checkbox" value="" style="margin-top: 3px;" onchange="getStartDate()">
											    Select start date as the scheme inception date
											  </label>
											</div>
								        </div>        
							        </div> -->
						        
									<div class="col-md-3 col-sm-3">
										<div class="form-group">
								       
								        </div>
									</div>
						        </div>	
							</div> 
					   </div>
		 			</div>
		 		</div>
		   </div>
		</div>
		
	<div class="container card border-0">
		<div class="row marginBottom20">
			<div class="col-md-12 table-responsive">
					<div class="row">
			      	<div class="">
			      		<div class="col-md-12 col-sm-12 col-xs-12 padding-0">	
				        	<h5 class="font-size-20 bold-smaller15 margin-bottom0 mt-4 mb-3" style="line-height: 25px;">Mutual Fund Rolling Returns with Gold and Sensex</h5>
				        </div>
					</div>
					</div>	
					
					<div class="row mb-3">
					<div class="col-md-12 col-sm-12 mt-3 tableresponsive nopadding">
						<div class="col-lg-12 border">
							<div class="panel panel-default adv-panel">
								<div class="panel-body padding0 relative text-center" id="rolling-returns-container-div">
									
									<div id="rolling-returns-container"></div>              
								</div>             
							</div>
						</div>    
					</div>
				</div>
				     
					<div class="col-md-12 col-sm-12 table-responsive mt-3">
					<div class="col-md-12 col-sm-12">
				        <p style="text-align:justify;font-size:14px;">Rolling returns are the annualized returns of an asset taken for a specified period (rolling returns period) on every day/week/month and taken till the last day of the duration. In this chart we are showing the annualized returns of the asset over the rolling returns period on every day from the start date and comparing it with the benchmark and other asset classes. Rolling returns is the best measure of an asset's return performance. Trailing returns have a recency bias and point to point returns are specific to the period in consideration. Rolling returns, on the other hand, measures the asset's absolute and relative performance across all timescales, without bias.</p>
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