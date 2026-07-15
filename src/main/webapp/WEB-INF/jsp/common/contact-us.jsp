<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<script>
				function contactUs() {
					var name = $("#name").val();
					var email = $("#email").val();
					var mobile = $("#mobile").val();
					var message = $("#message").val();
					var subject = $("#subject").val();
					var country = $("#country").val();

					if (name == "") {
						swal({ title: "", text: "Please enter your name" });
						return false;
					}
					if (email == "") {
						swal({ title: "", text: "Please enter your email" });
						return false;
					}
					if (!validateEmail(email)) {
						swal({ title: "", text: "Please enter valid email" });
						return false;
					}
					if (mobile == "") {
						swal({ title: "", text: "Please enter phone number" });
						return false;
					}
					if (message == "") {
						swal({ title: "", text: "Please enter your message" });
						return false;
					}
					if (subject == "") {
						swal({ title: "", text: "Please enter your subject" });
						return false;
					}

					if (country == "") {
						swal({ title: "", text: "Please enter your country" });
						return false;
					}

					//$.LoadingOverlay("show");

					$.ajaxSetup({ async: true });
					$.post("/saveContactUs", { name: "" + name + "", email: "" + email + "", mobile: "" + mobile + "", subject: "" + subject + "", message: "" + message + "", country: "" + country + "" }, function (data) {
						//$.LoadingOverlay("hide");

						var result = $.trim(data);
						var obj = jQuery.parseJSON(result);
						if (obj.status == "200") {
							$("#name").val();
							$("#email").val();
							$("#mobile").val();
							$("#message").val();
							$("#subject").val();
							$("#country").val();

							swal({ title: "", text: "Thanks for contacting us. Soon we will get in touch with you!" });

						}
						else {
							swal({ title: "", text: obj.msg });
						}

					}, 'text');
				}
				function validateEmail(email) {
					var re = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
					if (re.test(email)) {
						return true;
					}
					else {
						return false;
					}
				}


			</script><style>
/* ── Clean Contact Us Page Styles (About Us Aesthetic) ─────────────────────────────── */

/* ── PAGE HERO (Removed inline styles, now using global .page-hero-curved) ── */

.about-label {
  display: inline-block;
  font-size: 12px;
  font-weight: 700;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: #009899;
  background: rgba(0, 152, 153, 0.1);
  padding: 8px 18px;
  border-radius: 50px;
  margin-bottom: 20px;
}

.about-intro-section h2 {
  font-size: 2.8rem;
  font-weight: 800;
  color: #1a1f2e;
  line-height: 1.3;
  margin-bottom: 20px;
}

.section-divider {
  width: 60px;
  height: 4px;
  background: #009899;
  margin: 20px auto 0;
  border-radius: 2px;
}

.contact-wrapper {
  background: #fff;
  padding: 80px 0;
  position: relative;
}

/* ── MV CARD STYLE (For Info Container & Map) ─────────────────────────────── */
.mv-card {
  background: #fff;
  border-radius: 20px;
  border: 1px solid #f0f0f0;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
  padding: 40px;
  height: 100%;
  transition: all 0.4s ease;
  position: relative;
  overflow: hidden;
  z-index: 1;
}

.mv-card::after {
  content: '';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: linear-gradient(135deg, rgba(0, 152, 153, 0.03) 0%, rgba(0, 133, 161, 0.03) 100%);
  z-index: -1;
  opacity: 0;
  transition: opacity 0.4s ease;
}

.mv-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 50px rgba(0, 152, 153, 0.12);
  border-color: rgba(0, 152, 153, 0.2);
}

.mv-card:hover::after {
  opacity: 1;
}

.mv-icon {
  width: 64px;
  height: 64px;
  border-radius: 16px;
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 24px;
  box-shadow: 0 8px 20px rgba(0, 152, 153, 0.3);
  flex-shrink: 0;
}

.mv-icon i {
  color: #fff;
  font-size: 26px;
}

/* ── FORM INPUTS ─────────────────────────────── */
.premium-input-group {
  margin-bottom: 24px;
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
  background: #f9fafb;
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
textarea.premium-input {
  min-height: 140px;
  resize: vertical;
}
.premium-btn {
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  color: #fff;
  border: none;
  border-radius: 12px;
  padding: 16px 32px;
  font-size: 16px;
  font-weight: 600;
  width: 100%;
  transition: all 0.3s ease;
  cursor: pointer;
  box-shadow: 0 10px 20px rgba(0, 152, 153, 0.2);
}
.premium-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 15px 25px rgba(0, 152, 153, 0.3);
}

/* ── INFO CARDS ─────────────────────────────── */
.info-item {
  display: flex;
  align-items: flex-start;
  margin-bottom: 30px;
}
.info-icon-wrapper {
  margin-right: 20px;
}
.info-content h3 {
  font-size: 1.25rem;
  font-weight: 700;
  color: #1a1f2e;
  margin-bottom: 8px;
}
.info-content p, .info-content a {
  color: #6b7280;
  font-size: 15px;
  line-height: 1.6;
  text-decoration: none;
  transition: color 0.3s ease;
}
.info-content a:hover {
  color: #009899;
}
.social-links {
  margin-top: 40px;
  display: flex;
  gap: 16px;
}
.social-link {
  width: 48px;
  height: 48px;
  background: #f3f4f6;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}
.social-link img {
  width: 24px;
  height: 24px;
  object-fit: contain;
}
.social-link:hover {
  background: #e5e7eb;
  transform: translateY(-3px);
}

/* ── MAP ─────────────────────────────── */
.map-section {
  padding: 0 0 100px;
  background: #fff;
}
.map-container {
  border-radius: 16px;
  overflow: hidden;
  height: 450px;
  border: 1px solid #f0f0f0;
}

@media (max-width: 991px) {
  .contact-form-side, .contact-info-side {
    padding: 30px;
  }
}
</style>

<!-- ── PAGE HERO ──────────────────────────────────────────────── -->
<div class="page-hero-curved">
  <div class="container text-center position-relative sr-section" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center sr-child">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Contact Us</li>
      </ol>
    </nav>
    <div class="text-center">
      <span class="category-label sr-child">Get in Touch</span>
      <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">How can we help you?</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<!-- ── CONTACT SECTION ──────────────────────────────────────────────── -->
<section class="contact-wrapper">
  <div class="container">
    <div class="row g-5">
      <!-- Form Side -->
      <div class="col-lg-7 sr-section">
        <div class="mv-card">
          <span class="about-label sr-child sr-from-top" style="background: rgba(0, 152, 153, 0.05);">Send a Message</span>
          <h3 class="sr-child sr-from-top" style="font-size: 1.5rem; font-weight: 700; color: #1a1f2e; margin-bottom: 24px;">How can we help you?</h3>
          
          <div class="row">
            <div class="col-md-6 premium-input-group sr-child sr-from-top">
              <label>Name</label>
              <input type="text" class="premium-input" placeholder="Your Name" id="name" name="name" required>
            </div>
            <div class="col-md-6 premium-input-group sr-child sr-from-top">
              <label>Email</label>
              <input type="email" class="premium-input" placeholder="Your Email" id="email" name="contact-email" required>
            </div>
            <div class="col-md-6 premium-input-group sr-child sr-from-top">
              <label>Whatsapp Mobile Number</label>
              <input type="number" class="premium-input" placeholder="Your Phone" id="mobile" name="contact-phone" required>
            </div>
            <div class="col-md-6 premium-input-group sr-child sr-from-top">
              <label>Country</label>
              <input type="text" class="premium-input" placeholder="Your Country" id="country" name="contact-country" required>
            </div>
            <div class="col-md-12 premium-input-group sr-child sr-from-top">
              <label>Subject</label>
              <select class="premium-input" id="subject" name="contact-subject" required>
                <option value="">Select a Subject</option>
                <option value="One to One Meeting">One to One Meeting</option>
                <option value="Mutual Fund">Mutual Fund</option>
                <option value="Health Insurance">Health Insurance</option>
                <option value="Life Insurance">Life Insurance</option>
                <option value="General Insurance">General Insurance</option>
                <option value="Others">Others</option>
              </select>
            </div>
            <div class="col-md-12 premium-input-group sr-child sr-from-top">
              <label>Message</label>
              <textarea class="premium-input" placeholder="Type your message here..." id="message" name="contact-message"></textarea>
            </div>
            <div class="col-md-12 mt-2 sr-child sr-from-top">
              <button class="premium-btn" type="button" onclick="contactUs()">Send Message</button>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Info Side -->
      <div class="col-lg-5 sr-section">
        <div class="mv-card">
          <span class="about-label sr-child sr-from-top" style="background: rgba(0, 152, 153, 0.05);">Contact Info</span>
          <h3 class="sr-child sr-from-top" style="font-size: 1.5rem; font-weight: 700; color: #1a1f2e; margin-bottom: 30px;">Reach our Team</h3>
          
          <div class="info-item">
            <div class="info-icon-wrapper sr-child sr-from-top">
              <div class="mv-icon" style="margin-bottom:0;"><i class="fas fa-map-marker-alt"></i></div>
            </div>
            <div class="info-content sr-child sr-from-top">
              <h3>Location</h3>
              <p class="mb-0">1/95, Post Office Road, Vettaikaraniruppu,<br>Nagapattinam, Tamilnadu - 611112</p>
            </div>
          </div>
          
          <div class="info-item mt-4">
            <div class="info-icon-wrapper sr-child sr-from-top">
              <div class="mv-icon" style="margin-bottom:0;"><i class="fas fa-phone-alt"></i></div>
            </div>
            <div class="info-content sr-child sr-from-top">
              <h3>Call Us</h3>
              <a href="tel:+917402515544" target="_blank" class="d-block">+91-74025 15544 (India)</a>
              <a href="tel:+918667847016" target="_blank" class="d-block">+91-86678 47016 (India)</a>
              <a href="tel:+966541180621" target="_blank" class="d-block">+966 54118 0621 (Saudi Arabia)</a>
            </div>
          </div>
          
          <div class="info-item mt-4">
            <div class="info-icon-wrapper sr-child sr-from-top">
              <div class="mv-icon" style="margin-bottom:0;"><i class="fas fa-envelope"></i></div>
            </div>
            <div class="info-content sr-child sr-from-top">
              <h3>Mail Us</h3>
              <a href="mailto:enquiry@adcapitalinvestment.com" target="_blank" class="d-block">enquiry@adcapitalinvestment.com</a>
              <a href="mailto:connect@adcapitalinvestment.com" target="_blank" class="d-block">connect@adcapitalinvestment.com</a>
              <a href="mailto:aravind@adcapitalinvestment.com" target="_blank" class="d-block">aravind@adcapitalinvestment.com</a>
              <a href="mailto:manikandan@adcapitalinvestment.com" target="_blank" class="d-block">manikandan@adcapitalinvestment.com</a>
            </div>
          </div>
          
          <div class="social-links">
            <a href="https://api.whatsapp.com/send?phone=8667847016" target="_blank" class="social-link sr-child sr-from-top" title="WhatsApp">
              <img src="/images/logo/whatsappnew.png" alt="WhatsApp">
            </a>
            <a href="https://www.youtube.com/@adcapitalinvestment" target="_blank" class="social-link sr-child sr-from-top" title="YouTube">
              <img src="/images/logo/youtube-original.png" alt="YouTube">
            </a>
            <a href="https://www.instagram.com/aravind__elangovan" target="_blank" class="social-link sr-child sr-from-top" title="Instagram">
              <img src="/images/logo/instagram-original.png" alt="Instagram">
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ── MAP SECTION ──────────────────────────────────────────────── -->
<section class="map-section sr-section no-reverse">
  <div class="container">
    <div class="mv-card" style="padding: 0; overflow: hidden;">
      <div class="row g-0 align-items-stretch">
        <!-- Left: Info Panel -->
        <div class="col-lg-5 col-md-5 d-flex flex-column justify-content-center" style="padding: 50px 40px;">
          <span class="about-label sr-child" style="background: rgba(0, 152, 153, 0.05); margin-bottom: 20px; width: fit-content;">Visit Us</span>
          <h3 class="sr-child" style="font-size: 1.8rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">Need Directions?</h3>
          <p class="sr-child" style="color: #6b7280; font-size: 15px; line-height: 1.8; margin-bottom: 32px;">Our office is conveniently located in Vettaikaraniruppu. Use the map to navigate to our headquarters, or reach out if you need assistance finding us.</p>
          <div class="sr-child">
            <a href="https://www.google.com/maps/dir/?api=1&destination=Post+Office+Vettaikaraniruppu+Nagapattinam" target="_blank"
               style="display: inline-flex; align-items: center; gap: 10px; border: 2px solid #009899; border-radius: 12px; padding: 14px 28px; font-size: 15px; font-weight: 600; color: #009899; text-decoration: none; transition: all 0.3s ease; background: #fff;"
               onmouseover="this.style.background='#009899'; this.style.color='#fff';"
               onmouseout="this.style.background='#fff'; this.style.color='#009899';">
              Get Directions <i class="fas fa-external-link-alt" style="font-size: 13px;"></i>
            </a>
          </div>
        </div>
        <!-- Right: Map -->
        <div class="col-lg-7 col-md-7 sr-child" style="min-height: 420px;">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6595.972857777248!2d79.8289928979533!3d10.580038258735886!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a5565241911c657%3A0x79567af41634f588!2sPost%20Office!5e0!3m2!1sen!2sin!4v1737549165627!5m2!1sen!2sin"
            width="100%" height="100%" style="border:0; display:block; min-height: 420px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
      </div>
    </div>
  </div>
</section>