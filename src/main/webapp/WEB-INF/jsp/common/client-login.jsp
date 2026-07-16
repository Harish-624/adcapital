<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     
   
<style>
/* ── Premium Auth Page Styles ─────────────────────────────── */
.auth-wrapper {
  min-height: 100vh;
  display: flex;
  background: #f8fafb;
}
.auth-left {
  flex: 1;
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  position: relative;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 60px;
  color: #fff;
  display: none; /* Hidden on mobile */
}
@media (min-width: 992px) {
  .auth-left {
    display: flex;
  }
}
.auth-left::before {
  content: '';
  position: absolute;
  top: -50px;
  right: -50px;
  width: 400px;
  height: 400px;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0) 70%);
  border-radius: 50%;
  animation: pulse-ring 8s infinite alternate;
}
.auth-left::after {
  content: '';
  position: absolute;
  bottom: -100px;
  left: 10%;
  width: 300px;
  height: 300px;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.08) 0%, rgba(255, 255, 255, 0) 70%);
  border-radius: 50%;
}
.auth-left-content {
  position: relative;
  z-index: 1;
  max-width: 500px;
}
.auth-left-content h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 20px;
  color: #fff;
}
.auth-left-content p {
  font-size: 1.1rem;
  color: rgba(255, 255, 255, 0.85);
  line-height: 1.6;
}
.auth-right {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 40px 20px;
  position: relative;
}
.auth-card {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 24px;
  border: 1px solid rgba(255, 255, 255, 0.8);
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.05);
  backdrop-filter: blur(20px);
  padding: 50px 40px;
  width: 100%;
  max-width: 500px;
}
.auth-tabs {
  display: flex;
  margin-bottom: 30px;
  background: #f3f4f6;
  border-radius: 12px;
  padding: 5px;
}
.auth-tab {
  flex: 1;
  text-align: center;
  padding: 12px;
  font-size: 15px;
  font-weight: 600;
  color: #6b7280;
  cursor: pointer;
  border-radius: 8px;
  transition: all 0.3s ease;
}
.auth-tab.activeLink {
  background: #fff;
  color: #009899;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}
.auth-title {
  text-align: center;
  font-size: 24px;
  font-weight: 700;
  color: #1a1f2e;
  margin-bottom: 30px;
}
.premium-input-group {
  margin-bottom: 20px;
}
.premium-input-group label {
  font-size: 13px;
  font-weight: 600;
  color: #4b5563;
  margin-bottom: 8px;
  display: block;
}
.premium-input-group label i {
  color: #009899;
  margin-right: 5px;
}
.premium-input {
  width: 100%;
  background: #f8fafb;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 14px 20px;
  font-size: 15px;
  color: #1a1f2e;
  transition: all 0.3s ease;
}
.premium-input:focus {
  outline: none;
  border-color: #009899;
  background: #fff;
  box-shadow: 0 0 0 4px rgba(0, 152, 153, 0.1);
}
.premium-btn {
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  color: #fff;
  border: none;
  border-radius: 12px;
  padding: 16px;
  font-size: 16px;
  font-weight: 600;
  width: 100%;
  transition: all 0.3s ease;
  cursor: pointer;
  box-shadow: 0 10px 20px rgba(0, 152, 153, 0.2);
  margin-top: 10px;
}
.premium-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 15px 25px rgba(0, 152, 153, 0.3);
}
.auth-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 15px;
  font-size: 14px;
}
.auth-link {
  color: #009899;
  font-weight: 500;
  text-decoration: none;
  transition: color 0.3s ease;
}
.auth-link:hover {
  color: #0085A1;
  text-decoration: underline;
}
.social-proof {
  margin-top: 30px;
  text-align: center;
  font-size: 13px;
  color: #6b7280;
  font-weight: 500;
}
.social-proof i {
  color: #009899;
  margin-right: 5px;
}
</style>

<div class="auth-wrapper">
  <!-- Left Side: Branding -->
  <div class="auth-left">
    <div class="auth-left-content sr-reveal fadeInLeft" data-sr-reveal-delay="0.1s">
      <h1>Plutus' Inner Mind</h1>
      <p>Welcome to AdCapital's premium client portal. Access your portfolio, track investments, and manage your wealth securely in one place.</p>
    </div>
  </div>

  <!-- Right Side: Forms -->
  <div class="auth-right">
    <div class="auth-card sr-reveal fadeInRight" data-sr-reveal-delay="0.2s">
      
      <!-- Tabs -->
      <div class="auth-tabs">
        <div class="auth-tab loginlink activeLink" onclick="showLoginPage()">Login</div>
        <div class="auth-tab registerlink" onclick="showSignupPage()">Register</div>
      </div>

      <!-- Login Form -->
      <div id="login_div">
        <h2 class="auth-title">Welcome Back</h2>
        
        <div class="premium-input-group">
          <label>LOGIN ID</label>
          <input type="text" id="txt_pan" class="premium-input" placeholder="Enter your PAN number">
        </div>
        
        <div class="premium-input-group">
          <label>PASSWORD</label>
          <input type="password" id="txt_pass" class="premium-input" placeholder="Enter your Password">
        </div>
        
        <div class="auth-options">
          <label class="d-flex align-items-center m-0" style="cursor:pointer;">
            <input type="checkbox" id="checkbox1" class="mr-2"> Keep me signed in
          </label>
          <a href="/client-forgot-password" class="auth-link">Forgot password?</a>
        </div>
        
        <button type="submit" id="btn-submit" class="premium-btn" onclick="validateLoginMethod()">Sign In</button>
        <input type="hidden" id="authcode" class="form-control" name="authcode" value="${authcode}" />
        
        <div class="text-center mt-4" style="font-size:14px; color:#6b7280;">
          <c:choose>
            <c:when test="${authcode != ''}">
              Don't have an account? <a href="/signup?authcode=${authcode}" class="auth-link ml-1">Create One!</a>
            </c:when>
            <c:otherwise>
              Don't have an account? <a href="/signup" class="auth-link ml-1" onclick="showSignupPage(); return false;">Create One!</a>
            </c:otherwise>
          </c:choose>
        </div>
      </div>

      <!-- Signup Form -->
      <div id="signup_div" style="display:none;">
        <h2 class="auth-title">Create Account</h2>
        
        <div class="premium-input-group">
          <label><i class="fa fa-user-o"></i> Your Name (As on PAN)</label>
          <input type="text" id="txt_sign_name" class="premium-input" placeholder="Enter your full name">
        </div>
        
        <div class="premium-input-group">
          <label><i class="fa fa-envelope-o"></i> Email Address</label>
          <input type="email" id="txt_sign_email" class="premium-input" placeholder="Enter your email">
        </div>
        
        <div class="premium-input-group">
          <label><i class="fa fa-phone"></i> Mobile Number</label>
          <input type="tel" id="txt_sign_mobile" class="premium-input" placeholder="Enter your mobile">
        </div>
        
        <div class="premium-input-group">
          <label><i class="fa fa-credit-card"></i> Your PAN</label>
          <input type="text" id="txt_sign_pan" class="premium-input" placeholder="Enter your PAN number">
        </div>
        
        <div class="premium-input-group">
          <label><i class="fa fa-lock"></i> Password</label>
          <input type="password" id="txt_sign_password" class="premium-input" placeholder="Create a password">
        </div>
        
        <div class="premium-input-group">
          <label><i class="fa fa-key"></i> Confirm Password</label>
          <input type="password" id="txt_sign_confirm_password" class="premium-input" placeholder="Confirm your password">
        </div>
        
        <div class="auth-options" style="justify-content: flex-start; margin-bottom: 20px;">
          <label class="d-flex align-items-center m-0" style="cursor:pointer;">
            <input type="checkbox" id="chk_agree" class="mr-2" checked="checked"> 
            <span>I agree to the <a target="_blank" href="/terms-and-conditions" class="auth-link">Terms & Conditions</a></span>
          </label>
        </div>
        
        <button type="submit" id="btn_reg_meet" class="premium-btn" onclick="validateSignUp()">Create Account</button>
      </div>

      <div class="social-proof sr-reveal" data-sr-reveal-delay="0.4s">
        <i class="fas fa-shield-alt"></i> Secure 256-bit encryption
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
<div class="modal-dialog">
<div class="modal-content">
      <div class="modal-header">
      <h6 class="modal-title">Sign Up Verification</h6>
      </div>
	<div class="modal-body">
		<div class="form-group">
		<label>Enter the Mobile verification code</label>
		<input class="form-control" id="txt_mobile_verify_code">
		<p style="font-size:11px;">We have sent you a verification code on your mobile number.</p>
		</div>
		<div class="form-group">
		<label>Enter the Email verification code</label>
		<input class="form-control" id="txt_email_verify_code">
		<p style="font-size:11px;">We have sent you a verification code on your email id.</p>
		</div>
		<div class="form-group">
		<div id="login_modal_alert" class="alert alert-danger marginBottom0" style="display:none;">
		<span id="login_modal_msg"></span>
		</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		<button class="btn btn-primary" type="submit" onclick="validateCode()">Submit</button>
	</div>
</div>
</div>
</div>
<!-- /.modal -->

<style>
/* Remove old styles */
</style>

<script type="text/javascript">
var authcode = "";

function showLoginPage()
{
	$(".registerlink").removeClass("activeLink");
	$(".loginlink").addClass("activeLink");
	$("#signup_div").hide();
	$("#login_div").show();
}
function showSignupPage()
{
	$(".loginlink").removeClass("activeLink");
	$(".registerlink").addClass("activeLink");
	$("#login_div").hide();
	$("#signup_div").show();
}

function validateSignUp()
{
	var name = $("#txt_sign_name").val();
	var email = $("#txt_sign_email").val();
	var mobile = $("#txt_sign_mobile").val();
	var pan = $("#txt_sign_pan").val();
	var password = $("#txt_sign_password").val();
	var confirm_password = $("#txt_sign_confirm_password").val();
	var email_flag = false;

	if(name == "")
    {
    	swal({title:"",text:"Please enter your name"});
    	return false;
    }
    if(email == "")
    {
    	swal({title:"",text:"Please enter the email address"});
    	return false;
    }
    if(mobile == "")
    {
    	swal({title:"",text:"Please enter the mobile number"});
    	return false;
    }
    if(mobile.length != 10)
    {
    	swal({title:"",text:"Please enter the valid mobile number"});
    	return false;
    }
    if(pan == "")
    {
    	swal({title:"",text:"Please enter the PAN number"});
    	return false;
    }
    if(pan.length != 10)
    {
    	swal({title:"",text:"Please enter the valid PAN number"});
    	return false;
    }
    var reg = /[A-Za-z]{5}\d{4}[A-Za-z]{1}/;
    if (!reg.test(pan)) 
    {
    	swal({title:"",text:"Please enter the valid PAN number"});
    	return false;
    }
    if(password == "")
    {
    	swal({title:"",text:"Please enter the password"});
    	return false;
    }
    if(confirm_password == "")
    {
    	swal({title:"",text:"Please enter the confirm password"});
    	return false;
    }
    if(password.length < 6 || password.length > 16)
    {
    	swal({title:"",text:"Password must have minimum of 6 characters and maximum 16 characters"});
    	return false;
    }
    if(password != confirm_password)
    {
    	swal({title:"",text:"Password and confirm password not match. Please enter the valid password and confirm password."});
    	return false;
    }
    if (!$("#chk_agree").is(":checked")) 
    {
    	swal({title:"",text:"Please agree our terms and conditions."});
    	return false;
    }
    
    pan = pan.toUpperCase();
    
    $.LoadingOverlay("show");
 	
 	$.ajaxSetup({async:false});
    $.post("/verifyPAN", {pan : "" + pan + ""}, function(data)
    {
    	$.LoadingOverlay("hide");
    	
		var result = $.trim(data);	       
		result = result.replace(/ {1,}/g," ");
		if(result != "")
		{
			if(result == "false" || name.toLowerCase() != result.toLowerCase())
	        {
	        	email_flag = true;
	        	swal({title:"",text:"Please enter the valid PAN number and Name!"});
	       	 	return false;
	        }
		}
        
    }, "text");
    
    if(email_flag)
    {
    	swal({title:"",text:"Please enter the valid PAN number and Name!"});
   	 	return false;    	
    }
    
    $.LoadingOverlay("show");
 	
 	$.ajaxSetup({async:false});
    $.post("/verifyEmail", {email : "" + email + ""}, function(data)
    {
    	$.LoadingOverlay("hide");
    	
		var result = $.trim(data);
        if(result == "false")
        {
        	email_flag = true;
        	swal({title:"",text:"Please enter the valid email address!"});
       	 	return false;
        }
        
    }, "text");
    
    if(email_flag)
    {
    	swal({title:"",text:"Please enter the valid email address!"});
   	 	return false;    	
    }
    
    $.LoadingOverlay("show");
 	
 	$.ajaxSetup({async:true});
	$.post("/signupVerificationCodeSend", {name : name, email : email, mobile : mobile, pan : pan}, function(data)
    {
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status == 200)
		{
			$("#myModal").modal('show');
		}
		else
		{
			swal({title:"",text:obj.msg + " Contact us at info@meetplutus.com or call +91-8882441275"});
	   	    return false;
		}
		
    }, "text");
}

function validateCode()
{
	var mobile_code = $("#txt_mobile_verify_code").val();
	var email_code = $("#txt_email_verify_code").val();
	
	mobile_code = $.trim(mobile_code);
	email_code = $.trim(email_code);
	
	if(mobile_code == "" || mobile_code.length != 4)
    {
    	$("#login_modal_alert").show().fadeOut(5000);
		$("#login_modal_msg").html("Enter valid mobile verification code");
    	return;
    }
	if(email_code == "" || email_code.length != 4)
    {
    	$("#login_modal_alert").show().fadeOut(5000);
		$("#login_modal_msg").html("Enter valid email verification code");
    	return;
    }
	
	$.LoadingOverlay("show");
	
    $.ajaxSetup({async:true});
	$.post("/verifyOTP", {mobile_code : ""+mobile_code+"", email_code : ""+email_code+""}, function(data)
    {
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status == 400)
   		{
   			$("#login_modal_alert").show().fadeOut(5000);
   			$("#login_modal_msg").html(obj.msg);
   			return false;
   		}else
   	   	{
   			$("#myModal").modal('hide');
   			createNewUser(mobile_code, email_code);
   	   	}
   		
    }, "text");
}
function createNewUser(mobile_code, email_code)
{
	var name = $("#txt_sign_name").val();
	var email = $("#txt_sign_email").val();
	var mobile = $("#txt_sign_mobile").val();
	var pan = $("#txt_sign_pan").val();
	var password = $("#txt_sign_password").val();
	
	$.LoadingOverlay("show");
	
    $.ajaxSetup({async:true});
	$.post("/validateSignUp", {name : ""+name+"", email : ""+email+"", mobile : ""+mobile+"", pan : ""+pan+"", password : ""+password+"", mobile_code : ""+mobile_code+"", email_code : ""+email_code+"", authcode : ""+authcode+""}, function(data)
    {
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status == 400)
   		{
   			swal({title:"",text:obj.msg});
   			return false;
   		}
   		
   		if(authcode == "")
		{
   			var encrypted_text = obj.encrypted_text;
   			top.location = "https://mfportfolio.meetplutus.com/investor/portfolio-meet-plutus?id="+encrypted_text;
		}else
		{
			var goal_id = obj.status_msg;
			var goal_type = obj.msg;
			var userid = obj.userid;
			
			if(goal_type == "Goal Based Robo Advisor")
			{
				top.location = "https://mfportfolio.meetplutus.com/bse/bse-goal-based-sip-investment?userid="+userid+"&id="+goal_id;
			}else
			{
				top.location = "https://mfportfolio.meetplutus.com/bse/bse-robo-based-online-investment?userid="+userid+"&id="+goal_id;
			}
		}            
    }, "text");
}
function validateLoginMethod()
{
	var pan = $("#txt_pan").val();
	var pass = $("#txt_pass").val();
	
    if(pan == "" || pan.length != 10)
    {
    	swal({title:"Invalid PAN",text:"Enter your valid PAN number"});
   	    return false;
    }
    if(pass == "")
    {
    	swal({title:"",text:"Enter valid password"});
   	    return false;
    }
    if(pass.length < 6 || pass.length > 16)
    {
    	swal({title:"",text:"Password must have minimum of 6 characters and maximum 16 characters"});
   	    return false;
    }
    
    $.LoadingOverlay("show");
    
    $.ajaxSetup({async:true});
	$.post("/clientValidateLogin", {txt_pan : ""+pan+"", txt_pass : ""+pass+"", authcode : ""+authcode+""}, function(data)
    {
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
   		if(obj.status == 400)
   		{
   			swal({title:"",text:obj.msg});
   			return false;
   		}
   		
   		if(authcode == "")
		{
   			var encrypted_text = obj.encrypted_text;
   			top.location = "https://mfportfolio.meetplutus.com/investor/portfolio-meet-plutus?id="+encrypted_text;
		}else
		{
			var goal_id = obj.status_msg;
			var goal_type = obj.msg;
			var userid = obj.userid;
			
			if(goal_type == "Goal Based Robo Advisor")
			{
				top.location = "https://mfportfolio.meetplutus.com/bse/bse-goal-based-sip-investment?userid="+userid+"&id="+goal_id;
			}else
			{
				top.location = "https://mfportfolio.meetplutus.com/bse/bse-robo-based-online-investment?userid="+userid+"&id="+goal_id;
			}
		}            
    }, "text");
}

$(document).ready(function(){
	
	//$('#proceed').delay(10000).show(0);  
	//$("#myModalNew").modal("show");
	
	var page = '${page}';
	authcode = '${authcode}';
	var login_msg = "${login_msg}";
	
	if(page == "signup")
	{
		showSignupPage();
	}
	
	if(page == "client-login")
	{
		showLoginPage();
	}
	
});

</script>

<!-- Modal -->
<div id="myModalNew" class="modal fade" role="dialog" style="z-index: 9999;">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
       <div class="modal-header">
        <button type="button" class="close" id="proceed" data-dismiss="modal" style="padding-left:6px; display: none;">&times;</button>
        <h4 class="modal-title"></h4>
      </div> 
      <div class="modal-body">
        <img src="/img/Plutus alert.webp" class="img-responsive" style="width:100%;" /> 
      </div>
	  <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
      </div> -->
    </div>

  </div>
</div>  