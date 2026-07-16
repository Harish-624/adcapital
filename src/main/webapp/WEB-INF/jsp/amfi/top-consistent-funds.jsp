<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    


<style>
table.dataTable thead .sorting_desc {
    background-image: url('/img/down.webp') !important;
}
table.dataTable thead .sorting_asc {
    background-image: url('/img/up.webp') !important;
}
table.dataTable thead .sorting {
    background-image: url(../img/down.webp);
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
	
	$(".comma_fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(0)));  
	});
	
	$(".units_comma_fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(2)));  
	});
	
	$('#tbl_scheme_returns').dataTable({
		"bPaginate": true,
        "bFilter": true,
        "bInfo": true,
        "bSort": true,
        "aoColumnDefs": [                         
                         { 'bSortable': false, 'aTargets': [ 2 ]}
        ],
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
    }).fnSort([7,'desc']);
	
		
		
	
});
var _MS_PER_DAY = 1000*60*60*24;
$(document).ready(function(){
	
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
	
	$('[data-toggle="tooltip"]').tooltip();
	
	$(".comma_fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(0)));  
	});
	
	$(".units_comma_fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(2)));  
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

function checkStartDate()
{    
    var fdate = $("#txt_start_date").val();
    var today = new Date();
    var period = $("#sel_period").val();
    
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();  
    
    if(dd<10) 
    {
        dd='0'+dd;
    } 

    if(mm<10) 
    {
        mm='0'+mm;
    } 
    
    var yyyy1 = yyyy-3;
    var yyyy3 = yyyy-5;
    var yyyy5 = yyyy-7;
    
    var formatted_todays_date = dd + '-' + mm + '-' + yyyy;    
    
    var back_1_todays_date = dd + '-' + mm + '-' + yyyy1;
    var back_3_todays_date = dd + '-' + mm + '-' + yyyy3;
    var back_5_todays_date = dd + '-' + mm + '-' + yyyy5;    
         
	var fday=fdate.substring(0,2);
	var fmonth=fdate.substring(3,5);
	var fyear=fdate.substring(6,fdate.length);	
	
 	var tday1=back_1_todays_date.substring(0,2);
	var tmonth1=back_1_todays_date.substring(3,5);
	var tyear1=back_1_todays_date.substring(6,back_1_todays_date.length);
	
	var tday3 = back_3_todays_date.substring(0,2);
	var tmonth3 = back_3_todays_date.substring(3,5);
	var tyear3 = back_3_todays_date.substring(6,back_3_todays_date.length);
	
	var tday5=back_5_todays_date.substring(0,2);
	var tmonth5=back_5_todays_date.substring(3,5);
	var tyear5=back_5_todays_date.substring(6,back_5_todays_date.length);
   
	var fdate_int = eval(fyear+fmonth+fday);
	
	var tdate_int1 = eval(tyear1+tmonth1+tday1);
	var tdate_int3 = eval(tyear3+tmonth3+tday3);
	var tdate_int5 = eval(tyear5+tmonth5+tday5);
	
	if(period == "1 Year")
	{
		//alert("fdate_int............>"+fdate_int);
		//alert("tdate_int1............>"+tdate_int1);
		if(fdate_int > tdate_int1)
		{
		$("#adv-alert-msg").html("Start date should be at least 3 years ago (from today)");
   	    $("#adv-alert").modal('show');	   
	   	return false;
		}
	}
	if(period == "3 Year")
	{
		//alert("fdate............>"+fdate);
		//alert("back_3_todays_date............>"+back_3_todays_date);
		if(fdate_int > tdate_int3)
		{
		$("#adv-alert-msg").html("Start date should be at least 5 years ago (from today)");
   	    $("#adv-alert").modal('show');	   
	   	return false;
		}
	}
	if(period == "5 Year")
	{
		//alert("fdate............>"+fdate);
		//alert("back_5_todays_date............>"+back_5_todays_date);
		if(fdate_int > tdate_int5)
		{
		$("#adv-alert-msg").html("Start date should be at least 7 years ago (from today)");
   	    $("#adv-alert").modal('show');	   
	   	return false;
		}
	}
	else
	{		
	  
	}	 
}
function diff_years(dt2, dt1) 
{ 
var formatTDate = new Date(GetDate(dt2));
var formatFrmDate = new Date(GetDate(dt1));
var diff = (formatTDate.getTime() - formatFrmDate.getTime()) / 1000;
diff /= (60 * 60 * 24);
return Math.abs(Math.round(diff/365.25));  
}
/* dt1 = new Date(2014,10,2);
dt2 = new Date(2014,10,11);
console.log(diff_years(dt1, dt2));

dt1 = new Date("June 13, 2014 08:11:00");
dt2 = new Date("October 19, 2017 11:13:00");
console.log(diff_years(dt1, dt2)); */
function dateDiffInDays(tDt,fDt)
{
	var formatTDate = new Date(GetDate(tDt));
	var formatFrmDate = new Date(GetDate(fDt));

	var utc1 = Date.UTC(formatTDate.getFullYear(), formatTDate.getMonth(), formatTDate.getDate());
	var utc2 = Date.UTC(formatFrmDate.getFullYear(), formatFrmDate.getMonth(), formatFrmDate.getDate());
	return Math.floor((utc1-utc2)/_MS_PER_DAY);
}
function GetDate(str) 
{
	var arr = str.split('-');
	var formatddate = arr[1]  + '/' + arr[0] + '/' + arr[2];
	return formatddate;
 }
function getData()
{
	var category = $("#sel_schemeCategories").val();
	
       
    var flag = false;
    
 	if(category == null || category == "")
    {
 		$("#adv-alert-msg").html("Please select category");
   	    $("#adv-alert").modal('show');
   	    return false;
    } 
 	
 	top.location = "/mutual-funds-research/top-consistent-mutual-fund-performers?category="+category;
}
function downloadXl()
{
	var category = $("#sel_schemeCategories").val();	
    
    var flag = false;
    
 	if(category == null || category == "")
    {
   	    swal({title:"",text:"Please select category"});
   	    return false;
    } 
 	
 	 $.ajaxSetup({async:true});
     $.post("/mutual-funds-research/checkDownloadCount", function(data)
     {
 		var result = $.trim(data);
 		var obj = jQuery.parseJSON(result);	
 		
 		if(obj.status == "200")
 		{
 			top.location = "/mutual-funds-research/downloadTopConsistentMutualFundPerformersXL?category="+category;
 		}else
 		{
 			swal("OOPS!", obj.msg, "error");
 			return false;
 		}	
     }, "text");
}
function openLogin()
{
	$("#research_login_model").modal('show');
}
</script>

<div class="premium-calculator-hero text-center">
    <div class="container text-center">
        <div class="hero-label">MF Research</div>
        <h1 class="display-6 text-dark mb-4 animated slideInDown">Top Consistent Mutual Fund Performers</h1>
    </div>
</div>

<section class="bg-light" id="mfResearch">
	<div class="container py-5">
		<div class="col-md-12">
			<div class="premium-glass-card p-4 mb-4">
				<div class="card-body p-4">
					<div class="row">
						<div class="col-lg-4">
							  <div class="form-group">
								  <label class="no-bold">Select Category</label>
								  <select id="sel_schemeCategories" class="form-control rounded-pill bg-light" data-width="100%"> 
									  <c:forEach var="categories" items="${schemeCategories}"> 
										  <c:choose>
											  <c:when test="${categories eq category}">
												  <option selected="selected" value="<c:out value="${categories}"></c:out>"><c:out value="${categories}"></c:out></option>
											  </c:when>
											  <c:otherwise>
												  <c:if test="${categories != 'Fixed Maturity Plans' && categories != 'Gold Funds'}">
													  <option value="<c:out value="${categories}"></c:out>"><c:out value="${categories}"></c:out></option>
												  </c:if>
											  </c:otherwise>
										  </c:choose>
									  </c:forEach>
								  </select>
							  </div>
						  </div>       
			  
						  <div class="col-md-3 col-sm-2 col-xs-12 text-end">
							<div class="form-group">
							   <label class="bold block hidden-xs">&nbsp;</label>
							   <button class="btn rounded-pill px-4 py-2 text-white w-100" type="button" onclick="getData()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Submit</button>
							</div>
						 </div>
					</div>
				</div>
			</div>
			<div class="premium-glass-card mb-4">
				<div class="card-body p-4">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped table-colored table-bordered mf-research-table counton-table" id="tbl_scheme_returns">
									  <thead class="theadBody">
										  <tr>
											  <th>Scheme Name</th>
											  <th>Launch Date</th>
											  <th>AUM (Crore)</th>
											  <th>Expense Ratio (%)</th>
											  <th>1-Yr Return (%)</th>
											  <th>3-Yrs Return (%)</th>
											  <th>5-Yrs Return (%)</th>
											  <th>10-Yrs Return (%)</th>	               
										  </tr>
									  </thead>
									  <tbody>
										  <c:forEach items="${rollingReturnsSummaryList}" var="rollingReturns" varStatus="status">	                
											  <tr>
												  <td><a href='/mutual-funds-research/fund-card?scheme=<c:out value="${rollingReturns.scheme_name}"></c:out>' class="mutual-funds-anchor"><c:out value="${rollingReturns.scheme_name}"></c:out></a></td>
												  <td>${rollingReturns.scheme_inception_date}</td>
												  <td class="units_comma_fixed">${rollingReturns.scheme_assets }</td>	
												  <td><fmt:formatNumber value="${rollingReturns.expense_ratio}" minFractionDigits="2" maxFractionDigits="2" /></td>
												  <td><fmt:formatNumber value="${rollingReturns.one_yr_return}" minFractionDigits="2" maxFractionDigits="2" /></td>
												  <td><fmt:formatNumber value="${rollingReturns.three_yr_return}" minFractionDigits="2" maxFractionDigits="2" /></td>
												  <td><fmt:formatNumber value="${rollingReturns.five_yr_return}" minFractionDigits="2" maxFractionDigits="2" /></td>
												  <td>
													  <c:choose>
														  <c:when test="${rollingReturns.ten_yr_return eq 0.00}">
														  -
														  </c:when>
														  <c:otherwise>
															  <fmt:formatNumber value="${rollingReturns.ten_yr_return}" minFractionDigits="2" maxFractionDigits="2" />
														  </c:otherwise>
													  </c:choose>	
												  </td>            
											  </tr>
										  </c:forEach>
									  </tbody>
								  </table>
							</div>
						</div>
						<div class="col-md-12 table-responsive text-justify">
				  			<p class="font-11" style="font-size: 0.9rem;">Most consistent funds have been chosen based on average rolling returns and consistency with which funds have beaten category average returns. We have ranked schemes based on these two parameters using our proprietary algorithm and are showing the most consistent schemes for each category. Note that we have ranked schemes which have performance track records of at least 5 years (consistency cannot be measured unless a scheme has sufficiently long track record covering multiple market cycles e.g. bull market, bear market, sideways market etc). Also note that, schemes whose AUMs have not yet reached Rs 500 crores have been excluded from ranking.</p>
					  	</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
</section>