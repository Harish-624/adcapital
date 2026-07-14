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

<script>
$(document).ready(function(){
	
	initializeTypeAhead();
	
	var fund = '${schemes}';
	if(fund != "")
	{
		var fund_array = fund.split(",");
		$("#txt_fund_compare1").val(fund_array[0]);
		$("#txt_fund_compare2").val(fund_array[1]);
	}
	
	showBarChart();
	
	showDonutChart();
	
	$("#save_img").on('click', function () {
		
		var category = $("#sel_schemeCategories").val();
	    var fund1 = $("#txt_fund_compare1").val();
	    var fund2 = $("#txt_fund_compare2").val();
	    
	    if(category == null || category == "")
	    {
	 		$("#adv-alert-msg").html("Please select category");
	   	    $("#adv-alert").modal('show');
	   	    return false;
	    }
	    if(fund1 == "")
	    {
	 		$("#adv-alert-msg").html("Please select fund1");
	   	    $("#adv-alert").modal('show');
	   	    return false;
	    }	
	    if(fund2 == "")
	    {
	 		$("#adv-alert-msg").html("Please select fund2");
	   	    $("#adv-alert").modal('show');
	   	    return false;
	    }
	    var schemes = new Array();
	    schemes.push(encodeURIComponent(fund1));
	    schemes.push(encodeURIComponent(fund2));
		
        /* html2canvas(document.querySelector("#bar_chart")).then(canvas => {
			getCanvas = canvas;     //or whatever you want to execute 
			var imgageData = getCanvas.toDataURL("image/png");
			img = imgageData.replace('data:image/png;base64,', '');
			$.ajaxSetup({async:false});
			$.post("/mutual-funds-research/base64toimage", {base64image : img, filename:"bar-chart"}, function(data){
				
			},'text');
        });
        
        html2canvas(document.querySelector("#dount_chart")).then(canvas => {
			getCanvas = canvas;     //or whatever you want to execute 
			var imgageData = getCanvas.toDataURL("image/png");
			img = imgageData.replace('data:image/png;base64,', '');
			$.ajaxSetup({async:false});
			$.post("/mutual-funds-research/base64toimage2", {base64image : img, filename:"down-chart"}, function(data){
				top.location = "/mutual-funds-research/downloadMutualFundPortfolioOverlap?category="+category+"&schemes="+schemes;
			},'text');
        }); */
        
        var path = "/mutual-funds-research/downloadMutualFundPortfolioOverlap?category="+category+"&schemes="+schemes;
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

    	    	    	html2canvas(document.querySelector("#bar_chart")).then(canvas => {
    	    				getCanvas = canvas;     //or whatever you want to execute 
    	    				var imgageData = getCanvas.toDataURL("image/png");
    	    				img = imgageData.replace('data:image/png;base64,', '');
    	    				$.ajaxSetup({async:false});
    	    				$.post("/mutual-funds-research/base64toimage", {base64image : img, filename:"bar-chart"}, function(data){
    	    					
    	    				},'text');
    	    	        });
    	    	        
    	    	        html2canvas(document.querySelector("#dount_chart")).then(canvas => {
    	    				getCanvas = canvas;     //or whatever you want to execute 
    	    				var imgageData = getCanvas.toDataURL("image/png");
    	    				img = imgageData.replace('data:image/png;base64,', '');
    	    				$.ajaxSetup({async:false});
    	    				$.post("/mutual-funds-research/base64toimage2", {base64image : img, filename:"down-chart"}, function(data){
    	    					top.location = "/mutual-funds-research/downloadMutualFundPortfolioOverlap?category="+category+"&schemes="+schemes+"&download=yes";
    	    				},'text');
    	    	        });
    	    	    }
    	        }
    	    }
    	};
    	xhr.send(null);
        
   });
	
	$("#sel_schemeCategories").change(function(){
		$(".txt_fund").val("");
		$("#txt_fund1").focus();		
	});
});

function openLogin(){
	
	var category = $("#sel_schemeCategories").val();
    var fund1 = $("#txt_fund_compare1").val();
    var fund2 = $("#txt_fund_compare2").val();
    
    if(category == null || category == "")
    {
 		$("#adv-alert-msg").html("Please select category");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
    if(fund1 == "")
    {
 		$("#adv-alert-msg").html("Please select fund1");
   	    $("#adv-alert").modal('show');
   	    return false;
    }	
    if(fund2 == "")
    {
 		$("#adv-alert-msg").html("Please select fund2");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
    var schemes = new Array();
    schemes.push(encodeURIComponent(fund1));
    schemes.push(encodeURIComponent(fund2));

    downloadPath = "/mutual-funds-research/downloadMutualFundPortfolioOverlap?category="+category+"&schemes="+schemes;
	imageDownload = "no";
	chartId = "";
	filename = "";
	overlap = "overlap";
	$("#adv-login").modal("show");
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
    var fund1 = $("#txt_fund_compare1").val();
    var fund2 = $("#txt_fund_compare2").val();
    
    if(category == null || category == "")
    {
 		$("#adv-alert-msg").html("Please select category");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
    if(fund1 == "")
    {
 		$("#adv-alert-msg").html("Please select fund1");
   	    $("#adv-alert").modal('show');
   	    return false;
    }	
    if(fund2 == "")
    {
 		$("#adv-alert-msg").html("Please select fund2");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
    if(fund1 == fund2)
    {
 		$("#adv-alert-msg").html("The Fund1 and Fund2 should not be same");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
    var schemes = new Array();
    schemes.push(encodeURIComponent(fund1));
    schemes.push(encodeURIComponent(fund2));
	
 	top.location = "/mutual-funds-research/mutual-fund-portfolio-overlap?category="+category+"&schemes="+schemes;
}
function showDonutChart()
{	
	var no_of_common_stocks = '${no_of_common_stocks}';
	var no_of_uncommon_stocks_scheme1 = '${no_of_uncommon_stocks_scheme1}';
	var no_of_uncommon_stocks_scheme2 = '${no_of_uncommon_stocks_scheme2}';
	var average_portfolio_overlap = '${average_portfolio_overlap}';
	var no_portfolio_overlap = '${no_portfolio_overlap}';
	
	average_portfolio_overlap = parseFloat(average_portfolio_overlap);
	no_portfolio_overlap = parseFloat(no_portfolio_overlap);
	
	var category_array = new Array();
	if(average_portfolio_overlap > 0)
	{
		var arr = new Array();
		arr.push('Average Portfolio Overlap');
		arr.push(average_portfolio_overlap);
		category_array.push(arr);
	}
	if(no_portfolio_overlap > 0)
	{
		var arr = new Array();
		arr.push('No Overlap');
		arr.push(no_portfolio_overlap);
		category_array.push(arr);
	}
	
	var container_width = $("#donut_div").width();
	container_width = container_width - 5;
	
	$('#dount_chart').highcharts({
		colors: ['#009899', '#000', '#FF9655', '#FFF263', '#6AF9C4'],
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            },
            //width : container_width
        },
        title: {
            text: 'Portfolio Overlap'
        },
        credits: {
            enabled: false
        },
        subtitle: {
            text: ''
        },
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45,
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        tooltip: {
            enabled: false
        },
        series: [{
            name: 'Portfolio Overlap',
            data:category_array
        }]
    });
	
	$("#span_common_stocks").html(no_of_common_stocks);
	$("#span_uncommon_stocks_scheme1").html(no_of_uncommon_stocks_scheme1);
	$("#span_uncommon_stocks_scheme2").html(no_of_uncommon_stocks_scheme2);
}
function showBarChart()
{
	var scheme1 = '${scheme1}';
	var scheme2 = '${scheme2}';
	var scheme1_common_stocks = '${scheme1_common_stocks}';
	var scheme2_common_stocks = '${scheme2_common_stocks}';
	var scheme1_uncommon_stocks = '${scheme1_uncommon_stocks}';
	var scheme2_uncommon_stocks = '${scheme2_uncommon_stocks}';
	
	scheme1_common_stocks = parseFloat(scheme1_common_stocks);
	scheme2_common_stocks = parseFloat(scheme2_common_stocks);
	scheme1_uncommon_stocks = parseFloat(scheme1_uncommon_stocks);
	scheme2_uncommon_stocks = parseFloat(scheme2_uncommon_stocks);
	
	var container_width = $("#donut_div").width();
	container_width = container_width;
	
	$('#bar_chart').highcharts({
		colors: ['#009899', '#000', '#FF8900', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'],
        chart: {
            type: 'column',
            //width : container_width
        },
        title: {
            text: 'Portfolio Holdings %'
        },
        credits: {
            enabled: false
        },
        xAxis: {
            categories: ['% Holding of Fund 1 not common with Fund 2', '% Holding of Fund 1 common with Fund 2', '% Holding of Fund 2 common with Fund 1', '% Holding of Fund 2 not common with Fund 1']
        },
        yAxis: {
            allowDecimals: true,
            min: 0,
            title: {
                text: 'Holdings (%)'
            }
        },
        tooltip: {
        	enabled: false
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                    	if(this.y > 0)
                       	{
                        	return Highcharts.numberFormat(this.y, 0, ',') + '%';
                        }
                    },
                }
            }
        },
        series: [{
            name: scheme1,
            data: [scheme1_uncommon_stocks, scheme1_common_stocks, 0, 0],
            stack: 'scheme1'
        }, {
            name: scheme2,
            data: [0, 0, scheme2_common_stocks, scheme2_uncommon_stocks],
            stack: 'scheme2'
        }]
    });
}
function showHoldings()
{
    var category = $("#sel_schemeCategories").val();
    var fund1 = $("#txt_fund_compare1").val();
    var fund2 = $("#txt_fund_compare2").val();
    
    if(category == null || category == "")
    {
 		$("#adv-alert-msg").html("Please select category");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
    if(fund1 == "")
    {
 		$("#adv-alert-msg").html("Please select fund1");
   	    $("#adv-alert").modal('show');
   	    return false;
    }	
    if(fund2 == "")
    {
 		$("#adv-alert-msg").html("Please select fund2");
   	    $("#adv-alert").modal('show');
   	    return false;
    }
    var schemes = new Array();
    schemes.push(encodeURIComponent(fund1));
    schemes.push(encodeURIComponent(fund2));
	
 	top.location = "/mutual-funds-research/common-stocks-across-mf-schemes?category="+category+"&schemes="+schemes;
}
function saveResult() 
{	
	var category = $("#sel_schemeCategories").val();
	var fund1 = $("#txt_fund_compare1").val();
	var fund2 = $("#txt_fund_compare2").val();
    
	var accountMap = '${accountMap}';
	var title = "Mutual Fund Portfolio Overlap -> Category = " + category + ", Scheme Name1 = " + fund1 + ", Scheme Name2 = " + fund2;
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

    <!-- ========================
       page title 
    =========================== -->


<div class="premium-calculator-hero text-center">
    <div class="container text-center">
        <div class="hero-label">MF Research</div>
        <h1 class="display-6 text-dark mb-4 animated slideInDown">Mutual Fund Portfolio Overlap</h1>
    </div>
</div>

    <section class="section py-5 bg-light pb-8">
      <div class="container">
        <div class="row">

          <div class="col-lg-12 pb-3">	
			  <span class="bold-smaller">Portfolio as on ${portfolio_date}</span>
		  </div>
          <div class="col-lg-12">
					<div class="col-lg-12 p-0">
				 		<div class="premium-glass-card mb-5">
				        <div class="card-body mf-research-body p-4">
							<div class="col-md-12 col-sm-12" id="donut_div"></div>
							<div class="row pl-4 pr-4">
							   <div class="col-md-3 col-sm-4">
							      <div class="form-group">
							         <label class="no-bold">Select Category</label>
							         <select id="sel_schemeCategories" class="form-control" data-width="100%">
							            <option value="All">All</option>
							            <c:forEach var="categories" items="${schemeCategories}">
							               <c:choose>
							                  <c:when test="${categories eq category}">
							                     <option selected="selected" value="
							                     <c:out value="${categories}"></c:out>
							                     ">
							                     <c:out value="${categories}"></c:out>
							                     </option>
							                  </c:when>
							                  <c:otherwise>
							                     <c:if test="${categories != 'Fixed Maturity Plans' && categories != 'Gold Funds'}">
							                        <option value="
							                        <c:out value="${categories}"></c:out>
							                        ">
							                        <c:out value="${categories}"></c:out>
							                        </option>
							                     </c:if>
							                  </c:otherwise>
							               </c:choose>
							            </c:forEach>
							         </select>
							      </div>
							   </div>
							   <div class="col-md-3 col-sm-4">
							      <div class="form-group">
							         <label class="no-bold">Fund 1</label>
							         <input id="txt_fund_compare1" type="text" class="txt_fund form-control">
							      </div>
							   </div>
							   <div class="col-md-3 col-sm-4">
							      <div class="form-group">
							         <label class="no-bold width-100">Fund 2</label>
							         <input id="txt_fund_compare2" type="text" class="txt_fund margin-bottom10 form-control">
							      </div>
							   </div>
							   <div class="col-md-3 col-sm-4 text-end">
							      <div class="form-group mt-4">
							         <a href="javascript:void(0)" class="btn rounded-pill px-4 py-2 text-white w-100" onclick="getData()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Submit</a>
							      </div>
							   </div>
							</div>
				        </div> 
	
				 		</div>
			 		</div>
					
					<div class="row mt-40">
					  <div class="col-lg-6">
				      	<div id="bar_chart" style="border:1px solid #ddd; height:500px;"></div>
				      </div>
					  <div class="col-lg-6 p-0" style="border:1px solid #ddd;">
				      	  <div id="dount_chart" style="height:400px;"></div>
					      <div class="res_box text-center">
					      <div style="font-size: 12px;">Number of common stocks: <span id="span_common_stocks"></span></div>
					      <div style="font-size: 12px;">Number of uncommon stocks in ${scheme1}: <span id="span_uncommon_stocks_scheme1"></span></div>
					      <div style="font-size: 12px;">Number of uncommon stocks in ${scheme2}: <span id="span_uncommon_stocks_scheme2"></span></div>
					      </div>
				      </div>
	       		</div>
			 		
          </div><!-- /.col-lg-4 -->

        </div> <!-- /.row -->
      </div><!-- /.container -->
    </section><!-- /.Team layout 1  -->