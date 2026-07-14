<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
/* ── Forgot Password Premium Styles ─────────────────────────────── */
.auth-wrapper {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  position: relative;
  overflow: hidden;
  padding: 40px 20px;
}
.auth-wrapper::before {
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
.auth-wrapper::after {
  content: '';
  position: absolute;
  bottom: -100px;
  left: 10%;
  width: 300px;
  height: 300px;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.08) 0%, rgba(255, 255, 255, 0) 70%);
  border-radius: 50%;
}
.auth-card {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 24px;
  border: 1px solid rgba(255, 255, 255, 0.8);
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(20px);
  padding: 50px 40px;
  width: 100%;
  max-width: 450px;
  position: relative;
  z-index: 1;
  text-align: center;
}
.auth-title {
  font-size: 24px;
  font-weight: 700;
  color: #1a1f2e;
  margin-bottom: 10px;
}
.auth-subtitle {
  font-size: 14px;
  color: #6b7280;
  margin-bottom: 30px;
}
.premium-input-group {
  margin-bottom: 20px;
  text-align: left;
}
.premium-input-group label {
  font-size: 13px;
  font-weight: 600;
  color: #4b5563;
  margin-bottom: 8px;
  display: block;
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
.step-indicator {
  display: flex;
  justify-content: space-between;
  margin-bottom: 30px;
  position: relative;
}
.step-indicator::before {
  content: '';
  position: absolute;
  top: 14px;
  left: 10%;
  right: 10%;
  height: 2px;
  background: #e5e7eb;
  z-index: 0;
}
.step {
  position: relative;
  z-index: 1;
  background: #fff;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 12px;
  font-weight: 700;
  color: #9ca3af;
  border: 2px solid #e5e7eb;
}
.step.active {
  background: #009899;
  color: #fff;
  border-color: #009899;
}
.step-label {
  position: absolute;
  top: 35px;
  font-size: 10px;
  font-weight: 600;
  color: #6b7280;
  white-space: nowrap;
}
</style>

<div class="auth-wrapper">
  <div class="auth-card sr-reveal" data-sr-reveal-delay="0.1s">
    <h2 class="auth-title">Reset Password</h2>
    <p class="auth-subtitle">Create a new password for your account</p>
    
    <div class="step-indicator">
      <div class="step active">1<div class="step-label">Identify</div></div>
      <div class="step active">2<div class="step-label">New Password</div></div>
      <div class="step">3<div class="step-label">Verify Code</div></div>
    </div>

    <div class="premium-input-group">
      <label>User ID</label>
      <input type="text" id="txt_pan" name="txt_pan" class="premium-input" placeholder="Enter your User ID" maxlength="10" required autofocus>
    </div>

    <div class="premium-input-group">
      <label>New Password</label>
      <input type="password" id="txt_pass" name="txt_pass" class="premium-input" placeholder="Enter your New Password" maxlength="16" required>
    </div>
    
    <div class="premium-input-group">
      <label>Confirm Password</label>
      <input type="password" id="txt_confirm_pass" name="txt_confirm_pass" class="premium-input" placeholder="Confirm your New Password" maxlength="16" required>
    </div>

    <button id="btn-submit" class="premium-btn" type="submit" onclick="validateLogin()">Change Password</button>
    
    <div class="mt-4">
      <a href="/client-login" style="color:#009899; font-size:14px; font-weight:500; text-decoration:none;"><i class="fa fa-arrow-left"></i> Back to Login</a>
    </div>
  </div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
<div class="modal-dialog">
<div class="modal-content">
      <div class="modal-header">
		<h6 class="modal-title">Forgot Password Verification</h6>
      </div>
	<div class="modal-body">
		<div class="form-group">
              <label>Enter the verification code</label>
              <input class="form-control" id="txt_verify_code">
              <p>We have sent you a verification code on your email id.</p>
              </div>
              <div>
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

<style type="text/css">
#login_modal_alert{
	display:none;
}
/* Modal Styling Improvements */
#myModal .modal-content {
  border-radius: 16px;
  border: none;
  box-shadow: 0 15px 35px rgba(0,0,0,0.2);
}
#myModal .modal-header {
  border-bottom: 1px solid #e5e7eb;
  padding: 20px;
}
#myModal .modal-title {
  font-weight: 600;
  color: #1a1f2e;
}
#myModal .modal-body {
  padding: 20px;
}
#myModal .form-control {
  border-radius: 8px;
  border: 1px solid #e5e7eb;
  padding: 10px 15px;
}
#myModal .form-control:focus {
  border-color: #009899;
  box-shadow: 0 0 0 3px rgba(0, 152, 153, 0.1);
}
#myModal .btn-primary {
  background: #009899;
  border: none;
  border-radius: 8px;
}
#myModal .btn-primary:hover {
  background: #0085A1;
}
#myModal .btn-danger {
  border-radius: 8px;
}
</style>

<script type="text/javascript">
var pan = "";
var pass = "";

function validateLogin()
{
	pan = $("#txt_pan").val();
	pass = $("#txt_pass").val();
	var confirm_pass = $("#txt_confirm_pass").val();

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
    if(confirm_pass == "")
    {
   		swal({title:"",text:"Enter valid confirm password"});
   	    return false;
    }
    if(pass != confirm_pass)
    {
   	 	swal({title:"",text:"Enter valid new password and confirm password"});
   	    return false;
    }
    
    $.LoadingOverlay("show");
    
    $.ajaxSetup({async:true});
	$.post("/clientValidateForgotPassword", {txt_pan : pan, txt_pass : pass}, function(data)
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
			$("#login_modal_alert").show().fadeOut(5000);
			$("#login_modal_msg").html(obj.msg);
		}
		
    }, "text");
}

function validateCode()
{
	var verify_code = $("#txt_verify_code").val();
	verify_code = $.trim(verify_code);
	
	if(verify_code == "")
    {
    	$("#login_modal_alert").show().fadeOut(5000);
		$("#login_modal_msg").html("Enter valid code");
    	return;
    }
    
	$.ajaxSetup({async:true});
	$.post("/clientValidateVerificationCode", {txt_pan : pan, txt_pass : pass, code : verify_code}, function(data)
    {
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);

		if(obj.status == 200)
		{
			$("#txt_pan").val("");
			$("#txt_pass").val("");
			$("#txt_verify_code").val("");
			$("#login_modal_alert").removeClass("alert-danger").addClass("alert-success");
			$("#login_modal_alert").show();
			$("#login_modal_alert").html("Your password is changed successfully. <a href='/client-login' class='alert-link'>Click here to login.</a>");
		}
		else
		{
			$("#login_modal_alert").show().fadeOut(5000);
			$("#login_modal_msg").html(obj.msg);
		}		
    }, "text");
}

</script>