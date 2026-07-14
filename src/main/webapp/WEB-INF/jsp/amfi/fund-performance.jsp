<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
$(document).ready(function(){
	
	$('#mf_fund_txt').typeahead({
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
	
	$('#sip-submit').click(function(e){
	 	e.preventDefault();

	 	var fund = $("#mf_fund_txt").val();
	 	
	 	if(fund == "")
	 	{
	 		$("#adv-alert-msg").html("Please type an Fund Name and select it from the autocomplete functionality.<br/>Then click on Submit.");
	   	    $("#adv-alert").modal('show');
	   	    return false;
	 	}
	 	
	 //	var l = Ladda.create(this);
	 	//l.start();
	 	
	 	var schemeName = encodeURIComponent(fund);
	 	
	 	$.ajaxSetup({async:false});
		$.post("/mutual-funds-research/isValidFundName", {fund : schemeName}, function(data)
	    {
			//l.stop();
			var result = $.trim(data);
			if(result == "true")
			{
				document.location =  "/mutual-funds-research/fund-card?scheme="+schemeName; 
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
        <h1 class="display-6 text-dark mb-4 animated slideInDown">Mutual Fund Selector</h1>
    </div>
</div>

<section class="bg-light">
	<div class="container py-5">
		<div class="col-md-12 col-sm-12 col-xs-padding0">
			<div class="row">      
		    	<div class="col-xs-12 col-md-12 col-sm-12 text-center marginTop0 marginBottom15">    
		    		<c:if test="${not empty mfBarAd && fn:length(mfBarAd) > 0}">
					 <c:forEach var="adv" items="${mfBarAd}">
					     <a href="${adv.add_link}" target="_blank" onclick="saveAdvertisementClick('${adv.id}')"><img class="img-responsive" src="/resources/images/ads/${adv.add_image}" alt="${adv.add_name}"/></a>
					     <br/>
					 </c:forEach>
					 </c:if>  
		    	</div>
		    </div>
			
			<div class="premium-glass-card p-4 mt-2">
		        
		        <div class="card-body">
					<div class="col-md-12">
			           <div class="row align-items-end">
			            
			            <div class="col-md-4 col-sm-5">
				            <div class="form-group">
				            <label class="bold-smaller">Type Any Fund Name and Click Submit</label>
				            <input id="mf_fund_txt" type="text" class="form-control margin-bottom10 no-radius" placeholder="Type Fund Name and Click Submit">
				            </div>
			            </div>
			            
			            <div class="col-md-2 col-sm-2 text-end">
			                <div class="form-group">
					          <label class="bold block hidden-xs">&nbsp;</label>
						      <a href="#" id="sip-submit" class="btn rounded-pill px-4 py-2 text-white w-100" data-style="expand-right" data-size="l" style="background:#009899; font-weight:600; box-shadow:0 8px 20px rgba(0,152,153,0.2);"><span class="ladda-label">Submit</span></a>
						    </div>
			            </div>
			            
			          </div>
			         </div>
			        
		        </div>
			</div>
	      	
		</div>
	</div>
</section>