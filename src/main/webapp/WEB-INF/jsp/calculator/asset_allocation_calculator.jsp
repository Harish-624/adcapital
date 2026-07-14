<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">

var debt = 0;
var equity = 0;
var age = 3;
var risk = 3;
var horizon = 2;
var believe = 2;

$(document).ready(function(){

	$("#slider_age").ionRangeSlider({
	    grid: true,
	    from: 2,	    
	    values: ["21-30 yrs", "31-45 yrs", "46-60 yrs", "> 60 yrs"],
	    hide_min_max: true,
	    hide_from_to: true,
	    onChange: function (data) {
            $("#asset_age").val("");
            var txt = "";
            if(data.from == 0)
            {
            	txt = "21-30 yrs";
            }
            if(data.from == 1)
            {
            	txt = "31-45 yrs";
            }
            if(data.from == 2)
            {
            	txt = "46-60 yrs";
            }
            if(data.from == 3)
            {
            	txt = "> 60 yrs";
            }
            $("#asset_age").val(txt);
        },
	    onFinish: function (data) {
            $("#asset_age").val("");
            var txt = "";
            if(data.from == 0)
            {
            	txt = "21-30 yrs";
            }
            if(data.from == 1)
            {
            	txt = "31-45 yrs";
            }
            if(data.from == 2)
            {
            	txt = "46-60 yrs";
            }
            if(data.from == 3)
            {
            	txt = "> 60 yrs";
            }
            $("#asset_age").val(txt);
            setSliderValues();
        }
	});  
	
	$("#slider_risk").ionRangeSlider({
	    grid: true,
	    from: 2,	    
	    values: ["Very Low", "Low", "Medium", "High","Very High"],
	    hide_min_max: true,
	    hide_from_to: true,
	    onChange: function (data) {
            $("#asset_risk").val("");
            var txt = "";
            if(data.from == 0)
            {
            	txt = "Very Low";
            }
            if(data.from == 1)
            {
            	txt = "Low";
            }
            if(data.from == 2)
            {
            	txt = "Medium";
            }
            if(data.from == 3)
            {
            	txt = "High";
            }
            if(data.from == 4)
            {
            	txt = "Very High";
            }
            $("#asset_risk").val(txt);
        },
	    onFinish: function (data) {
            $("#asset_risk").val("");
            var txt = "";
            if(data.from == 0)
            {
            	txt = "Very Low";
            }
            if(data.from == 1)
            {
            	txt = "Low";
            }
            if(data.from == 2)
            {
            	txt = "Medium";
            }
            if(data.from == 3)
            {
            	txt = "High";
            }
            if(data.from == 4)
            {
            	txt = "Very High";
            }
            $("#asset_risk").val(txt);
            setSliderValues();
        }
	});  
	
	$("#slider_horizon").ionRangeSlider({
	    grid: true,
	    from: 1,	    
	    values: ["< 2 yrs", "2-5 yrs", "5-10 yrs", "> 10 yrs"],
	    hide_min_max: true,
	    hide_from_to: true,
	    onChange: function (data) {
            $("#asset_horizon").val("");
            var txt = "";
            if(data.from == 0)
            {
            	txt = "< 2 yrs";
            }
            if(data.from == 1)
            {
            	txt = "2-5 yrs";
            }
            if(data.from == 2)
            {
            	txt = "5-10 yrs";
            }
            if(data.from == 3)
            {
            	txt = "> 10 yrs";
            }
            $("#asset_horizon").val(txt);
        },
	    onFinish: function (data) {
            $("#asset_horizon").val("");
            var txt = "";
            if(data.from == 0)
            {
            	txt = "< 2 yrs";
            }
            if(data.from == 1)
            {
            	txt = "2-5 yrs";
            }
            if(data.from == 2)
            {
            	txt = "5-10 yrs";
            }
            if(data.from == 3)
            {
            	txt = "> 10 yrs";
            }
            $("#asset_horizon").val(txt);
            setSliderValues();
        }
	});  
	
	$("#slider_caps").ionRangeSlider({
	    grid: true,
	    from: 1,
	    values: ["Yes", "No, I prefer big companies", "Not sure"],	 
	    hide_min_max: true,
	    hide_from_to: true,
	    onChange: function (data) {
            $("#asset_caps").val("");
            var txt = "";
            if(data.from == 0)
            {
            	txt = "Yes";
            }
            if(data.from == 1)
            {
            	txt = "No, I prefer big companies";
            }
            if(data.from == 2)
            {
            	txt = "Not sure";
            }
            $("#asset_caps").val(txt);
        },
	    onFinish: function (data) {
            $("#asset_caps").val("");
            var txt = "";
            if(data.from == 0)
            {
            	txt = "Yes";
            }
            if(data.from == 1)
            {
            	txt = "No, I prefer big companies";
            }
            if(data.from == 2)
            {
            	txt = "Not sure";
            }
            $("#asset_caps").val(txt);
            setSliderValues();
        }
	});  
	
	setSliderValues();
	
});

function setSliderValues()
{	
	var txt_age = $("#asset_age").val();
	var txt_risk = $("#asset_risk").val();
	var txt_horizon = $("#asset_horizon").val();
	var txt_believe = $("#asset_caps").val();
	
	if(txt_age == "21-30 yrs")
    {
		age = 1;
    }
    if(txt_age == "31-45 yrs")
    {
    	age = 2;
    }
    if(txt_age == "46-60 yrs")
    {
    	age = 3;
    }
    if(txt_age == "> 60 yrs")
    {
    	age = 4;
    }
    
	
	if(txt_risk == "Very Low")
    {
		risk = 1;
    }
    if(txt_risk == "Low")
    {
    	risk = 2;
    }
    if(txt_risk == "Medium")
    {
    	risk = 3;
    }
    if(txt_risk == "High")
    {
    	risk = 4;
    }
    if(txt_risk == "Very High")
    {
    	risk = 5;
    }
    
	if(txt_horizon == "< 2 yrs")
    {
		horizon = 1;
    }
    if(txt_horizon == "2-5 yrs")
    {
    	horizon = 2;
    }
    if(txt_horizon == "5-10 yrs")
    {
    	horizon = 3;
    }
    if(txt_horizon == "> 10 yrs")
    {
    	horizon = 4;
    }
	
	if(txt_believe == "Yes")
    {
		believe = 1;
    }
    if(txt_believe == "No, I prefer big companies")
    {
    	believe = 2;
    }
    if(txt_believe == "Not sure")
    {
    	believe = 3;
    }
    
    calculateAssetValue();
}

function calculateAssetValue()
{	
	 debt = 0;
	 equity = 0;
	var fmp_debt_value = 0;
	var long_term_fixed_value = 0;
	var cash_liquid_value = 0;
	var mid_small_cap_value = 0;
	var large_cap_value = 0;
	
	$.ajaxSetup({async:false});
	$.post("/tools-and-calculators/getAssetAllocationResult", {current_age : "" + age + "",risk_profile : "" + risk + "",investment_horizon : "" + horizon + "",do_you_know : "" + believe + ""}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status == 400)
		{
			alert(obj.msg);
			return false;
		}
		
		debt = obj.debt;
		equity = obj.equity;
		fmp_debt_value = obj.fmp_debt_value;
		long_term_fixed_value = obj.long_term_fixed_value;
		cash_liquid_value = obj.cash_liquid_value;
		mid_small_cap_value = obj.mid_small_cap_value;
		large_cap_value = obj.large_cap_value;
		
    },'text');

    renderChart(debt, equity, fmp_debt_value, long_term_fixed_value, cash_liquid_value, mid_small_cap_value, large_cap_value);
}

/* function renderChart(debt, equity, fmp_debt_value, long_term_fixed_value, cash_liquid_value, mid_small_cap_value, large_cap_value)
{
	$('#res_asset_allocation').html("Based on your profile it is suggested to invest " + debt + " % in Debt and " + equity + " % in Equity");
	
	debt = parseFloat(debt);
	equity = parseFloat(equity);
	
	$('#emipiechart').highcharts({
	    chart: {
	        type: 'pie',
	        marginTop:100,
	        marginBottom:0
	    },
	    title: {
	        text: '',
	        align:'left',
	          style: {
                color: '#000000',
                fontWeight: 'bold',
                fontSize:'16px'
            }
	    },
	    credits: {
	          enabled: false
	    },
	    yAxis: {
	        title: {
	            text: '{chart_pie_yAxis}'
	        }
	    },
	    plotOptions: {
	        pie: {
	            shadow: false,
	            center: ['50%', '50%']
	        }
	    },
	    legend: {
	        layout: 'vertical',
	        floating: true,
	        align: 'right',
	        verticalAlign: 'top',
	        symbolPadding: 5,
	        symbolWidth: 10,
	        x:10,
	        y:-10,
	        borderWidth: 1,
	       	borderRadius: 5,
	       	itemStyle: {
	        	  font: 'normal 12px Helvetica Neue, Helvetica, Arial, sans-serif',
	           }
	    },
	    tooltip: {
	        formatter: function () {
	            return '<b>' + this.point.name + '</b>: ' + this.y + ' %';
	        }
	    },
	    series: [{
	        name: 'Debt',
	        data: [{
	        	name: 'FMPs and Debt Funds',
	            y: fmp_debt_value,
	            parentId: 'first',
	            color: '#323946',
	            legendIndex: 1
	        }, {
	        	name: 'Long Term Fixed Income',
	            y: long_term_fixed_value,
	            parentId: 'first',
	            color: '#FFA500',
	            legendIndex: 2
	        }, {
	        	name: 'Cash/Bank FD/Liquid',
	            y: cash_liquid_value,
	            parentId: 'first',
	            color: '#6AF9C4',
	            legendIndex: 3
	        }, {
	        	name: 'Mid-Cap/Small-Cap',
	            y: mid_small_cap_value,
	            parentId: 'second',
	            color: '#00a85b',
	            legendIndex: 5
	        },{
	        	name: 'Large-Caps',
	            y: large_cap_value,
	            parentId: 'second',
	            color: '#0DAFAF',
	            legendIndex: 6
	        }],
	        showInLegend: false,
	        size: '60%',
	        dataLabels: {
	        	enabled: false
	        },
	        showInLegend: true
	    }, {
	        showInLegend: true,
	        name: 'Equity',
	        data: [{
	        	name: 'Debt',
	            id: 'first',
	            color: '#24A3D8',
	            y: debt,
	            legendIndex: 0
	        }, {
	        	name: 'Equity',
	            id: 'second',
	            color: '#323946',
	            y: equity,
	            legendIndex: 4
	        }],
	        size: '80%',
	        innerSize: '60%',
	        dataLabels: {
	        	enabled: false
	        }
	    }]
	});
}  */
function renderChart(debt, equity, fmp_debt_value, long_term_fixed_value, cash_liquid_value, mid_small_cap_value, large_cap_value)
{
 $('#res_asset_allocation').html("Based on your profile it is suggested to invest " + debt + " % in Debt and " + equity + " % in Equity"); 
	debt = parseFloat(debt);
	equity = parseFloat(equity);
	fmp_debt_value = parseFloat(fmp_debt_value);
	long_term_fixed_value = parseFloat(long_term_fixed_value);
	cash_liquid_value = parseFloat(cash_liquid_value);
	mid_small_cap_value = parseFloat(mid_small_cap_value);
	large_cap_value = parseFloat(large_cap_value);
	
	
	$('#emipiechart').highcharts({
		 colors: ['#edb20f', '#000000', '#29d359', '#5200AA', '#24CBE5', '#d90d15', 
		       '#43433c', '#FFF263', '#6AF9C4'],
	    chart: {
	      plotBackgroundColor: null,
	      plotBorderWidth: null,
	      plotShadow: false,
	      type: 'pie'
	    },
	  title: {
	        text: '',
	        align:'left',
	          style: {
                color: '#000000',
                fontWeight: 'bold',
                fontSize:'16px'
            }
	    },  
	  legend:{
	    enabled:true
	  },
	  credits: {
          enabled: false
      },
	    tooltip: {
	    	formatter:function(){
	            return this.key+ ': ' + this.y + '%';
	          },
	    },
	    plotOptions: {
	      pie: {
	        allowPointSelect: false,
	        cursor: 'pointer',
	        dataLabels: {
	          enabled: false,
	          formatter:function(){
	            return this.key+ ': ' + this.y + '%';
	          },
	        },
	        showInLegend: true
	      },
	      series: {
	            animation: {
	                duration: 2000
	            }
	        }
	    },
	    series: [{
	        name: 'Debt',
	        data: [{
	        	name: 'FMPs and Debt Funds',
	            y: fmp_debt_value,
	            parentId: 'first',
	            color: '#edb20f',
	            legendIndex: 1
	        }, {
	        	name: 'Long Term Fixed Income',
	            y: long_term_fixed_value,
	            parentId: 'first',
	            color: '#29e24c',
	            legendIndex: 2
	        }, {
	        	name: 'Cash/Bank FD/Liquid',
	            y: cash_liquid_value,
	            parentId: 'first',
	            color: '#0500a0',
	            legendIndex: 3
	        }, {
	        	name: 'Mid-Cap/Small-Cap',
	            y: mid_small_cap_value,
	            parentId: 'second',
	            color: '#ff5fbc',
	            legendIndex: 5
	        },{
	        	name: 'Large-Caps',
	            y: large_cap_value,
	            parentId: 'second',
	            color: '#7a0294',
	            legendIndex: 6
	        }],
	        showInLegend: false,
	        size: '60%',
	        dataLabels: {
	        	enabled: false
	        },
	        showInLegend: true
	    }, {
	        showInLegend: true,
	        name: 'Equity',
	        data: [{
	        	name: 'Debt',
	            id: 'first',
	            color: '#0e7adb',
	            y: debt,
	            legendIndex: 0
	        }, {
	        	name: 'Equity',
	            id: 'second',
	            color: '#239e2f',
	            y: equity,
	            legendIndex: 4
	        }],
	        size: '80%',
	        innerSize: '60%',
	        dataLabels: {
	        	enabled: false
	        }
	    }]
	  });
}  



function downloadResult() {
	
	var asset_age = $("#asset_age").val();
	var asset_risk = $("#asset_risk").val();
	var asset_horizon = $("#asset_horizon").val();
	var asset_caps = $('#asset_caps').val();
	var calc_url = $("#asset_caps").val();
	
	var calc_url = window.location.href;

	var param = "?asset_age="+asset_age+"&asset_risk="+asset_risk+"&asset_horizon="+asset_horizon+"&asset_caps="+asset_caps+"&debt="+debt+"&equity="+equity+"&url="+calc_url;
		
		var url = '<c:url value="/tools-and-calculators/downloadAssetAllocationCalcResult" />'+param;
		window.location = url;
		

	$('#send_email_model').modal('hide');
	setTimeout(function() {
		swal({title : "",text : "Thanks for the Download."});
	}, 1000);

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
  .premium-calculator-hero p {
    color: #4b5563;
    font-size: 1.1rem;
    line-height: 1.7;
    max-width: 600px;
    margin: 0 auto;
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
  
  /* Result Card Teal Gradient */
  .premium-result-card {
    background: linear-gradient(135deg, #009899 0%, #007A7A 100%);
    border-radius: 24px;
    color: #ffffff;
    box-shadow: 0 20px 40px rgba(0,152,153,0.2);
    border: none;
    overflow: hidden;
  }
  .premium-result-card .list-group-item {
    border-color: rgba(255,255,255,0.1);
  }
  .premium-result-card .text-muted, 
  .premium-result-card .text-theme-primary {
    color: rgba(255,255,255,0.85) !important;
  }
  .premium-result-card h6 {
    color: #ffffff;
    font-size: 1.25rem;
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
  
  .premium-chart-card {
    background: #fff;
    border-radius: 24px;
    border: 1px solid #f3f4f6;
    box-shadow: 0 10px 30px rgba(0,0,0,0.03);
    overflow: hidden;
  }
</style>

<main>
<section class="premium-calculator-hero text-center">
  <div class="container">
    <div class="hero-label">Tools &amp; Calculators</div>
    <h1>Asset Allocation Calculator</h1>
    <p>Determine the ideal mix of equity, debt, and other asset classes based on your profile.</p>
  </div>
</section>

        <!-- Section -->
        <section class="section bg-light pt-5" style="position:relative; z-index:1;">
            <div class="container">
				<div class="row align-items-center mb-5 sr-section">
					<div class="col-sm-8">
						<h3 style="font-weight:700; color:#1a1f2e;">Asset Allocation Calculator</h3>
						<p style="color:#4b5563;">Finding the right balance between risk and returns is key to smart investing. Our Asset Allocation Calculator helps you determine the ideal mix of equity, debt, and other asset classes based on your risk appetite, investment horizon, and financial goals. By analysing your profile, this tool suggests a customized allocation strategy to optimize your portfolio and enhance long-term wealth creation. Start planning your investments wisely today!</p>
					</div>
					<div class="col-sm-4 text-end">
						<button type="button" class="btn rounded-pill px-4 py-2 text-white" onclick="downloadResult()" data-loading-text="Please wait..." style="background:#009899; border:none; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);">
							<i class="fa fa-download me-2"></i> Download
						</button>
					</div>
				</div>
                <div class="row justify-content-lg-between">
                <div class="col-lg-7 sr-child">
                        <div class="row calculator">
                            <div class="col-sm-12 my-3 row-eq-height">
                                <div class="premium-glass-card p-4 pb-0">
                                    <p class="m-0 pb-2 fw-bold text-dark">
                                    	How many Crores (at current value) you would need to consider yourself wealthy (Rs)
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" class="premium-calc-input w-100 mb-3" value="46-60 yrs" id="asset_age" readonly />
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" id="slider_age" name="slider_age" value="" />
                                    </p>
                                </div>
                            </div>

                            <div class="col-sm-12 my-3 row-eq-height">
                                <div class="premium-glass-card p-4 pb-0">
                                    <p class="m-0 pb-2 fw-bold text-dark">
                                    	How much risk you can take?
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" class="premium-calc-input w-100 mb-3" value="Medium" id="asset_risk" readonly />
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" id="slider_risk" name="slider_risk" value="" />
                                    </p>
                                </div>
                            </div>
                            
                            <div class="col-sm-12 my-3 row-eq-height">
                                <div class="premium-glass-card p-4 pb-0">
                                    <p class="m-0 pb-2 fw-bold text-dark">
                                    	Your investment Horizon (Years)
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" class="premium-calc-input w-100 mb-3" value="2-5 yrs" id="asset_horizon" readonly />
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" id="slider_horizon" name="slider_horizon" value="" />
                                    </p>
                                </div>
                            </div>
                            
                            <div class="col-sm-12 my-3 row-eq-height">
                                <div class="premium-glass-card p-4 pb-0">
                                    <p class="m-0 pb-2 fw-bold text-dark">
                                    	Do you know that mid and small caps generate better return in logn term
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" class="premium-calc-input w-100 mb-3" value="No, I prefer big companies" id="asset_caps" readonly />
                                    </p>
                                    <p class="m-0">
                                    	<input type="text" id="slider_caps" name="slider_caps" value="" />
                                    </p>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                   <div class="col-lg-5 my-3 sr-child">

                        <div class="row pb-4">
                        <div class="col-sm-12">
							<div class="premium-chart-card p-4 pb-0">
                                <div id="emipiechart"></div>
							</div>
							</div>
						</div>
						
						<div class="card mb-5 text-center premium-result-card">
                                <div class="card-body p-4">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item bg-transparent border-0">
                                            <div class="row">
                                            	<div id="emipaymentsummary">
		<div id="res_asset_allocation" class="h5 text-white mt-0 mb-0 d-lg-block fw-bold" style="line-height: 1.6;"></div>
</div>
                                            </div>
                                        </li>
                                       
                                    </ul>
                                </div>
                            </div>


                    </div>
                    
                </div>
            </div>
            <div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;"><b>Disclaimer :</b> We have gathered all the data, information, statistics from the sources believed to be highly reliable and true. All necessary precautions have been taken to avoid any error, lapse or insufficiency; however, no representations or warranties are made (express or implied) as to the reliability, accuracy or completeness of such information. We cannot be held liable for any loss arising directly or indirectly from the use of, or any action taken in on, any information appearing herein. The user is advised to verify the contents of the report independently.</p>
							<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;">Returns less than 1 year are in absolute (%) and greater than 1 year are compounded annualised (CAGR %). SIP returns are shown in XIRR (%).</p>
							<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;">The Risk Level of any of the schemes must always be commensurate with the risk profile, investment objective or financial goals of the investor concerned. Mutual Fund Distributors (MFDs) or Registered Investment Advisors (RIAs) should assess the risk profile and investment needs of individual investors into consideration and make scheme(s) or asset allocation recommendations accordingly.</p>
							<p style="font-size:11px; line-height:17px; text-align:justify; margin-bottom:8px;"><b>Mutual Fund investments are subject to market risks, read all scheme related documents carefully.</b> Past performance may or may not be sustained in the future. Investors should always invest according to their risk profile and consult with their mutual fund distributors or financial advisor before investing.</p>
						</div>
					</div>
				</div>
			</div>
        </section>
        <!-- End Section -->
  </main>