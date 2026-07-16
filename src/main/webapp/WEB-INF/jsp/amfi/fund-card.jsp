<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="/vendors/apexcharts/apexcharts.css">
<script type="text/javascript" src="/vendors/apexcharts/apexcharts.min.js"></script>
<script type="text/javascript" src="/js/html2canvas.js"></script>



<script type="text/javascript">

	var nav = '${nav}';
	var fund = '${scheme}';
	var client_name = '${client_name}';

	var navLoaded = 0;
	var yearlyLoaded = 0;
	var issuersLoaded = 0;
	
	$(document).ready(function(){
		
		getCompleteNavReport();
		yearlyPerformaceGraph();
		getRelatedFunds();
		if('${schemeMapping.scheme_broad_category}' != 'Debt Schemes' 
						&& '${schemeMapping.scheme_advisorkhoj_category}' != 'Fund of Funds-Domestic-Debt' 
						&& '${schemeMapping.scheme_sub_category}' != 'Debt: Gilt'
						&& '${schemeMapping.scheme_sub_category}' != 'Debt: Money Market'
						&& '${schemeMapping.scheme_sub_category}' != 'Target Maturity' ) {
			renderIssuers();
			renderAssets();
		}
		
		showPortfolioAnalysis();
		renderHoldings();
		historicValueLoad();
		
		initializeTypeAhead();
	    
	  	//$(".rowcompar").hide();
		$('.multiDiv').hide();
		$('.sipMinimum').hide();
		$('#lumpSpan').html(numbersWithComma(parseInt($('#lumpSpan').html())));
		$('#sipSpan').html(numbersWithComma(parseInt($('#sipSpan').html())));
		
		$('.2x_in').show();
		$(".row-0,.row-1,.row-2,.row-3,.row-4").show();
		
		
	    $('.perfomance .custom-pills').each(function() {
	        var rateOfReturn = $(this).attr('data-return');
	        if(rateOfReturn == 0) {
	        	$(this).hide();
	        }
	    });
	    
	    $('.invTypeCheck').change(function() {
	        if($(this).is(":checked")) {
	            $('.invTypeText').html('Monthly Amount');
	            $('.sipMinimum').show();
	            $('.lumpMinimum').hide();	            
	        } else {
	        	$('.invTypeText').html('One Time Amount');
	        	$('.lumpMinimum').show();
	            $('.sipMinimum').hide();
	        }
	             
	    }); 
		
		$('.btn-toggle').click(function() {
	    $(this).find('.btn').toggleClass('active');  
	    
	    if ($(this).find('.btn-primary').length>0) {
	    	$(this).find('.btn').toggleClass('btn-primary');
	    }
	    if ($(this).find('.btn-danger').length>0) {
	    	$(this).find('.btn').toggleClass('btn-danger');
	    }
	    if ($(this).find('.btn-danger').length>0) {
	    	$(this).find('.btn').toggleClass('btn-danger');
	    }
	    if ($(this).find('.btn-info').length>0) {
	    	$(this).find('.btn').toggleClass('btn-info');
	    }
	    
	    $(this).find('.btn').toggleClass('btn-default');
	});
	
	$('#sip-submit').click(function(e){
	 	e.preventDefault();

	 	var fund = $("#mf_fund_txt").val();
	 	
	 	if(fund == "")
	 	{
	 		$("#adv-alert-msg").html("Please type an Fund Name and select it from the autocomplete functionality.<br/>Then click on Submit.");
	   	    $("#adv-alert").modal('show');
	 	}
	 	
	 	var l = Ladda.create(this);
	 	l.start();
	 	
	 	var schemeName = encodeURIComponent(fund);
	 	
	 	$.ajaxSetup({async:false});
		$.post("/mutual-funds-research/isValidFundNameSchemeDetails", {fund : schemeName}, function(data)
	    {
			l.stop();
			var result = $.trim(data);
			if(result == "true")
			{
				document.location =  "/mutual-funds-research/"+schemeName; 
			}
			else
			{
				$("#adv-alert-msg").html("Please type an Fund Name and select it from the autocomplete functionality.<br/>Then click on Submit.");
		   	    $("#adv-alert").modal('show');
			}			
	    },'text');
	 	
	 	return false;
	});
});
	
	function numbersWithComma(x) {
	    x = x.toString();
	    var afterPoint = '';
	    if (x.indexOf('.') > 0) afterPoint = x.substring(x.indexOf('.'), x.length);
	    x = Math.floor(x);
	    x = x.toString();
	    var lastThree = x.substring(x.length - 3);
	    var otherNumbers = x.substring(0, x.length - 3);
	    if (otherNumbers != '') lastThree = ',' + lastThree;
	    var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
	    return res;
	}
	
	function sectorAllocationClick()
	{
		var sector_text = $("#sector_anchor_span").html();	
		if(sector_text == "Show All Sectors")
		{
			$("#fullSectorAnchor").html('<span id="sector_anchor_span" class="paddingRight5">Hide All Sectors</span> <i class="fa fa-chevron-circle-up"></i>');
			$("#full_sector_data_table tr:gt(9)").show();
		}else{
			$("#fullSectorAnchor").html('<span id="sector_anchor_span" class="paddingRight5">Show All Sectors</span> <i class="fa fa-chevron-circle-down"></i>');
			$("#full_sector_data_table tr:gt(9)").hide();
		}
	}
	function holdingsAllocationClick()
	{
		var holdings_text = $(".holdings_anchor_span").html();	
		if(holdings_text == "Show All Holdings")
		{
			$(".fullHoldingsAnchor").html('<span class="holdings_anchor_span paddingRight5">Hide All Holdings</span> <i class="fa fa-chevron-circle-up"></i>');
			$(".holdings_full_table tr:gt(10)").show();
		}else{
			$(".fullHoldingsAnchor").html('<span class="holdings_anchor_span paddingRight5">Show All Holdings</span> <i class="fa fa-chevron-circle-down"></i>');
			$(".holdings_full_table tr:gt(10)").hide();
		}
	}
	
	function showPortfolioAnalysis() {
		$("#asset-gth-spinner").show();
		$("#portfolio-gth-spinner").show();

		$("#fullSector").addClass("in");
		$("#fullHoldings").addClass("in");

		var scheme_amfi = '${scheme}';

	
		$.ajaxSetup({async : false});
		$.post("/mutual-funds-research/getPortfolioAnalysis",{scheme_amfi : scheme_amfi}, function(data) {
							var result = $.trim(data);
							var obj = jQuery.parseJSON(result);
							var scheme_asset = obj.schemeAssets;
							var schemePortfolioAnalysisResponse = obj.schemePortfolioAnalysisResponse;
							var schemePortfolioList_array = $
									.makeArray(schemePortfolioAnalysisResponse.schemePortfolioList);
							var sectorAllocationMap = schemePortfolioAnalysisResponse.sectorAllocationMap;
							var assetAllocationMap = schemePortfolioAnalysisResponse.assetAllocationMap;

							/* schemeAssets */
				/* schemeAssets */
		
							if (sectorAllocationMap == null
									|| sectorAllocationMap == undefined
									|| sectorAllocationMap == ""
									|| schemePortfolioList_array == null
									|| schemePortfolioList_array == undefined
									|| schemePortfolioList_array.length == 0) {
								//$("#portfolio-gth-spinner").hide();
								$('#portfolio-gth-spinner')
										.html(
												"<b>Portfolio Analysis Not Available</b>");
								return false;
							}

							/* Sectors */
							var sector_data = "";
							sector_data += '<table class="table table-striped" style="border: none" id="full_sector_data_table"><thead><tr><th >Sector</th><th class="text-right">Allocation (%)</th></tr></thead><tbody>';
							for ( var key in sectorAllocationMap) {
								var value = sectorAllocationMap[key];
								sector_data += '<tr><td>' + key + '</td><td class="text-right">'+ value + '</td></tr>';
							}
							sector_data += '</tbody></table>';
							//$("#full_sector_data").html(sector_data);

							/* Holdings */
							
							var ten_holdings_data = '<table class="table table-bordered full_holdings_data_table" style="border: none; margin:0px;"><thead><tr style="background: #000;"><th>Company</th>';
							var all_holdings_data = '<table class="table table-bordered holdings_full_table" style="border: none; margin:0px;"><thead><tr style="background: #000;"><th>Company</th>';
							
							ten_holdings_data +=  '<th class="text-right">Holdings (%)</th></tr></thead><tbody>';
							all_holdings_data +=  '<th class="text-right">Holdings (%)</th></tr></thead><tbody>';
							
							for (var i = 0; i < schemePortfolioList_array.length; i++) {
								var company_name = schemePortfolioList_array[i].instrument;
								var holdings = schemePortfolioList_array[i].holdings;
								var instrument = schemePortfolioList_array[i].asset_class;
								var rating = schemePortfolioList_array[i].rating_eq;
								var industry = schemePortfolioList_array[i].industry;
								ten_holdings_data += '<tr><td class="green-lite-bg">' + company_name + '</td>';
								all_holdings_data += '<tr><td class="green-lite-bg">' + company_name + '</td>';
								all_holdings_data += '<td class="text-right orange-lite-bg">' + holdings + '</td></tr>';
								
								ten_holdings_data += '<td class="text-right orange-lite-bg">' + holdings + '</td></tr>';
								
							}
							ten_holdings_data += '</tbody></table>';
							all_holdings_data += '</tbody></table>';							
							
							$(".full_holdings_data").html(ten_holdings_data);
							$(".full_holdings_data_2").html(all_holdings_data);
							
							var portfolio_date = new Date(schemePortfolioList_array[0].portfolio_date);
							var curr_date = portfolio_date.getDate();
							var curr_month = portfolio_date.getMonth() + 1; //Months are zero based
							var curr_year = portfolio_date.getFullYear();
							//1portfolio_date = portfolio_date.replace('00:00:00 GMT+0530 (India Standard Time)', '');
							$("#portfolio_date_txt").html(schemePortfolioList_array[0].portfolio_date);
							$("#portfolio_date_div").show();

							if('${schemeMapping.scheme_broad_category}' != 'Debt Schemes' 
									&& '${schemeMapping.scheme_advisorkhoj_category}' != 'Fund of Funds-Domestic-Debt'
									&& '${schemeMapping.scheme_sub_category}' != 'Debt: Gilt'
									&& '${schemeMapping.scheme_sub_category}' != 'Debt: Money Market'
									&& '${schemeMapping.scheme_sub_category}' != 'Target Maturity')
							{
								var sector_names_array = $
								.makeArray(schemePortfolioAnalysisResponse.sectorNamesString);
								var sector_value_string = $
										.makeArray(schemePortfolioAnalysisResponse.sectorAllocationMorrisString);
								var total_sector = 0;
								var sector_value_array = new Array();
		
								for (var i = 0; i < (sector_value_string.length - 1); i++) {
									var sector_name = sector_names_array[i];
									var sector_value = parseFloat(sector_value_string[i]);
									total_sector = total_sector + sector_value;
									var arr = new Array();
									arr.push(sector_name);
									arr.push(sector_value);
									sector_value_array.push(arr);
								}
								if (total_sector < 100) {
									var sector_others = 100 - total_sector;
									var arr = new Array();
									arr.push("Others");
									arr.push(sector_others);
									sector_value_array.push(arr);
								}
		
								var sector_data = new Array();
								var sector_keys = new Array();
								for(var key in sectorAllocationMap) {
								    var value = sectorAllocationMap[key];
								    sector_keys.push(key);
									sector_data.push(parseFloat(value).toFixed(2));
								}
								
								var sectorChart = {
									  chart: {
										height: 350,
										type: 'bar',
										toolbar: {
								              show: false
								            }
									  },
									  plotOptions: {
										bar: {
											barHeight: '100%',
											distributed: true,
											horizontal: true					
										}
									  },
									  colors: ['#33b2df', '#546E7A', '#d4526e', '#13d8aa', '#A5978B', '#2b908f', '#f9a3a4', '#90ee7e',
										  '#f48024', '#69d2e7'],
									  dataLabels: {
										enabled: true,
										formatter: function(val, opt) {
											  return  val +" %"
										  },style: {
											    colors: ['#000']
										  }
									  },
									  series: [{
										data: sector_data.slice(0, 10)
									  }],
									  xaxis: {
										categories: sector_keys.slice(0, 10),
									  },
									  stroke: {
										  show: true,
										  width: 1,
										  colors: ['#fff']
										},
									  tooltip: {
										  theme: 'dark',
										  x: {
											show: true
										  },
										  y: {
											title: {
											  formatter: function () {
												return ''
											  }
											}
										  }
									 },
									  legend: {
										show: false
									  }
								};
								
								var sector_chart = new ApexCharts(
								  document.querySelector("#full_sector_data"),
								  sectorChart
								);
								sector_chart.render();
							}
							
							var holding_name_array = $
									.makeArray(schemePortfolioAnalysisResponse.schemePortfolioHoldingsNamesString);
							var holding_value_string = $
									.makeArray(schemePortfolioAnalysisResponse.schemePortfolioHoldingsValuesString);
							var total_holdings = 0;
							var holding_value_array = new Array();

							for (var i = 0; i < (holding_value_string.length - 1); i++) {
								var holdings_name = holding_name_array[i];
								var holdings_value = parseFloat(holding_value_string[i]);
								total_holdings = total_holdings
										+ holdings_value;
								var arr = new Array();
								arr.push(holdings_name);
								arr.push(holdings_value);
								holding_value_array.push(arr);
							}
							if (total_holdings < 100) {
								var holding_others = 100 - total_holdings;
								var arr = new Array();
								arr.push("Others");
								arr.push(holding_others);
								holding_value_array.push(arr);
							}

							/* Holdings Allocation Graph 
							$('#holdings-allocation-container').highcharts(
							{
								chart : {
									backgroundColor: "#ffffff",
									plotBackgroundColor : null,
									plotBorderWidth : null,
									plotShadow : false
								},
								title : {
									text : ''
								},
								tooltip : {
									pointFormat : '<b>{point.percentage:.2f}%</b>'
								},
								credits : {
									enabled : false
								},
								plotOptions : {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
											enabled : false
										}
									}
								},
								series : [ {
									type : 'pie',
									data : holding_value_array
								} ]
							});*/

							$("#portfolio-gth-spinner").hide();
							$("#top_10_sectors").show();
							$("#top_10_stocks").show();
							$("#fullSector").show();
							$("#fullHoldings").show();

							//$("#full_sector_data_table tr:gt(9)").hide();
							$(".full_holdings_data_table tr:gt(10)").hide();
							$(".holdings_full_table tr:gt(10)").hide();
							
							var stocksMapList = '${stocksMapList}'; 
							stocksMapList = stocksMapList.replace("{", "");
							stocksMapList = stocksMapList.replace("}", "");
							stocksMapList = stocksMapList.split(",");
							if('${schemeMapping.scheme_broad_category}' != 'Debt Schemes' 
									&& '${schemeMapping.scheme_advisorkhoj_category}' != 'Fund of Funds-Domestic-Debt'
									&& '${schemeMapping.scheme_sub_category}' != 'Debt: Gilt'
									&& '${schemeMapping.scheme_sub_category}' != 'Debt: Money Market'
									&& '${schemeMapping.scheme_sub_category}' != 'Target Maturity') {
								if(stocksMapList != null && stocksMapList != undefined && stocksMapList != "")
								{
									var stock_data = new Array();
									var stock_keys = new Array();
									for(var k = 0; k < stocksMapList.length; k++) {
										var value = stocksMapList[k];
										value = value.split("=");
										stock_keys.push($.trim(value[0]));
										stock_data.push(parseFloat($.trim(value[1])).toFixed(2));
									}
									
									var stockChart = {
										  chart: {
											height: 190,
											type: 'bar',
											toolbar: {
												  show: false
												}
										  },
										  plotOptions: {
											bar: {
												barHeight: '100%',
												distributed: true,
												horizontal: true					
											}
										  },
										  colors: ['#33b2df', '#546E7A', '#d4526e', '#13d8aa', '#A5978B', '#2b908f', '#f9a3a4', '#90ee7e',
											  '#f48024', '#69d2e7'],
										  dataLabels: {
											enabled: true,
											offsetX: 40,
											formatter: function(val, opt) {
												  return  val +" %"
											  },style: {
												    colors: ['#000']
											  }
										  },
										  series: [{
											data: stock_data
										  }],
										  xaxis: {
											categories: stock_keys,
										  },
										  stroke: {
											  show: true,
											  width: 1,
											  colors: ['#fff']
											},
										  tooltip: {
											  theme: 'dark',
											  x: {
												show: true
											  },
											  y: {
												title: {
												  formatter: function () {
													return ''
												  }
												}
											  }
										 },
										  legend: {
											show: false
										  }
									};
									
									var stock_chart = new ApexCharts(
									  document.querySelector("#stock_chart"),
									  stockChart
									);
									stock_chart.render();
								}
							}							
						}, 'text');
	}
	
	function initializeTypeAhead()
	{	
		$('.txt_fund').typeahead({
		    source: function (query, process) {
		    	
		    	
		    
		        return $.ajax({
		            url: '/mutual-funds-research/autoSuggestAllMfSchemes',
		            type: 'post',
		            data: { 
		            	query: query
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
		    },
	        updater:function (item) {
		        return item;
		    }
		});
	}
	
	function searchMFScheme() 
	{
		var scheme = $("#txt_scheme_name").val();
		if(scheme == "") {
			swal({title:"",text:"Please enter a scheme name"});
			return;
		}
		top.location = "/mutual-funds-research/fund-card?scheme="+encodeURIComponent(scheme);
	}
	
	var isImageSaved = 0;
	
	function downloadPDF() 
	{
		if(isImageSaved == 0)
		{
			$.LoadingOverlay("show");
			
			if( navLoaded == 0) {
				getCompleteNavReport();
			}
			if( yearlyLoaded == 0) {
				yearlyPerformaceGraph();
			}
			if('${schemeMapping.scheme_broad_category}' != 'Debt Schemes' 
					&& '${schemeMapping.scheme_advisorkhoj_category}' != 'Fund of Funds-Domestic-Debt'
					&& '${schemeMapping.scheme_sub_category}' != 'Debt: Gilt'
					&& '${schemeMapping.scheme_sub_category}' != 'Debt: Money Market'
					&& '${schemeMapping.scheme_sub_category}' != 'Target Maturity') {
				if( issuersLoaded == 0) {
					renderIssuers();
				}
			}
			
			if('${schemeMapping.scheme_broad_category}' == 'Debt Schemes' 
					|| '${schemeMapping.scheme_advisorkhoj_category}' == 'Fund of Funds-Domestic-Debt' 
					|| '${schemeMapping.scheme_sub_category}' == 'Debt: Gilt'
					|| '${schemeMapping.scheme_sub_category}' == 'Debt: Money Market'
					|| '${schemeMapping.scheme_sub_category}' == 'Target Maturity') 
			{
				$("#profile_tab3").addClass('d-block');
			}
			
			 setTimeout(function(){ 
				
				html2canvas(document.querySelector("#yearly-performance-container")).then(canvas => {
					getCanvas = canvas;
					var imgageData = getCanvas.toDataURL("image/png");
					img = imgageData.replace('data:image/png;base64,', '');
					$.ajaxSetup({async:false});
					$.post("/mutual-funds-research/base64toimageYearly", {scheme : '${scheme}', name : "yearly", base64image : img}, function(data){
						
						console.log("base64toimageYearly done ");
							
						html2canvas(document.querySelector("#nav-movement-container")).then(canvas => {
							getCanvas = canvas;
							var imgageData = getCanvas.toDataURL("image/png");
							img = imgageData.replace('data:image/png;base64,', '');
								
							$.ajaxSetup({async:false});
							$.post("/mutual-funds-research/base64toimageYearly", {scheme : '${scheme}', name : "nav", base64image : img}, function(data){
								
								//top.location = "/downloadFundCardPDF?scheme="+encodeURIComponent(fund)+"&client_name="+client_name;
								
								
								var url = "/downloadFundCardPDF?scheme="+encodeURIComponent(fund)+"&client_name="+client_name;
								
								Object.assign(document.createElement("a"), {
									target: "_blank",
									href: url
								}).click();
								
								
								
								$.LoadingOverlay("hide");
								
							},'text');
								
								
					    });
					},'text');
			    });		
				
				isImageSaved = 1;
			
			 }, 5000); 
		}else
		{
			top.location = "/downloadFundCardPDF?scheme="+encodeURIComponent(fund)+"&client_name="+client_name;
		}
	}
	
	var second_tab_loaded = false;
	var third_tab_loaded = false;
	function tabChange(val)
	{
		if(val == 2 && second_tab_loaded == false)
		{
			second_tab_loaded = true;
			setTimeout(function(){
				yearlyPerformaceGraph();
			}, 1000);
		}
		if(val == 3 && third_tab_loaded == false)
		{
			third_tab_loaded = true;
			setTimeout(function(){
				getCompleteNavReport();
			}, 1000);
		}
	}
	
	/* Scheme Performance Graph */
	function schemePerformaceGraph()
	{
		$("#scheme-performance-gth-spinner").removeClass("hidden");
		
		var data_array = new Array();
		var fund_obj = {
	            name: '<c:out escapeXml="false" value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.scheme_amfi}"/>',
	            color:'#01135C',
	            data: [parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_ytd}"/>'),
					   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1month}"/>'),
					   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_3month}"/>'),
					   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_6month}"/>'),
					   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1year}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_3year}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_5year}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_10year}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_inception}"/>')]
	        };
		data_array.push(fund_obj);
		
		var scheme_benchmark = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark}';
		if(scheme_benchmark != null && scheme_benchmark != "")
		{
			var benchmark_obj = {
					name: '<c:out escapeXml="false" value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.benchmark_name}"/>',
		            color:'#F6BB19',
		            data: [parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_ytd}"/>'),
		            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_1month}"/>'),
						   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_3month}"/>'),
						   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_6month}"/>'),
						   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_1year}"/>'),
						   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_3year}"/>'),
		            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_5year}"/>'),
		            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_10year}"/>'),
		            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_inception}"/>')]
			};
			data_array.push(benchmark_obj);
		}
		
		var category_obj = {
	            name: '<c:out escapeXml="false" value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.sector}"/>',
	            color:'#a8a8a8',
	            data: [parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_ytd}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_1month}"/>'),
					   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_3month}"/>'),
					   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_6month}"/>'),
					   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_1year}"/>'),
					   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_cmp_3year}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_cmp_5year}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_cmp_10year}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_cmp_inception}"/>')]
	        };
		data_array.push(category_obj);
		
		var container_width = $("#scheme-performance-gth-div").width();
		
	    $('#scheme-performance-container').highcharts({
	    	colors: ['#01135C','#F6BB19','#000000','#194d30','#8B0045','#ff0000','#804000','#000066','#00ff00','#0A9BF5','#999999','#3b0066'],
	    	chart: {
	            type: 'column',
	            backgroundColor: "#ffffff",
	            events: {
	            	load: function(event) {
	            		$("#scheme-performance-gth-spinner").addClass("hidden");        		
	            	}
	            },
	        },
	        title: {
	            text: ''
	        },
	        legend: {
	         	 enabled: true
	       },
	        xAxis: {
	            categories: ['YTD', '1 Month', '3 Month', '6 Month', '1 Year', '3 Years', '5 Years', '10 Years', 'Since Launch']
	        },
	        yAxis: {
	        	title: {
	                text: 'Returns'
	            }
	        },
	        tooltip: {
	            valueSuffix: '%',
	        },
	        credits: {
	        	enabled : false
	        },
	        series: data_array
	    }); 
	}

	/* Yearly Performance Graph */
	function yearlyPerformaceGraph()
	{
		$("#yearly-performance-gth-spinner").removeClass("hidden");
		
		var data_array = new Array();
		var fund_obj = {
	            name: '<c:out escapeXml="false" value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.scheme_amfi}"/>',
	            color:'#1C326E',
	            data: [parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2008}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2009}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2010}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2011}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2012}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2013}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2014}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2015}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_2016}"/>'),
	            	   parseFloat('<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_ytd}"/>')]
	        };
		data_array.push(fund_obj);
		
		var scheme_benchmark = '${bmSchemeMapping.scheme_benchmark}';
		if(scheme_benchmark != null && scheme_benchmark != "")
		{
			var benchmark_obj = {
					name: '<c:out escapeXml="false" value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.benchmark_name}"/>',
		            color:'#0085A1',
		            data: [parseFloat('<c:out value="${bmark.returns_abs_2008}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_2009}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_2010}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_2011}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_2012}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_2013}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_2014}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_2015}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_2016}"/>'),
		            	   parseFloat('<c:out value="${bmark.returns_abs_ytd}"/>')]
			};
			data_array.push(benchmark_obj);
		}
		
		var category_obj = {
	            name: '<c:out escapeXml="false" value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.sector}"/>',
	            color:'#000000',
	            data: [parseFloat('<c:out value="${category_returns[0].returns}"/>'),
	            	   parseFloat('<c:out value="${category_returns[1].returns}"/>'),
	            	   parseFloat('<c:out value="${category_returns[2].returns}"/>'),
	            	   parseFloat('<c:out value="${category_returns[3].returns}"/>'),
	            	   parseFloat('<c:out value="${category_returns[4].returns}"/>'),
	            	   parseFloat('<c:out value="${category_returns[5].returns}"/>'),
	            	   parseFloat('<c:out value="${category_returns[6].returns}"/>'),
	            	   parseFloat('<c:out value="${category_returns[7].returns}"/>'),
	            	   parseFloat('<c:out value="${category_returns[8].returns}"/>'),
	            	   parseFloat('0')]
	        };
		data_array.push(category_obj);
		
		var container_width = $("#yearly-performance-gth-div").width()-10;
		
	    $('#yearly-performance-container').highcharts({
	    	colors: ['#07c704','#0373fc','#000000','#194d30','#8B0045','#ff0000','#804000','#000066','#00ff00','#0A9BF5','#999999','#3b0066'],
	    	chart: {
	            type: 'column',
	            width : container_width,
	            backgroundColor: "#ffffff",
	            events: {
	            	load: function(event) {
	            		$("#yearly-performance-gth-spinner").addClass("hidden");        		
	            	}
	            },
	        },
	        title: {
	            text: ''
	        },
	        legend: {
	         	 enabled: true
	       },
	        xAxis: {
	            categories: ['2013','2014','2015','2016','2017', '2018', '2019', '2020', '2021', '2022']
	        },
	        credits: {
	        	enabled : false
	        },
		    plotOptions: {
		        column: {
		            pointPadding: 0.005,
		            borderWidth: 0
		        },
		    },
	        series: data_array
	    });
	    yearlyLoaded = 1;
	}
	
	var fundBenchArray = new Array();
	var fundBenchNameArray = new Array();
	fundBenchArray.push(encodeURIComponent('${scheme}'));
	fundBenchNameArray.push('${scheme}');
	
	var scheme_benchmark = '${schemeMapping.scheme_benchmark}';
	var scheme_benchmark_code = '${schemeMapping.scheme_benchmark_code}';
	
	if(scheme_benchmark_code == null || scheme_benchmark_code == "")
	{
		scheme_benchmark_code = '${schemeMapping.scheme_benchmark_advisorkhoj_code}';
		if(scheme_benchmark_code == null || scheme_benchmark_code == "")
		{
			scheme_benchmark_code = '${additional_benchmark}';
			scheme_benchmark = '${additional_benchmark}';
		}else{
			scheme_benchmark_code = '${schemeMapping.scheme_benchmark_advisorkhoj_code}';
			scheme_benchmark = '${schemeMapping.scheme_benchmark_advisorkhoj}';
		}
	}else{
		scheme_benchmark_code = '${schemeMapping.scheme_benchmark_code}';
		scheme_benchmark = '${schemeMapping.scheme_benchmark}';
	}
	
	if(scheme_benchmark != null && scheme_benchmark != "" && scheme_benchmark_code != '')
	{
		fundBenchArray.push(encodeURIComponent(scheme_benchmark_code));
	}
	if(scheme_benchmark != null && scheme_benchmark != "" && scheme_benchmark_code != '')
	{
		fundBenchNameArray.push(scheme_benchmark);
	}
	
	function getCompleteNavReport()
	{
		$("#nav-movement-gth-spinner").removeClass("hidden");
		
		var container_width = $("#nav-movement-gth-div").width() -10;
		var seriesOptions = [],
	    seriesCounter = 0,
	    names = fundBenchArray,
	    // create the chart when all data is loaded
	    createChart = function () {
			
	        $('#nav-movement-container').highcharts('StockChart', {
	        	colors: ['#0085A1','#000000','#c7ad02','#194d30','#8B0045','#ff0000','#804000','#000066','#00ff00','#0A9BF5','#999999','#3b0066'],
	            rangeSelector: {
	                selected: 4
	            },
	            yAxis: {
	                labels: {
	                    formatter: function () {
	                        return (this.value > 0 ? ' + ' : '') + this.value + '%';
	                    }
	                },
	                plotLines: [{
	                    value: 0,
	                    width: 2,
	                    color: 'silver'
	                }]
	            },
	            credits: {
		        	enabled : false
		        },
		        legend: {
	             	 enabled: true
	           },
	            plotOptions: {
	                series: {
	                    compare: 'percent'
	                }
	            },
	            tooltip: {
	                pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.change}%)<br/>',
	                valueDecimals: 2
	            },
	            chart: {
	                width : container_width,
	                backgroundColor: "#ffffff",
	                events: {
	                	load: function(event) {
	                        $("#nav-movement-gth-spinner").addClass("hidden");
	                	}
	                },
	            },
	            series: seriesOptions,
				rangeSelector: {
					buttonTheme: { 
						stroke: 'none',
						'stroke-width': 0,                          
						style: {                            
						},
						states: {
						  hover: {
						  },
						  select: {
							fill: '#b9dbf7',
							style: {
							  color: '#3b3f42'
							}
						  }
						}
					},
				allButtonsEnabled: false,
					buttons: [{
						type: 'month',
						count: 1,
						text: '1m'
					}, {
						type: 'month',
						count: 3,
						text: '3m'
					}, {
						type: 'month',
						count: 6,
						text: '6m'
					}, {
						type: 'ytd',
						text: 'YTD'
					}, {
						type: 'year',
						count: 1,
						text: '1y'
					}, {
						type: 'year',
						count: 2,
						text: '2y'
					}, {
						type: 'year',
						count: 3,
						text: '3y'
					}, {
						type: 'year',
						count: 5,
						text: '5y'
					}, {
						type: 'year',
						count: 10,
						text: '10y'
					}, {
						type: 'all',               
						text: 'All'              
					}],
					selected: 4
				}
	        });
	    };

		$.each(names, function (i, name) {
		
		    $.getJSON('/mutual-funds-research/getCompleteNavReportForFundOverview?scheme_amfi_name=' + name.toLowerCase(),    function (data) {
		    	
				if(data == "" || data == null || data.length < 5)
				{
					data = [];
				}
				
				seriesOptions[i] = {
		            name: fundBenchNameArray[i],
		            data: data
		        };
		
		        // As we're loading the data asynchronously, we don't know what order it will arrive. So
		        // we keep a counter and create the chart when all the data is loaded.
		        seriesCounter += 1;
		
		        if (seriesCounter === names.length) {
		            createChart();
		        }
			        
		    });
		});
		navLoaded = 1;
	}
	
	function renderIssuers() 
	{
		var issuerMap = '${issuerMap}';
		issuerMap = issuerMap.replace("{", "");
		issuerMap = issuerMap.replace("}", "");
		issuerMap = issuerMap.split(",");
		var issuers_keys = new Array();
		var issuers_data = new Array();
		
		if(issuerMap != null && issuerMap != undefined && issuerMap != "")
		{
			for(var k = 0; k < issuerMap.length; k++) {
				var value = issuerMap[k];
				value = value.split("=");
				
				issuers_keys.push($.trim(value[0]));
				issuers_data.push(parseFloat($.trim(value[1])).toFixed(2));
			}
			
			var issuersChart = {
				  chart: {
					type: 'bar',
					height: 350,
					toolbar: {
						  show: false
						}
				  },
				  plotOptions: {
					bar: {
						barHeight: '100%',
						distributed: true,
						horizontal: true					
					}
				  },
				  colors: ['#f9a3a4', '#F6BB19','#33b2df', '#546E7A', '#d4526e', '#13d8aa',
					  		'#A5978B', '#2b908f', '#90ee7e', '#f58634', '#00a85b', '#858688'],
				  dataLabels: {
					enabled: true,
					offsetX: 40,
					formatter: function(val, opt) {
						  return  val +" %"
					  },
					  style: {
						    colors: ['#000']
						  }
				  },
				  series: [{
					data: issuers_data.slice(0, 10),
					
				  }],
				  xaxis: {
					  labels: {
				          show: true
				      },
					  categories: issuers_keys.slice(0, 10),
				  },
				  stroke: {
					  show: true,
					  width: 1,
					  colors: ['#fff']
					},
					tooltip: {
						  x: {
							title: {
							  formatter: function () {
								return ''
							  }
							}
						  },
						  y: {
							title: {
							  formatter: function () {
								return ''
							  }
							}
						  }
					  },
				  legend: {
					show: false
				  }
			};
			
			var issuers_chart = new ApexCharts(
			  document.querySelector("#issuers-container"),
			  issuersChart
			);
			issuers_chart.render();
		} else {
			$("#issuers-container").html("<div style='font-size:12px'>Issuers data not available for this scheme</div>");	
		}
		issuersLoaded = 1;
	}

	function renderAssets() 
	{
		var assetMap = '${assetMap}';
		
		assetMap = assetMap.replace("{", "");
		assetMap = assetMap.replace("}", "");
		assetMap = assetMap.split(",");
		var assets_keys = new Array();
		var assets_data = new Array();
		
		if(assetMap != null && assetMap != undefined && assetMap != "")
		{
			for(var k = 0; k < assetMap.length; k++) {
				var value = assetMap[k];
				value = value.split("=");
				
				assets_keys.push($.trim(value[0]));
				assets_data.push(parseFloat($.trim(value[1])).toFixed(2));
			}
			
			var assetsCharts = {
					  chart: {
						type: 'bar',
						height: 220,
						toolbar: {
							  show: false
							}
					  },
					  plotOptions: {
						bar: {
							barHeight: '100%',
							distributed: true,
							horizontal: true					
						}
					  },
					  colors: ['#f9a3a4', '#F6BB19','#33b2df', '#546E7A', '#d4526e', '#13d8aa',
						  		'#A5978B', '#2b908f',  '#90ee7e', '#f58634', '#00a85b', '#858688'],
					  dataLabels: {
						enabled: true,
						offsetX: 40,
						formatter: function(val, opt) {
							  return  val +" %"
						  },
						  style: {
							    colors: ['#000']
							  }
					  },
					  series: [{
						data: assets_data.slice(0, 5),
						
					  }],
					  xaxis: {
						categories: assets_keys.slice(0, 5),
					  },
					  stroke: {
						  show: true,
						  width: 1,
						  colors: ['#fff']
						},
						tooltip: {
							  x: {
								title: {
								  formatter: function () {
									return ''
								  }
								}
							  },
							  y: {
								title: {
								  formatter: function () {
									return ''
								  }
								}
							  }
						  },
					  legend: {
						show: false
					  }
				};
				
				var assets_chart = new ApexCharts(
				  document.querySelector("#assets-container"),
				  assetsCharts
				);
				assets_chart.render();
		} else {
			$("#assets-container").html("<div style='font-size:12px'> Asset type not available for this scheme </div>");	
		}
		
	}
	
	function renderHoldings() 
	{
		var scheme_amfi = '${scheme}';
		var holding_value_array = new Array();
		
		$.ajaxSetup({async : false});
		$.post("/mutual-funds-research/getPortfolioAnalysis",{scheme_amfi : scheme_amfi}, function(data) {
			
			var result = $.trim(data);
			var obj = jQuery.parseJSON(result);
			var scheme_asset = obj.schemeAssets;
			var schemePortfolioAnalysisResponse = obj.schemePortfolioAnalysisResponse;
			var schemePortfolioList_array = $.makeArray(schemePortfolioAnalysisResponse.schemePortfolioList);
			var assetAllocationMap = schemePortfolioAnalysisResponse.assetAllocationMap;
			
			if(assetAllocationMap != null && assetAllocationMap != undefined && assetAllocationMap != "")
			{
				var asset_data = new Array();
				var asset_keys = new Array();
				
				var seriesOptions = [];
				var i = 0;
				for(var key in assetAllocationMap) {
					var value = assetAllocationMap[key];
					var keyValue = new Array();
					
					var obj = {
						name:key,
						y:parseFloat(value.toFixed(2))
					}
					asset_data.push(obj);
				}	
				
				$('#asset-allocation-chart').highcharts({
					colors: ['#f9a3a4', '#F6BB19','#33b2df', '#546E7A', '#d4526e', '#13d8aa','#A5978B', '#2b908f', '#90ee7e', '#f58634', '#00a85b', '#858688'],
				    chart: {
				        plotBackgroundColor: null,
				        plotBorderWidth: null,
				        plotShadow: false,
				        type: 'pie'
				    },
				    title: {
				        text: ''
				    },
				    tooltip: {
				        pointFormat: '{series.name}: <b>{point.percentage:.2f}%</b>'
				    },
				    accessibility: {
				        point: {
				            valueSuffix: '%'
				        }
				    },
			        credits: {
			        	enabled : false
			        },
				    plotOptions: {
				        pie: {
				            allowPointSelect: true,
				            cursor: 'pointer',
				            dataLabels: {
				                enabled: true,
				                format: '<b>{point.name}</b>: {point.percentage:.2f} %'
				            }
				        }
				    },
				    series: [{
				        name: '',
				        colorByPoint: true,
				        data: asset_data
				    }]
				});
				
			} else {
				$('#asset-allocation-chart').html("<b>Asset allocation Not Available</b>");
			}
			
		}, 'text');
	}
	
	function getRelatedFunds() 
	{
		var  str = "";
		str += '<table class="table table-bordered" style="border: none; margin:0px;"><thead> <tr style="background: #ddd;">';
		str +='<th class="text-left">Fund Name</th>';
	    str +='<th class="text-center">5-Year Return</th>';
		str +='</tr></thead><tbody>';
		
		$.ajaxSetup({async:false});
		$.post("/mutual-funds-research/getRelatedfunds", {category:"" + '${schemeMapping.scheme_advisorkhoj_category}'}, function(data)
	    {	
			var schemePerformances = $.trim(data);
			var schemePerformances_obj = jQuery.parseJSON(schemePerformances);
			var schemePerformances_array = $.makeArray(schemePerformances_obj);
			for (var i = 0; i < schemePerformances_array.length ; i++)
		    {
				var scheme_name = schemePerformances_array[i].scheme_amfi;
				var scheme_amfi_url = schemePerformances_array[i].scheme_amfi_url;
		    	var three_year_returns = schemePerformances_array[i].returns_cmp_5year;
		    	
		    	three_year_returns = three_year_returns.toFixed(2);
		    	str +='<tr><td class="text-left green-lite-bg"><a class="blue-color" href="/mutual-funds-research/'+scheme_amfi_url+'">'+scheme_name+'</a></td>';
		    	str +='<td class="text-right orange-lite-bg">'+three_year_returns+' %</td></tr>';
		    }
	    },'text');
		
		str +='</tbody></table>';
		
		$('#related_funds_table').html(str);
	}
	function historicValueLoad() 
	{
		var scheme_inception_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_inception}';
		var scheme_1yr_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1year}';
		var scheme_3yr_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_3year}';
		var scheme_5yr_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_5year}';
		var scheme_10yr_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_10year}';
		
		var benchmark_inception_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_inception}';
		var benchmark_1yr_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_1year}';
		var benchmark_3yr_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_3year}';
		var benchmark_5yr_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_5year}';
		var benchmark_10yr_returns = '${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_10year}';
		
		var benchmark = '${schemeMapping.scheme_benchmark_code}';
		if(benchmark == null || benchmark == "")
		{
			benchmark = '${schemeMapping.scheme_benchmark_advisorkhoj_code}';
			if(benchmark == null || benchmark == "")
			{
				benchmark = '${additional_benchmark}';
			}else{
				benchmark = '${schemeMapping.scheme_benchmark_advisorkhoj}';
			}
		}else{
			benchmark = '${schemeMapping.scheme_benchmark}';
		}
		
		var  str = "";
		str += '<table class="table table-bordered m-0"><thead><tr style="background: #000;">';
	    str +='<th style="text-align:center;"></th>';
	    str +='<th colspan="2" style="text-align:center;">Scheme <br> <span class="small">'+'${schemeMapping.scheme_amfi_short_name}'+'</span></th>';
		str +='<th colspan="2" style="text-align:center;">Benchmark<br> <span class="small">'+ benchmark +'</span></th>';
		str +='<th colspan="2" style="text-align:center;">Additional Benchmark<br> <span class="small">'+'${additional_benchmark}'+'</span></th>';
		str +='<th colspan="2" style="text-align:center;">Category Average</th>';
		str +='</tr></thead><tbody>';
	    
		str += '<tr> <td style="width:12%;" class="font-weight-bold green-lite-bg"> Period </td>';
		str += '<td style="width:10%;" class="font-weight-bold orange-lite-bg text-right"> Returns </td>';
		str += '<td style="width:12%;" class="font-weight-bold green-lite-bg text-right"> Value of <br><i class="fa fa-inr"></i> 10000 invested </td>';
		str += '<td style="width:10%;" class="font-weight-bold orange-lite-bg text-right"> Returns </td>';
		str += '<td style="width:12%;" class="font-weight-bold green-lite-bg text-right"> Value of <br><i class="fa fa-inr"></i> 10000 invested </td>';
		str += '<td style="width:10%;" class="font-weight-bold orange-lite-bg text-right"> Returns </td>';
		str += '<td style="width:12%;" class="font-weight-bold green-lite-bg text-right"> Value of <br><i class="fa fa-inr"></i> 10000 invested </td>';
		str += '<td style="width:10%;" class="font-weight-bold orange-lite-bg text-right"> Returns </td>';
		str += '<td style="width:12%;" class="font-weight-bold green-lite-bg text-right"> Value of <br><i class="fa fa-inr"></i> 10000 invested </td></tr>';
		
		str += '<tr> <td class="green-lite-bg"> 1 Year </td>';
		str += '<td class="text-right orange-lite-bg">'+scheme_1yr_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, 1, scheme_1yr_returns)+'</td>';	
		str += '<td class="text-right orange-lite-bg">'+benchmark_1yr_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, 1, benchmark_1yr_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+'${additional_benchmark_1yr_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${additional_benchmark_1yr_value}'+'</td>'; 
		str += '<td class="text-right orange-lite-bg">'+'${category_1yr_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${category_1yr_value}'+'</td>'; 
		str += '</tr>';
		
		str += '<tr> <td class="green-lite-bg"> 3 Year </td>';
		str += '<td class="text-right orange-lite-bg">'+scheme_3yr_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, 3, scheme_3yr_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+benchmark_3yr_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, 3, benchmark_3yr_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+'${additional_benchmark_3yr_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${additional_benchmark_3yr_value}'+'</td>'; 
		str += '<td class="text-right orange-lite-bg">'+'${category_3yr_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${category_3yr_value}'+'</td>'; 
		str += '</tr>';
		
		str += '<tr> <td class="green-lite-bg"> 5 Year </td>';
		str += '<td class="text-right orange-lite-bg">'+scheme_5yr_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, 5, scheme_5yr_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+benchmark_5yr_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, 5, benchmark_5yr_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+'${additional_benchmark_5yr_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${additional_benchmark_5yr_value}'+'</td>'; 
		str += '<td class="text-right orange-lite-bg">'+'${category_5yr_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${category_5yr_value}'+'</td>'; 
		str += '</tr>';
		
		str += '<tr> <td class="green-lite-bg"> 10 Year </td>';
		str += '<td class="text-right orange-lite-bg">'+scheme_10yr_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, 10, scheme_10yr_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+benchmark_10yr_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, 10, benchmark_10yr_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+'${additional_benchmark_10yr_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${additional_benchmark_10yr_value}'+'</td>'; 
		str += '<td class="text-right orange-lite-bg">'+'${category_10yr_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${category_10yr_value}'+'</td>'; 
		str += '</tr>';
		
		var scheme_inception_year = '${schemeMapping.scheme_inception_date}';
		var lastFour = scheme_inception_year.substr(scheme_inception_year.length - 4); 
		var inceptionFrequency = 2021 - parseFloat(lastFour);
		
		str += '<tr> <td class="green-lite-bg"> Since inception </td>';
		str += '<td class="text-right orange-lite-bg">'+scheme_inception_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, inceptionFrequency, scheme_inception_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+benchmark_inception_returns+' %</td>';
		str += '<td class="text-right green-lite-bg">'+returnsCalculator(10000, inceptionFrequency, benchmark_inception_returns)+'</td>';
		str += '<td class="text-right orange-lite-bg">'+'${additional_benchmark_inception_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${additional_benchmark_inception_value}'+'</td>'; 
		str += '<td class="text-right orange-lite-bg">'+'${category_inception_returns}'+'</td>';
		str += '<td class="text-right green-lite-bg">'+'${category_inception_value}'+'</td>'; 
		str += '</tr>';
		
		str += '</tbody></table>';
		$("#historical_returns_table_res").html(str);
	}
	
	function returnsCalculator(amount, period, rate)
	{
		var value1 = 1 + (rate / 100);
		var value2 = Math.pow(value1, period);
		var FV = amount * value2;
		
		var FV1 = Math.ceil(FV);
		return numbersWithComma(Math.round(FV1));
	}
	
</script>
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
</style>

<div class="premium-calculator-hero text-center">
    <div class="container text-center">
        <div class="hero-label">Mutual Fund Research</div>
        <h1 class="display-6 text-dark mb-4 animated slideInDown">${scheme}</h1>
    </div>
</div>
        

<section class="bg-light py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
					    <div class="premium-glass-card p-4 mb-4">
					         <div class="row align-items-center">
							   	<div class="col-md-8">
						                <div class="form-group mb-0">
						                    <input type="text" id="txt_scheme_name" class="form-control txt_fund premium-calc-input" value="${scheme}" placeholder="Enter Scheme Name">
						                </div>
						            </div>  
					                <div class="col-md-4 text-end">
											<a href="javascript:void(0)" class="btn rounded-pill px-4 py-2 text-white w-100" onclick="searchMFScheme()" style="background:#009899; font-weight:600;">Search</a>
				                	</div>
				                </div>
				         </div>
				      </div>
				</div>
				        
				<div class="row mb-4">
					<div class="col-md-12">
				         <h4 class="mb-1 text-white p-3 rounded" style="background: linear-gradient(135deg, #009899 0%, #007A7A 100%); box-shadow: 0 10px 20px rgba(0,152,153,0.15);">
				           	<span class="bold-text">${scheme}</span><br/>
				            <span class="bold-text mt-2 d-inline-block text-white-50" style="font-size:14px; font-weight:400;">Fund Manager : <c:out value="${schemeMapping.scheme_manager}" /> | Benchmark : <c:out value="${schemeMapping.scheme_benchmark}" /> | Category : ${schemePerformances.scheme_category}</span>                 	
				         </h4>
				 	</div> 
				 </div>
						
				<div class="row">
					<div class="col-md-12">
					    <div class="premium-glass-card mb-5">
					        <div class="card-body p-4">	
					        	<div class="row">
										<div class="col-md-5" style="margin-top:10px;">
										<div class="row">
										<div class="col-md-7 pr-0">
										<span class="font-weight-bold" style="font-size: 20px;">
											<i class="fa fa-inr"></i> <c:out value="${schemePerformances.price}" /> 
										</span>
										<c:choose>
											<c:when test="${schemePerformances.price_change_onday < 0}">
												<span class="text-danger" style="font-size: 14px;margin: 0px 10px;">
													<i class="fa fa-long-arrow-down"></i> <i class="fa fa-inr"></i>
													<fmt:formatNumber type="number" maxFractionDigits="2"
														value="${schemePerformances.price_change_onday}" />
													(<fmt:formatNumber type="number" maxFractionDigits="2" value="${schemePerformances.price_change_percent_onday}" /> %)							
												</span>
											</c:when>
											<c:otherwise>
												<span class="text-success" style="font-size: 14px;margin: 0px 10px;">
													<i class="fa fa-long-arrow-up"></i> <i class="fa fa-inr"></i>
													<fmt:formatNumber type="number" maxFractionDigits="2"
														value="${schemePerformances.price_change_onday}" />
													(<fmt:formatNumber type="number" maxFractionDigits="2" value="${schemePerformances.price_change_percent_onday}" /> %)
												</span>
											</c:otherwise>
										</c:choose>
										<p style="margin:0px; font-size:12px;">NAV as on <fmt:formatDate pattern="dd-MM-yyyy" value="${schemePerformances.price_date}" />
										</p>
										</div>
										<div class="col-md-5" style="border-left: 1px solid #ccc;">
										<span class="font-weight-bold" style="font-size: 20px;">
											<i class="fa fa-inr"></i> <fmt:formatNumber type="number"	maxFractionDigits="2" value="${schemeMapping.scheme_assets}" /> Cr 
										</span>
										<p style="margin:0px; font-size:12px;">AUM as on <fmt:formatDate pattern="dd-MM-yyyy" value="${scheme_aum_date}" /></p>
										</div>
										</div>
										<div style="font-size:12px;margin-top:20px;"> Fund House: <a data-toggle="tooltip" title="See all the funds of this AMC" data-placement="right" ><c:out value="${schemeMapping.scheme_company}" /></a></div> 
										</div>
										
										<div class="col-md-7 pl-0">
											<section class="hidden-sm-and-down col-lg-12 pb-0 pt-0">
											<div class="hor-box row">
												
												<div class="layout col fund-information m-1 justify-center">
													<p class="font14 mb-0 mt-2" style="background: #f3f3f3;margin: 0px !important;">Rtn ( Since Inception )
													</p>
													<div class="layout row justify-center align-center">
														<c:choose>
														<c:when
															test="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_inception < 0}">
															<p class="text-danger mb-0 font-weight-bold">
																<i class="fa fa-long-arrow-down"></i>
																<c:out value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_inception}%" />
															</p>
														</c:when>
														<c:otherwise>
															<p class="text-success mb-0 font-weight-bold">
																<i class="fa fa-long-arrow-up"></i>
																<span id="returnSpan">
																<c:out
																	value="${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_inception}%" />
																</span>
															</p>
														</c:otherwise>
														</c:choose>
													</div>	
													<p style="font-size:10px;margin: 0px !important;"></p>								
												</div>
												
												<div class="layout col fund-information m-1 justify-center">
													<p class="font14 mb-0 mt-2" style="background: #f3f3f3;margin: 0px !important;">Inception Date</p>
													<div class="layout row justify-center align-center">
														<p class="mb-0" style="font-size: 12px;">
															<fmt:formatDate pattern="MMM dd, yyyy" value="${schemeMapping.scheme_inception_date}" />
														</p>
													</div>
												</div>
												<div class="layout col fund-information m-1 justify-center">
													<p class="font14 mb-0 mt-2" style="background: #f3f3f3;margin: 0px !important;">Expense Ratio</p>
													<div class="layout row justify-center align-center">
														<p class="mb-0" style="font-size: 12px;">
															<c:out value="${schemeMapping.ter}" />%
														</p>
													</div>
												</div>
												<div class="layout col fund-information m-1 justify-center" style="width:100px;">
													<p class="font14 mb-0 mt-2" style="background: #f3f3f3;margin: 0px !important;">Fund Status</p>
													<div class="layout row justify-center align-center">
														<p class="mb-0" style="font-size: 12px;">
															<c:out value="${schemeMapping.open_or_closed}" />
														</p>
													</div>
												</div>
											</div>
											<div class="hor-box row">
												<div class="layout col fund-information m-1 justify-center" style="width:100px;">
													<p class="font14 mb-0 mt-2" style="background: #f3f3f3;margin: 0px !important;">Min. Investment (Rs)</p>
													<div class="layout row justify-center align-center">
														<p class="mb-0" style="font-size: 12px;">
															<fmt:formatNumber type="number" maxFractionDigits="0" value="${schemeMapping.minimum}" />
														</p>
													</div>
												</div>
												<div class="layout col fund-information m-1 justify-center" style="width:100px;">
													<p class="font14 mb-0 mt-2" style="background: #f3f3f3;margin: 0px !important;">Min. Topup (Rs)</p>
													<div class="layout row justify-center align-center">
														<p class="mb-0" style="font-size: 12px;">
															<fmt:formatNumber type="number" maxFractionDigits="0" value="${schemeMapping.minimum_topup}" />
														</p>
													</div>
												</div>
												<div class="layout col fund-information m-1 justify-center" style="width:100px;">
													<p class="font14 mb-0 mt-2" style="background: #f3f3f3;margin: 0px !important;">Min. SIP Amount (Rs)</p>
													<div class="layout row justify-center align-center">
														<p class="mb-0" style="font-size: 12px;">
															<c:out value="${schemeMapping.sip_minimum_amount}" />
														</p>
													</div>
												</div>
												<div class="layout col fund-information m-1 justify-center" style="width:100px;">
													<p class="font14 mb-0 mt-2" style="background: #f3f3f3;margin: 0px !important;">Risk Status</p>
													<div class="layout row justify-center align-center">
														<p class="mb-0" style="font-size: 12px;text-transform: capitalize;">
															<c:out value="${fn:toLowerCase(schemeMapping.riskometer)}" />
														</p>
													</div>
												</div>
											</div>
											</section>								
									</div>
								</div>
					       		<div class="row mt-3">
					       		<div class="col-md-12">
					       		<div>
									<p class="font14 mb-1 ml-0 f-weight-400">
										<span class="font-weight-bold">Investment Objective : </span>
				      					<c:out value="${schemeMapping.scheme_objective}"></c:out> 
									</p>
								</div>
								</div>
								</div>
								
								<div class="row mt-3">
						    		<div class="col-md-12">
						    			<div class="rounded overflow-hidden mb-4" style="border: 1px solid #e5e7eb;">
						   					<h6 style="background: linear-gradient(135deg, #009899 0%, #007A7A 100%);color: #fff; padding:15px;" class="font-weight-bold m-0">Returns (%)</h6>
						   					<div class="padding0 table-responsive bg-white">
							       				<table class="table table-bordered table-striped" style="border: none; margin: 0px;">
												<thead>
													<tr style="background: #000;">
														<th></th>
														<th class="text-right"> 1 Mon (%)</th>
														<th class="text-right"> 3 Mon (%)</th>
														<th class="text-right"> 6 Mon (%)</th>
														<th class="text-right"> 1 Yr (%)</th>
														<th class="text-right"> 3 Yrs (%)</th>
														<th class="text-right"> 5 Yrs (%)</th>
														<th class="text-right"> 10 Yrs (%)</th>								
													</tr>											
												</thead>
												<tbody>
													<tr>
														<td class="green-lite-bg"> Fund </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1month} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_3month} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_6month} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1year} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_3year} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_5year} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_10year} </td>																
													</tr>
													<tr>
														<td class="green-lite-bg"> Benchmark - ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.benchmark_name} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_1month} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_3month} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_6month} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_abs_1year} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_3year} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_5year} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesBenchmark.returns_cmp_10year} </td>								
													</tr>
													<tr>
														<td class="green-lite-bg"> Category - ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.sector} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_1month} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_3month} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_6month} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_abs_1year} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_cmp_3year} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_cmp_5year} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformancesCategory.returns_cmp_10year} </td>																
													</tr>
													<tr>
														<td class="green-lite-bg"> Rank within Category </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1month_rank} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_3month_rank} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_6month_rank} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1year_rank} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_3year_rank} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_5year_rank} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_10year_rank} </td>							
													</tr>
													<tr>
														<td class="green-lite-bg"> Number of Funds within Category </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1month_totalrank} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_3month_totalrank} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_6month_totalrank} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_abs_1year_totalrank} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_3year_totalrank} </td>
														<td class="text-right green-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_5year_totalrank} </td>
														<td class="text-right orange-lite-bg"> ${fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.schemePerformances.returns_cmp_10year_totalrank} </td>						
													</tr>
												</tbody>
											</table>
							   				</div>
							   			</div>
							   			
							   			<p class="mt-3 text-muted"><b>Returns less than 1 year are in absolute and Returns greater than 1 year period are compounded annualised (CAGR)</b></p>
							   			
						    			<div id="nav-movement-gth-div" class="mt-4 rounded overflow-hidden mb-4" style="border: 1px solid #e5e7eb;">
							       		<h6 style="background: linear-gradient(135deg, #009899 0%, #007A7A 100%);color: #fff; padding:15px;" class="font-weight-bold m-0">NAV Movement</h6>
							      			<div id="nav-movement-container" style="height: 450px; min-width: 250px;padding:20px 0px;background: #fff;" class="adv-panel-border text-center">
							      				<i id="nav-movement-gth-spinner" class="fa fa-cog fa-spin fa-2x" style="margin-top: 100px;"></i>
							      			</div>
							   			</div>
							   			
							   			<div class="row mt-2">
							   				<div class="col-md-6">
							   					<c:if test="${schemeMapping.scheme_broad_category ne 'Debt Schemes' 
							   							and schemeMapping.scheme_advisorkhoj_category ne 'Fund of Funds-Domestic-Debt'
							   							and schemeMapping.scheme_sub_category ne 'Debt: Gilt'
							   							and schemeMapping.scheme_sub_category ne 'Debt: Money Market'
							   							and schemeMapping.scheme_sub_category ne 'Target Maturity'}">
										       		<div style="border: 1px solid #eee;">
									   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Equity Holdings (Top 10)</h6>
									   					<div class="padding0 table-responsive full_holdings_data_2">
										       				<table class="table table-bordered full_holdings_data_table" style="border: none; margin: 0px;">
										       				<thead>
										       					<tr style="background: #ddd;">
										       						<th>Sector</th>
																	<th>Allocation (%)</th>
										       					</tr>
										       				</thead>
										       				<tbody>
															</tbody>
										       				</table>
										       			</div>
										       			<div class="fullHoldingsAnchor" onclick="holdingsAllocationClick()" style="cursor:pointer;text-align:right;color:blue;margin-top:5px;">
															<span class="holdings_anchor_span paddingRight5">Show All Holdings</span> <i class="fa fa-chevron-circle-down"></i>
														</div>
										       		</div>
									       		</c:if>
									       		
									       		<c:if test="${schemeMapping.scheme_broad_category eq 'Debt Schemes' 
									       			or schemeMapping.scheme_advisorkhoj_category eq 'Fund of Funds-Domestic-Debt'
									       			or schemeMapping.scheme_sub_category eq 'Debt: Gilt'
													or schemeMapping.scheme_sub_category eq 'Debt: Money Market'
													or schemeMapping.scheme_sub_category eq 'Target Maturity'}">
									       			<div style="border: 1px solid #eee;">
									   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Debt Holdings (Top 10)</h6>
									   					<div class="padding0 table-responsive full_holdings_data_2">
										       				<table class="table table-bordered full_holdings_data_table" style="border: none; margin: 0px;">
										       				<thead>
										       					<tr style="background: #ddd;">
										       						<th>Sector</th>
																	<th>Allocation (%)</th>
										       					</tr>
										       				</thead>
										       				</table>
										       			</div>
										       			<div class="fullHoldingsAnchor" onclick="holdingsAllocationClick()" style="cursor:pointer;text-align:right;color:blue;margin-top:5px;">
															<span class="holdings_anchor_span paddingRight5">Show All Holdings</span> <i class="fa fa-chevron-circle-down"></i>
														</div>
										       		</div>
									       		</c:if>
							   				</div>
							   				<div class="col-md-6">
							   					<c:if test="${schemeMapping.scheme_broad_category eq 'Equity Schemes'}">
							    					<div style="border: 1px solid #eee;">
										       			<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold">Sector Allocation (%)</h6>
										      			<div id="full_sector_data" style="margin-top:-15px;"></div>
										   			</div>
												</c:if>
												
												<c:if test="${schemeMapping.scheme_broad_category eq 'Debt Schemes' 
														or schemeMapping.scheme_advisorkhoj_category eq 'Fund of Funds-Domestic-Debt'
														or schemeMapping.scheme_sub_category eq 'Debt: Gilt'
														or schemeMapping.scheme_sub_category eq 'Debt: Money Market'
														or schemeMapping.scheme_sub_category eq 'Target Maturity'}">
													<div style="border: 1px solid #eee;">
									   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Credit Quality Break Down</h6>
									   					<div class="padding0 table-responsive">
										       				<table class="table table-bordered" style="border: none; margin: 0px;">
										       				<thead>
										       					<tr style="background: #ddd;">
										       						<th> Credit Quality  </th>
																	<th class="text-right"> Portfolio (%) </th>
										       					</tr>
										       				</thead>
										       				<tbody>
																<c:forEach items="${ratingMap}" var="rating">
																	<tr>
																		<td class="green-lite-bg"><c:out value="${rating.key}"/></td>
																		<td  class="orange-lite-bg text-right"><c:out value="${rating.value}"/></td>
																	</tr>
																</c:forEach>
																<c:if test="${ratingMap.size() < 10}">
																	<c:forEach begin="${ratingMap.size() + 1}" end="10" varStatus="loop">
																	<tr>
																		<td class="green-lite-bg">&nbsp;</td>
																		<td  class="orange-lite-bg">&nbsp;</td>
																	</tr>
																	</c:forEach>
																</c:if>
															</tbody>
										       				</table>
										       				<div style="font-size: 10px; margin-top:10px;"> Note: AAA includes A1, A includes A2, BBB includes A3. </div>
										       			</div>
									       			</div>
									       		</c:if>
							   				</div>
							   			</div>	
							   			
							   			<div class="row mt-2">
							   				<div class="col-md-4">
							   					<c:if test="${schemeMapping.scheme_broad_category ne 'Debt Schemes' 
							   						and schemeMapping.scheme_advisorkhoj_category ne 'Fund of Funds-Domestic-Debt'
							   						and schemeMapping.scheme_sub_category ne 'Debt: Gilt'
													and schemeMapping.scheme_sub_category ne 'Debt: Money Market'
													and schemeMapping.scheme_sub_category ne 'Target Maturity'}">
							   						<div style="border: 1px solid #eee;">
									   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Asset Allocation</h6>
									   					<div class="padding0 table-responsive">
										       				<table class="table table-bordered" style="border: none; margin: 0px;">
										       				<thead>
										       					<tr style="background: #000;font-weight: 600;">
																	<th style="text-align: left;">Asset Class</th>
																	<th style="text-align: right;">Allocation (%)</th>
																</tr>
										       				</thead>
										       				<tbody>
										       					<c:forEach items="${assetAllocationMap}" var="asset">
											       					<tr>
																		<td class="green-lite-bg"  style="text-align: left;">${asset.key}</td>
																		<td class="orange-lite-bg"  style="text-align: right;">
																			<fmt:formatNumber type="number" maxFractionDigits="2" value="${asset.value}" />
																		</td>														
																	</tr>
																</c:forEach>
																<tr>
																	<td class="green-lite-bg">&nbsp;</td>
																	<td class="orange-lite-bg">&nbsp;</td>														
																</tr>
																<tr>
																	<td class="green-lite-bg">&nbsp;</td>
																	<td class="orange-lite-bg">&nbsp;</td>														
																</tr>
																<tr>
																	<td class="green-lite-bg">&nbsp;</td>
																	<td class="orange-lite-bg">&nbsp;</td>														
																</tr>
																<tr>
																	<td class="green-lite-bg">&nbsp;</td>
																	<td class="orange-lite-bg">&nbsp;</td>														
																</tr>
															</tbody>
										       				</table>
										       			</div>
									       			</div>
									       		</c:if>
									       		
									       		<c:if test="${schemeMapping.scheme_broad_category eq 'Debt Schemes' 
									       				or schemeMapping.scheme_advisorkhoj_category eq 'Fund of Funds-Domestic-Debt'
									       				or schemeMapping.scheme_sub_category eq 'Debt: Gilt'
														or schemeMapping.scheme_sub_category eq 'Debt: Money Market'
														or schemeMapping.scheme_sub_category eq 'Target Maturity'}">
									       			<div style="border: 1px solid #eee;">
									   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Asset Type (Top 5)</h6>
									   					<div class="padding0 table-responsive">
										       				<table class="table table-bordered" style="border: none; margin: 0px;">
										       				<tbody>
										       					<c:forEach items="${assetMap}" var="asset">
											       					<tr>
																		<td class="green-lite-bg"  style="text-align: left;">${asset.key}</td>
																		<td class="orange-lite-bg"  style="text-align: right;">
																			<fmt:formatNumber type="number" maxFractionDigits="2" value="${asset.value}" />
																		</td>														
																	</tr>
																</c:forEach>
																<tr>
																	<td class="green-lite-bg">&nbsp;</td>
																	<td class="orange-lite-bg">&nbsp;</td>														
																</tr>
															</tbody>
										       				</table>
										       			</div>
									       			</div>
									       		</c:if>
							   				</div>
							   				
							   				<div class="col-md-4">
							   					<c:if test="${schemeMapping.scheme_broad_category ne 'Debt Schemes' 
							   						and schemeMapping.scheme_advisorkhoj_category ne 'Fund of Funds-Domestic-Debt'
							   						and schemeMapping.scheme_sub_category ne 'Debt: Gilt'
													and schemeMapping.scheme_sub_category ne 'Debt: Money Market'
													and schemeMapping.scheme_sub_category ne 'Target Maturity'}">
								   					<div style="border: 1px solid #eee;">
									   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Portfolio Behavior</h6>
									   					<div class="padding0 table-responsive">
										       				<table class="table table-bordered" style="border: none; margin: 0px;">
										       				<tbody>
																<tr>
																	<td class="green-lite-bg"  style="text-align: left;">Mean</td>
																	<td class="orange-lite-bg"  style="text-align: right;">${schemeMapping.mean}</td>
																</tr>
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Sharpe Ratio</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.sharpratio}</td>
																</tr>	
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Alpha</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.alpha}</td>
																</tr>	
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Beta</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.beta}</td>
																</tr>	
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Standard Deviation</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.standard_deviation}</td>
																</tr>
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Sortino</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.sortino_ratio}</td>
																</tr>	
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Portfolio Turnover</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.portfolio_turnover_ratio}</td>
																</tr>
															</tbody>
										       				</table>
										       			</div>
									       			</div>
								       			</c:if>
								       			
								       			<c:if test="${schemeMapping.scheme_broad_category eq 'Debt Schemes' 
								       				or schemeMapping.scheme_advisorkhoj_category eq 'Fund of Funds-Domestic-Debt'
								       				or schemeMapping.scheme_sub_category eq 'Debt: Gilt'
													or schemeMapping.scheme_sub_category eq 'Debt: Money Market'
													or schemeMapping.scheme_sub_category eq 'Target Maturity'}">
								       				<div style="border: 1px solid #eee;">
									   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Portfolio Behavior</h6>
									   					<div class="padding0 table-responsive">
										       				<table class="table table-bordered" style="border: none; margin: 0px;">
										       				<tbody>
																<tr>
																	<td class="green-lite-bg"  style="text-align: left;">Mean</td>
																	<td class="orange-lite-bg"  style="text-align: right;">${schemeMapping.mean}</td>
																</tr>
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Sharpe Ratio</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.sharpratio}</td>
																</tr>	
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Alpha</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.alpha}</td>
																</tr>	
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Beta</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.beta}</td>
																</tr>	
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Standard Deviation</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.standard_deviation}</td>
																</tr>	
																<tr>
																	<td class="green-lite-bg" style="text-align: left;">Sortino</td>
																	<td class="orange-lite-bg" style="text-align: right;">${schemeMapping.sortino_ratio}</td>
																</tr>	
															</tbody>
										       				</table>
										       			</div>
									       			</div>
								       			</c:if>
							   				</div>
							   				
							   				<div class="col-md-4">
							   					<c:if test="${schemeMapping.scheme_broad_category ne 'Debt Schemes' 
							   						and schemeMapping.scheme_advisorkhoj_category ne 'Fund of Funds-Domestic-Debt'
							   						and schemeMapping.scheme_sub_category ne 'Debt: Gilt'
													and schemeMapping.scheme_sub_category ne 'Debt: Money Market'
													and schemeMapping.scheme_sub_category ne 'Target Maturity'}">
													<div style="border: 1px solid #eee;">
													<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Market Cap Distribution</h6>
								   					<div class="mt-2" id="stock_chart"></div>
													</div>
												</c:if>
												
												<c:if test="${schemeMapping.scheme_broad_category eq 'Debt Schemes' 
													or schemeMapping.scheme_advisorkhoj_category eq 'Fund of Funds-Domestic-Debt' 
													or schemeMapping.scheme_sub_category eq 'Debt: Gilt'
													or schemeMapping.scheme_sub_category eq 'Debt: Money Market'
													or schemeMapping.scheme_sub_category eq 'Target Maturity'}">
													<div style="border: 1px solid #eee;">
									   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Debt Profile</h6>
									   					<div class="padding0 table-responsive">
										       				<table class="table table-bordered" style="border: none; margin: 0px;">
										       				<thead>
										       					<tr style="background: #ddd;">
										       						<th></th>
																	<th  class="text-right"> Scheme  </th>
																	<th  class="text-right"> Category </th>
																	<th  class="text-right"> % of Change</th>
										       					</tr>
										       				</thead>
										       				<tbody>
																<tr>
																	<td class="green-lite-bg"> Modified Duration </td>
																	<td class="text-right orange-lite-bg">
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.duration_current}" />
																	</td>
																	<td class="text-right green-lite-bg"> 
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.category_duration}" />
																	</td>
																	<td class="text-right orange-lite-bg">
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.change_percent_duration * 100}" />
																	 </td>
																</tr>
																<tr>
																	<td class="green-lite-bg"> Average Maturity </td>
																	<td class="text-right orange-lite-bg">
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.maturity_current}" />
																	</td>
																	<td class="text-right green-lite-bg">
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.category_maturity}" />
																	</td>
																	<td class="text-right orange-lite-bg">
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.change_percent_maturity * 100}" />
																	</td>
																</tr>
																<tr>
																	<td class="green-lite-bg"> Yield To Maturity </td>
																	<td class="text-right orange-lite-bg"> 
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.ytm_current}" />
																	</td>
																	<td class="text-right green-lite-bg"> 
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.category_ytm}" />
																	</td>
																	<td class="text-right orange-lite-bg">
																		<fmt:formatNumber type="number" maxFractionDigits="2" value="${debtPercent.change_percent_ytm * 100}" />
																	</td>
																</tr>
																<tr>
																	<td class="green-lite-bg"> &nbsp; </td>
																	<td class="text-right orange-lite-bg">&nbsp;</td>
																	<td class="text-right green-lite-bg">&nbsp;</td>
																	<td class="text-right orange-lite-bg">&nbsp;</td>
																</tr>
																<tr>
																	<td class="green-lite-bg"> &nbsp; </td>
																	<td class="text-right orange-lite-bg">&nbsp;</td>
																	<td class="text-right green-lite-bg">&nbsp;</td>
																	<td class="text-right orange-lite-bg">&nbsp;</td>
																</tr>
															</tbody>
										       				</table>
										       			</div>
										       		</div>
												</c:if>
							   				</div>			   					
							   			</div>
							   			
							   			<div id="yearly-performance-gth-div" class="mt-2" style="border: 1px solid #eee;">
							       			<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold">Yearly Performance (%)</h6>
							      			<div id="yearly-performance-container" style=" height: 275px;" class="adv-panel-border text-center mt-5">
												<i id="yearly-performance-gth-spinner" class="fa fa-cog fa-spin fa-2x" style="margin-top: 100px;"></i>
											</div>
							   			</div>
							   			
							   			<div class="row mt-2">
							   				<div class="col-md-9">
							   					<div style="border: 1px solid #eee;">
								   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">Standard Performance</h6>
								   					<div id="historical_returns_table_res" class="padding0 table-responsive">
								   					</div>
									   			</div>
							   				</div>
							   				<div class="col-md-3">
							   					<div style="border: 1px solid #eee; height: 310px;">
									       			<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold">Riskometer</h6>
									      			<div class="marginTop15 padding0 text-center">
									      				<c:choose>
															<c:when test="${fn:toLowerCase(schemeMapping.riskometer) eq 'low'}">
																<img class="w-75 mt-5" src="/images/riskometer/low.png" alt="riskometer" loading="lazy" />
															</c:when>
															<c:when test="${fn:toLowerCase(schemeMapping.riskometer) eq 'moderately low' || fn:toLowerCase(schemeMapping.riskometer) eq 'low to moderate'}">
																<img class="w-75 mt-5" src="/images/riskometer/low_to_moderate.png" alt="riskometer" loading="lazy" />
															</c:when>
															<c:when test="${fn:toLowerCase(schemeMapping.riskometer) eq 'moderate'}">
																<img class="w-75 mt-5" src="/images/riskometer/moderate.png" alt="riskometer" loading="lazy" />
															</c:when>
															<c:when test="${fn:toLowerCase(schemeMapping.riskometer) eq 'moderately high'}">
																<img class="w-75 mt-5" src="/images/riskometer/moderately_high.png" alt="riskometer" loading="lazy" />
															</c:when>
															<c:when test="${fn:toLowerCase(schemeMapping.riskometer) eq 'high'}">
																<img class="w-75 mt-5" src="/images/riskometer/high.png" alt="riskometer" loading="lazy" />
															</c:when>
															<c:when test="${fn:toLowerCase(schemeMapping.riskometer) eq 'very high'}">
																<img class="w-75 mt-5" src="/images/riskometer/very_high.png" alt="riskometer" loading="lazy" />
															</c:when>
														</c:choose>
									   				</div>
									   			</div>
							   				</div>
							   			</div>
							   			
											<div class="mt-2" style="border: 1px solid #eee;">
						   					<h6 style="background: #0085A1;color: #fff; padding:10px;" class="font-weight-bold m-0">SIP Returns (Monthly SIP of Rs. 10,000)</h6>
						   					<div class="padding0 table-responsive">
							       				<table class="table table-bordered" style="border: none; margin: 0px;">
												<thead>
													<tr style="background: #000;">
														<th class="text-center"></th>
														<th colspan="3" class="text-center">3 Year</th>
														<th colspan="3" class="text-center">5 Year</th>
														<th colspan="3" class="text-center">10 Year</th>
														<th colspan="3" class="text-center">15 Year</th>
													</tr>	
													<tr style="background: #000;">
														<th style="border-top: 0px;">Scheme Name</th>
														<th style="border-top: 0px;text-align:right;">Invested Amt</th>
														<th style="border-top: 0px;text-align:right;">Current Value</th>
														<th style="border-top: 0px;text-align:right;">XIRR (%)</th>
														<th style="border-top: 0px;text-align:right;">Invested Amt</th>
														<th style="border-top: 0px;text-align:right;">Current Value</th>
														<th style="border-top: 0px;text-align:right;">XIRR (%)</th>
														<th style="border-top: 0px;text-align:right;">Invested Amt</th>
														<th style="border-top: 0px;text-align:right;">Current Value</th>
														<th style="border-top: 0px;text-align:right;">XIRR (%)</th>
														<th style="border-top: 0px;text-align:right;">Invested Amt</th>
														<th style="border-top: 0px;text-align:right;">Current Value</th>
														<th style="border-top: 0px;text-align:right;">XIRR (%)</th>
													</tr>										
												</thead>
												<tbody>
														<tr>
															<td>${sipSummaryResponse.scheme_name}</td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${sipSummaryResponse.three_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${sipSummaryResponse.three_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${sipSummaryResponse.three_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${sipSummaryResponse.five_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${sipSummaryResponse.five_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${sipSummaryResponse.five_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${sipSummaryResponse.ten_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${sipSummaryResponse.ten_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${sipSummaryResponse.ten_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${sipSummaryResponse.fifteen_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${sipSummaryResponse.fifteen_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${sipSummaryResponse.fifteen_yr_returns}" /></td>
														</tr>
														<tr style="background: #e5f2dd;">
															<td>${benchmarkSummaryResponse.scheme_name}</td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${benchmarkSummaryResponse.three_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${benchmarkSummaryResponse.three_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${benchmarkSummaryResponse.three_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${benchmarkSummaryResponse.five_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${benchmarkSummaryResponse.five_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${benchmarkSummaryResponse.five_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${benchmarkSummaryResponse.ten_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${benchmarkSummaryResponse.ten_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${benchmarkSummaryResponse.ten_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${benchmarkSummaryResponse.fifteen_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${benchmarkSummaryResponse.fifteen_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${benchmarkSummaryResponse.fifteen_yr_returns}" /></td>
														</tr>
														<tr style="background: #fff3d1;">
															<td>${categorySummaryResponse.scheme_name}</td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${categorySummaryResponse.three_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${categorySummaryResponse.three_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${categorySummaryResponse.three_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${categorySummaryResponse.five_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${categorySummaryResponse.five_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${categorySummaryResponse.five_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${categorySummaryResponse.ten_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${categorySummaryResponse.ten_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${categorySummaryResponse.ten_yr_returns}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${categorySummaryResponse.fifteen_yr_inv_amnt}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="0" value="${categorySummaryResponse.fifteen_yr_curr_val}" /></td>
															<td><fmt:formatNumber type="number"	maxFractionDigits="2" value="${categorySummaryResponse.fifteen_yr_returns}" /></td>
														</tr>
												</tbody>
											</table>
							   				</div>
							   			</div>
							   			
						    		</div>
						    	</div>
					        </div>
					    </div> <!-- end card-->
					    
					    <div class="panel mt-3">
				        <div class="panel-container show">
					    <div class="panel-content p-1">	                    
					    		
					    <p class="f-14 margintop5 paddingline">Returns less than 1 year are in absolute and greater than 1 year are compounded annualised (CAGR). SIP returns are shown in XIRR (%).</p>
					    <p class="f-14 margintop5 paddingline">The Risk Level of any of the schemes must always be commensurate with the risk profile, investment objective or financial goals of the investor concerned. Mutual Fund Distributors (MFDs) or Registered Investment Advisors (RIAs) should take the risk profile and investment needs of individual investors into consideration and make scheme(s) or asset allocation recommendations accordingly.</p>
					    <p class="f-14 margintop5 paddingline"><b>Mutual Fund investments are subject to market risks, read all scheme related documents carefully.</b> Past performance may or may not be sustained in the future. Investors should always invest according to their risk appetite and consult with their mutual fund distributors or financial advisor before investing.</p>
					    </div>
				        </div>
				        </div>
					</div> <!-- end col -->
				</div>
				<input type="hidden" id="bmr_3m" value="${benchmark_returns.returns_abs_3month}">
				<input type="hidden" id="bmr_6m" value="${benchmark_returns.returns_abs_6month}">
				<input type="hidden" id="bmr_1y" value="${benchmark_returns.returns_abs_1year}">
				<input type="hidden" id="bmr_3y" value="${benchmark_returns.returns_cmp_3year}">
				<input type="hidden" id="bmr_5y" value="${benchmark_returns.returns_cmp_5year}">
				<input type="hidden" id="bmr_10y" value="${benchmark_returns.returns_cmp_10year}">
								
			</div>
		</div>
	</div>
</section>