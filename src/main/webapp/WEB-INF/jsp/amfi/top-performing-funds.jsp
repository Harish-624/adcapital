<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css" />
  
<script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
<style>
   tr.odd td.sorting_1, tr.even td.sorting_1 {
    background-color: #EBF5FB;
}
</style>

<script>
$(document).ready(function(){
	
	$(".comma_fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(0)));  
	});
	
	$(".units_comma_fixed").each(function() {
		$(this).html(numbersWithComma(parseFloat($(this).html()).toFixed(2)));  
	});
	
	var period = '${period}';

	var period_sort = 4;
	if(period == "1y" || period == "1w")
	{
		period_sort = 4;
	}
	if(period == "3y" || period == "1m")
	{
		period_sort = 5;
	}
	if(period == "5y" || period == "3m")
	{
		period_sort = 6;
	}
	if(period == "10y" || period == "6m")
	{
		period_sort = 7;
	}
	if(period == "Since Inception" || period == "ytd")
	{
		period_sort = 8;
	}
	
	
		$('#tbl_scheme_returns').dataTable({
			"pageLength": 10,
	        "bPaginate": true,
	        "bFilter": true,
	        "bInfo": true,
	        "bSort": true,
	        "aoColumnDefs": [
	                         { 'bSortable': false, 'aTargets': [ 1,2 ] }
	                      ],
	        "columns": [
			        	{ "width": "55%" },
		                { "width": "13%" },
		                { "width": "8%" },
		                { "width": "8%" },
		                { "width": "8%" },
		                { "width": "8%" },
		                { "width": "8%" },
		                { "width": "8%" },
		                { "width": "8%" }
	                  ]
	    }).fnSort([period_sort,'desc']); 
		
		
	
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

function getData()
{
 	var category = $.trim($("#sel_schemeCategories").val());
	var period = $.trim($("#sel_period").val());
 	var mode = "Growth";
 	
	top.location =  "/mutual-funds-research/top-performing-mutual-funds?category="+category+"&period="+period+"&mode="+mode;
}
function downloadXl()
{
	var category = $.trim($("#sel_schemeCategories").val());
	var period = $.trim($("#sel_period").val());
 	var mode = "Growth";
 	
	top.location =  "/mutual-funds-research/downloadTopPerformingFundsXl?category="+category+"&period="+period+"&mode="+mode;
		
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
        <h1 class="display-6 text-dark mb-4 animated slideInDown">Mutual Fund Trailing Returns</h1>
    </div>
</div>

<section class="bg-light" id="mfResearch">
	<div class="container py-5">
		<div class="col-md-12">
			<div class="premium-glass-card p-4 mb-4">
				<div class="card-body p-4">
					<div class="row">
						<div class="col-md-3 col-sm-3">
							<div class="form-group">
							   <label class="no-bold">Select Category</label>
							   <select id="sel_schemeCategories" class="form-control form-select rounded-pill bg-light">
								  <c:forEach var="cat" items="${schemeCategories}" varStatus="status">
									 <c:choose>
										<c:when test="${cat eq category}">
										   <option selected="selected" value="${cat}">${cat}</option>
										</c:when>
										<c:otherwise>
										   <option value="${cat}">${cat}</option>
										</c:otherwise>
									 </c:choose>
								  </c:forEach>
							   </select>
							</div>
						 </div>
						 <div class="col-md-3 col-sm-3">
							<div class="form-group">
							   <label class="no-bold">Select Period</label>
							   <select id="sel_period" class="rounded-pill form-control form-select bg-light">
								  <option 
								  <c:if test="${period eq 'ytd' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="ytd">YTD</option>
								  <option 
								  <c:if test="${period eq '1w' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="1w">1 Week</option>
								  <option 
								  <c:if test="${period eq '1m' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="1m">1 Month</option>
								  <option 
								  <c:if test="${period eq '3m' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="3m">3 Month</option>
								  <option 
								  <c:if test="${period eq '6m' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="6m">6 Month</option>
								  <option 
								  <c:if test="${period eq '1y' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="1y" >1 Year</option>
								  <option 
								  <c:if test="${period eq '3y' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="3y">3 Years</option>
								  <option 
								  <c:if test="${period eq '5y' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="5y">5 Years</option>
								  <option 
								  <c:if test="${period eq '10y' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="10y">10 Years</option>
								  <option 
								  <c:if test="${period eq 'Since Inception' }">
									 <c:out value="selected=\'selected\'" />
								  </c:if>
								  value="Since Inception">Since Inception</option>
							   </select>
							</div>
						 </div>
						 <div class="col-md-2 col-sm-2 text-end">
							<div class="form-group ">
							   <label class="no-bold">&nbsp;</label><br>
							   <button class="btn rounded-pill px-4 py-2 text-white w-100" type="button" onclick="getData()" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">Submit</button>
							</div>
						 </div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12 p-1">
						<div class="row">
							<div class="col-md-6">
								<h6 class="font-size-20 bold-smaller15 margin-bottom0  my-2 ms-2">Summary</h6>
							</div>
							<div class="col-md-6 text-end">
								<!-- <a onClick="downloadXl()" href="javascript:;"><i class="fas fa-download me-3" style="color: #ff7c08;"></i></a> -->
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
								<table class="table table-flush border pt-1" id="tbl_scheme_returns">
									<thead class="thead-light">
										<tr>
											<th scope="row">Scheme Name </th>
											<c:if test="${category eq 'All Equity' || category eq 'All Debt' || category eq 'All Hybrid' || category eq 'Exchange Traded Funds'}">
											<th>Category</th>
											</c:if>
											<th width="15%">Launch <br> Date </th>
											<th>AUM  <br>  (Crore)</th>
											<c:choose>
											<c:when test="${category eq 'All Equity' || category eq 'All Debt' || category eq 'All Hybrid' || category eq 'Exchange Traded Funds'}">
											</c:when>
											<c:otherwise>
											<th>Expense <br>  Ratio (%) </th>
											</c:otherwise>
											</c:choose>
											<c:if test="${period eq '1w' || period eq '1m' || period eq '3m' || period eq '6m' || period eq 'ytd'}">
											<th>1-Week <br>  Ret&nbsp;(%)</th>
											<th>1-Month <br>  Ret&nbsp;(%)</th>
											<th>3-Months <br>  Ret&nbsp;(%)</th>
											<th>6-Months  <br> Ret&nbsp;(%)</th>
											<th>YTD <br>  Ret&nbsp;(%)</th>
											</c:if>
											<c:if test="${period eq '1y' || period eq '3y' || period eq '5y' || period eq '10y' || period eq 'Since Inception'}">
											<th>1-Yrs <br>  Ret&nbsp;(%)</th>	
											<th>3-Yrs  <br> Ret&nbsp;(%)</th>	
											<th>5-Yrs  <br> Ret&nbsp;(%)</th>	
											<th>10-Yrs <br>  Ret&nbsp;(%)</th>
											<th>Since <br>  Launch <br>  Ret&nbsp;(%)</th>		
											</c:if>					
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${schemePerformances}" var="schemePerformances">	              
											<tr>
												<td><a href='/mutual-funds-research/fund-card?scheme=<c:out value="${schemePerformances.scheme_amfi_url}"></c:out>' class="mutual-funds-anchor"><c:out value="${schemePerformances.scheme_amfi_short_name}"></c:out></a>             	                
												</td>
												<c:if test="${category eq 'All Equity' || category eq 'All Debt' || category eq 'All Hybrid' || category eq 'Exchange Traded Funds'}">
												<td><c:out value="${schemePerformances.scheme_category}"></c:out></td>
												</c:if>
												<td style="width: 80px;"><fmt:formatDate pattern="dd-MM-yyyy" value="${schemePerformances.inception_date}" /></td>
												<td class="units_comma_fixed"><c:out value="${schemePerformances.scheme_assets}"/></td>
												<c:choose>
												<c:when test="${category eq 'All Equity' || category eq 'All Debt' || category eq 'All Hybrid' || category eq 'Exchange Traded Funds'}">
												</c:when>
												<c:otherwise>
												<td><c:out value="${schemePerformances.ter}"></c:out></td>
												</c:otherwise>
												</c:choose>
												<c:if test="${period eq '1w' || period eq '1m' || period eq '3m' || period eq '6m' || period eq 'ytd'}">
												<td><c:out value="${schemePerformances.returns_abs_7days eq 0 ? '-': schemePerformances.returns_abs_7days}"></c:out></td>
												<td><c:out value="${schemePerformances.returns_abs_1month eq 0 ? '-': schemePerformances.returns_abs_1month}"></c:out></td>
												<td><c:out value="${schemePerformances.returns_abs_3month eq 0 ? '-': schemePerformances.returns_abs_3month}"></c:out></td>
												<td><c:out value="${schemePerformances.returns_abs_6month eq 0 ? '-': schemePerformances.returns_abs_6month}"></c:out></td>
												<td><c:out value="${schemePerformances.returns_abs_ytd eq 0 ? '-': schemePerformances.returns_abs_ytd}"></c:out></td>
												</c:if>
												<c:if test="${period eq '1y' || period eq '3y' || period eq '5y' || period eq '10y' || period eq 'Since Inception'}">
												<td><c:out value="${schemePerformances.returns_abs_1year eq 0 ? '-': schemePerformances.returns_abs_1year}"></c:out></td>
												<td><c:out value="${schemePerformances.returns_cmp_3year eq 0 ? '-': schemePerformances.returns_cmp_3year}"></c:out></td>
												<td><c:out value="${schemePerformances.returns_cmp_5year eq 0 ? '-': schemePerformances.returns_cmp_5year}"></c:out></td>
												<td><c:out value="${schemePerformances.returns_cmp_10year eq 0 ? '-': schemePerformances.returns_cmp_10year}"></c:out></td>
												<td><c:out value="${schemePerformances.returns_cmp_inception eq 0 ? '-': schemePerformances.returns_cmp_inception}"></c:out></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>  
										<c:if test="${category_returns != null}">
											<tr>
												<td>Category Average</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<c:if test="${period eq '1w' || period eq '1m' || period eq '3m' || period eq '6m' || period eq 'ytd'}">
												<td><c:out value="${category_returns.returns_abs_7days eq 0 ? '-': category_returns.returns_abs_7days}"></c:out></td>
												<td><c:out value="${category_returns.returns_abs_1month eq 0 ? '-': category_returns.returns_abs_1month}"></c:out></td>
												<td><c:out value="${category_returns.returns_abs_3month eq 0 ? '-': category_returns.returns_abs_3month}"></c:out></td>
												<td><c:out value="${category_returns.returns_abs_6month eq 0 ? '-': category_returns.returns_abs_6month}"></c:out></td>
												<td><c:out value="${category_returns.returns_abs_ytd eq 0 ? '-': category_returns.returns_abs_ytd}"></c:out></td>
												</c:if>
												<c:if test="${period eq '1y' || period eq '3y' || period eq '5y' || period eq '10y' || period eq 'Since Inception'}">
												<td><c:out value="${category_returns.returns_abs_1year eq 0 ? '-': category_returns.returns_abs_1year}"></c:out></td>
												<td><c:out value="${category_returns.returns_cmp_3year eq 0 ? '-': category_returns.returns_cmp_3year}"></c:out></td>
												<td><c:out value="${category_returns.returns_cmp_5year eq 0 ? '-': category_returns.returns_cmp_5year}"></c:out></td>
												<td><c:out value="${category_returns.returns_cmp_10year eq 0 ? '-': category_returns.returns_cmp_10year}"></c:out></td>
												<td><c:out value="${category_returns.returns_cmp_inception eq 0 ? '-': category_returns.returns_cmp_inception}"></c:out></td>
												</c:if>
											</tr>    
										</c:if>
										<c:if test="${benchmark_returns != null}">       
											<tr>
												<td><c:out value="${benchmark_returns.benchmark_name}"></c:out></td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<c:if test="${period eq '1w' || period eq '1m' || period eq '3m' || period eq '6m' || period eq 'ytd'}">
												<td><c:out value="${benchmark_returns.returns_abs_7days eq 0 ? '-': benchmark_returns.returns_abs_7days}"></c:out></td>
												<td><c:out value="${benchmark_returns.returns_abs_1month eq 0 ? '-': benchmark_returns.returns_abs_1month}"></c:out></td>
												<td><c:out value="${benchmark_returns.returns_abs_3month eq 0 ? '-': benchmark_returns.returns_abs_3month}"></c:out></td>
												<td><c:out value="${benchmark_returns.returns_abs_6month eq 0 ? '-': benchmark_returns.returns_abs_6month}"></c:out></td>
												<td><c:out value="${benchmark_returns.returns_abs_ytd eq 0 ? '-': benchmark_returns.returns_abs_ytd}"></c:out></td>
												</c:if>
												<c:if test="${period eq '1y' || period eq '3y' || period eq '5y' || period eq '10y' || period eq 'Since Inception'}">
												<td><c:out value="${benchmark_returns.returns_abs_1year eq 0 ? '-': benchmark_returns.returns_abs_1year}"></c:out></td>
												<td><c:out value="${benchmark_returns.returns_cmp_3year eq 0 ? '-': benchmark_returns.returns_cmp_3year}"></c:out></td>
												<td><c:out value="${benchmark_returns.returns_cmp_5year eq 0 ? '-': benchmark_returns.returns_cmp_5year}"></c:out></td>
												<td><c:out value="${benchmark_returns.returns_cmp_10year eq 0 ? '-': benchmark_returns.returns_cmp_10year}"></c:out></td>
												<td><c:out value="${benchmark_returns.returns_cmp_inception eq 0 ? '-': benchmark_returns.returns_cmp_inception}"></c:out></td>
												</c:if>
											</tr>
										</c:if>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<p><b>(Mutual Fund Trailing Returns show returns of various periods. The returns can be sorted from highest to lowest to find the Top and Best Performing Mutual Funds in each category. You can find Mutual Fund returns for the period 1 week, 1 month, 3 months, 6 months, I year, 3 years, 5 years, 10 years, Since Inception and YTD (Year to Date). In the trailing returns all the schemes have been considered irrespective of Scheme AUM.)</b></p>
				</div>
			</div>
		</div>
	</div>
</section>