<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>

.about-label {
  display: inline-block; font-size: 12px; font-weight: 700; letter-spacing: 0.1em;
  text-transform: uppercase; color: #009899; background: rgba(0,152,153,0.1);
  padding: 8px 18px; border-radius: 50px; margin-bottom: 20px;
}

/* ── 3D IMAGE EFFECT ─────────────────────────────── */
.about-image-wrapper { position: relative; display: inline-block; padding: 20px; }
.about-image-backing {
  position: absolute; inset: 0;
  background: linear-gradient(135deg, rgba(0, 152, 153, 0.1) 0%, rgba(0, 133, 161, 0.05) 100%);
  border-radius: 24px; transform: rotate(-3deg); z-index: 0;
  transition: transform 0.5s ease;
}
.about-image-wrapper:hover .about-image-backing { transform: rotate(-5deg) scale(1.02); }
.about-image-wrapper img {
  position: relative; z-index: 1; border-radius: 20px;
  box-shadow: 0 20px 40px rgba(0,0,0,0.08); transition: transform 0.5s ease;
}
.about-image-wrapper:hover img { transform: translateY(-5px); }

/* ── CONTENT CARDS ─────────────────────────────── */
.mv-card {
  background: #fff; border-radius: 20px; border: 1px solid #f0f0f0;
  box-shadow: 0 10px 30px rgba(0,0,0,0.04); padding: 36px 32px;
  height: 100%; transition: all 0.4s ease; position: relative; z-index: 0;
}
.row-cards .mv-card { height: 100%; }
.mv-card::after {
  content: ''; position: absolute; inset: 0;
  background: linear-gradient(135deg, rgba(0,152,153,0.03) 0%, rgba(0,133,161,0.03) 100%);
  z-index: -1; opacity: 0; transition: opacity 0.4s ease;
}
.mv-card:hover { transform: translateY(-5px); box-shadow: 0 20px 50px rgba(0,152,153,0.12); border-color: rgba(0,152,153,0.2); }
.mv-card:hover::after { opacity: 1; }

.mv-icon {
  width: 56px; height: 56px; border-radius: 14px;
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  display: flex; align-items: center; justify-content: center; margin-bottom: 20px;
  box-shadow: 0 8px 20px rgba(0,152,153,0.3); color: #fff; font-size: 24px;
}

/* ── LISTS ─────────────────────────────── */
.content-list { list-style: none; padding: 0; margin: 0; }
.content-list li {
  position: relative; padding-left: 30px; margin-bottom: 16px; color: #6b7280; line-height: 1.7; font-size: 15px;
}
.content-list li::before {
  content: '\f00c'; font-family: 'Font Awesome 5 Free'; font-weight: 900;
  position: absolute; left: 0; top: 2px; color: #009899; font-size: 14px;
}

/* ── CTA STRIP ─────────────────────────────── */
.cta-strip {
  background: linear-gradient(135deg, #009899 0%, #00778c 100%);
  border-radius: 24px; padding: 50px 60px; position: relative; overflow: hidden; z-index: 1;
  box-shadow: 0 20px 40px rgba(0,152,153,0.15);
}
.cta-strip::before {
  content: ''; position: absolute; top: -80px; right: -40px; width: 300px; height: 300px;
  background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%); border-radius: 50%;
}
.cta-strip h3 { color:#fff; font-size:1.9rem; font-weight:700; margin-bottom:12px; }
.cta-strip p { color:rgba(255,255,255,0.9); font-size:16px; margin-bottom:0; line-height:1.6; }
.cta-btn {
  background:#fff; color:#009899; border:none; border-radius:14px; padding:16px 40px;
  font-size:15px; font-weight:700; text-decoration:none; transition: all 0.3s ease; display: inline-block; white-space: nowrap;
}
.cta-btn:hover { transform:translateY(-3px); box-shadow:0 12px 25px rgba(0,0,0,0.15); color:#00778c; }

@media (max-width:768px) {
  .cta-strip { padding:40px 30px; text-align:center; }
  .cta-strip .d-flex { flex-direction:column; gap:24px; align-items:center !important; }
  .cta-btn { width:100%; text-align:center; }
  .about-image-wrapper { margin-bottom: 40px; }
}

/* ── PARTNERS MARQUEE ─────────────────────────────── */
@keyframes slides { from { transform: translateX(0); } to { transform: translateX(-100%); } }
.logos { overflow: hidden; padding: 40px 0px; white-space: nowrap; position: relative; }
.logos:before, .logos:after { position: absolute; top: 0; content: ''; width: 250px; height: 100%; z-index: 2; }
.logos:before { left: 0; background: linear-gradient(to right, #fff, transparent); }
.logos:after { right: 0; background: linear-gradient(to left, #fff, transparent); }
.logo_items { display: inline-block; animation: 25s slides infinite linear; }
.logos:hover .logo_items { animation-play-state: paused; }
.logo_items img { height: 60px; margin: 0 30px; filter: grayscale(100%) opacity(0.7); transition: all 0.3s ease; }
.logo_items img:hover { filter: grayscale(0%) opacity(1); }
</style>

<!-- ── PAGE HERO ──────────────────────────────────────────────── -->
<div class="page-hero-curved">
  <div class="container position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center sr-reveal">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="/services">Services</a></li>
        <li class="breadcrumb-item active" aria-current="page">Health Insurance</li>
      </ol>
    </nav>
    <div class="text-center sr-section">
      <span class="category-label sr-child">Protection</span>
      <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Health Insurance</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<!-- ── SUB-NAVIGATION ──────────────────────────────────────────────── -->
<div class="service-pill-nav">
  <div class="container">
    <div class="d-flex flex-wrap justify-content-center gap-3 sr-reveal">
      <a href="/services/health-insurance" class="service-pill active">Health Insurance</a>
      <a href="/services/life-insurance" class="service-pill">Life Insurance</a>
      <a href="/services/vehicle-Insurance" class="service-pill">Vehicle Insurance</a>
      <a href="/services/business-insurance" class="service-pill">Business Insurance</a>
    </div>
  </div>
</div>

<!-- ── MAIN CONTENT ──────────────────────────────────────────────── -->
<section style="padding: 60px 0 20px;">
  <div class="container">
    
    <!-- Intro Row -->
    <div class="row align-items-center mb-5 pb-5 sr-section no-reverse">
      <div class="col-lg-5 mb-5 mb-lg-0">
        <div class="about-image-stack w-100 text-center sr-child">
          <div class="about-image-stack-teal"></div>
          <div class="about-image-stack-light"></div>
          <img src="/images/services/health-insurance.webp" class="img-fluid" alt="Health Insurance">
        </div>
      </div>
      <div class="col-lg-6 offset-lg-1">
        <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 24px;">Complete Medical Security</h2>
        
        <h4 class="sr-child" style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Access to Medical Care</h4>
        <p class="sr-child" style="color: var(--text-muted); font-size: 15.5px; line-height: 1.8; margin-bottom: 24px;">
          Health insurance ensures you have access to a wide network of healthcare providers, enabling timely and essential medical care. This includes preventive services, early detection, and effective treatment, promoting overall well-being and peace of mind.
        </p>

        <h4 class="sr-child" style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Financial Protection</h4>
        <p class="sr-child" style="color: var(--text-muted); font-size: 15.5px; line-height: 1.8; margin-bottom: 30px;">
          In India, medical inflation is projected to be 14%, meaning medical costs could double within five years. Health insurance offers essential financial protection by covering significant medical expenses, particularly for major illnesses or surgeries.
        </p>
        
        <div class="sr-child" style="background: #f8fafb; border-left: 4px solid var(--brand-primary); padding: 24px; border-radius: 0 16px 16px 0; box-shadow: 0 4px 15px rgba(0,0,0,0.02);">
          <p style="color: var(--text-dark); font-size: 15.5px; line-height: 1.7; margin-bottom: 0; font-weight: 500; font-style: italic;">
            "We have provided health insurance coverage worth over ₹80+ crores across India and globally."
          </p>
        </div>
      </div>
    </div>

    <!-- What to look for Section -->
    <div class="row mb-5 pb-4 align-items-start sr-section">
      <div class="col-lg-12">
        <div class="premium-card p-md-5">
          <div class="row align-items-center">
            <div class="col-lg-5 mb-4 mb-lg-0">
              <span class="about-label sr-child">Checklist</span>
              <h3 class="sr-child" style="font-size: 1.8rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">Key Points to Consider</h3>
              <p class="sr-child" style="color: #6b7280; font-size: 15px; line-height: 1.8; margin-bottom: 0;">
                While taking health insurance, you need to ensure your policy covers all essential bases for maximum security and ease of claims. We guide you through selecting policies that meet these critical criteria.
              </p>
            </div>
            <div class="col-lg-6 offset-lg-1 sr-child">
              <div class="row">
                <div class="col-sm-6">
                  <ul class="content-list">
                    <li>Must be an industry leader</li>
                    <li>Extensive network coverage</li>
                    <li>High claim settlement ratio</li>
                    <li>High claim incurred ratio</li>
                    <li>No sub-limit for diseases</li>
                  </ul>
                </div>
                <div class="col-sm-6">
                  <ul class="content-list">
                    <li>No limit for rooms / ICU</li>
                    <li>Unlimited restoration</li>
                    <li>Pre & post hospitalization</li>
                    <li>Low Co-payment & Deductibles</li>
                    <li>Clear Waiting Period terms</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- CTA Strip -->
    <div class="cta-strip sr-reveal">
      <div class="d-flex align-items-center justify-content-between flex-wrap gap-4">
        <div>
          <h3>Protect your health and wealth</h3>
          <p>Contact our experts to find the perfect health insurance plan for you and your family.</p>
        </div>
        <a href="/contactus" class="cta-btn">Contact Us</a>
      </div>
    </div>

  </div>
</section>

<!-- ── PARTNERS SECTION ──────────────────────────────────────────────── -->
<section style="background: #fafafa; padding: 60px 0; border-top: 1px solid #f0f0f0;">
  <div class="container sr-section">
    <div class="text-center mb-4 sr-child">
      <h3 style="font-size: 1.8rem; font-weight: 700; color: #1a1f2e;">Our <span style="color: #009899;">Health Insurance</span> Partners</h3>
    </div>
    <div class="logos sr-child">
      <div class="logo_items">
        <img src="/images/healthlogo/aditya-life.jpg">
        <img src="/images/healthlogo/Care_health_insurance_logo.png">
        <img src="/images/healthlogo/cigna-health-insurance.webp">
        <img src="/images/healthlogo/galaxy.png">
        <img src="/images/healthlogo/narayana.jpg">
        <img src="/images/healthlogo/niva.png">
        <img src="/images/healthlogo/star-health-insurance.webp">
      </div>
      <div class="logo_items">
        <img src="/images/healthlogo/aditya-life.jpg">
        <img src="/images/healthlogo/Care_health_insurance_logo.png">
        <img src="/images/healthlogo/cigna-health-insurance.webp">
        <img src="/images/healthlogo/galaxy.png">
        <img src="/images/healthlogo/narayana.jpg">
        <img src="/images/healthlogo/niva.png">
        <img src="/images/healthlogo/star-health-insurance.webp">
      </div>
      <div class="logo_items">
        <img src="/images/healthlogo/aditya-life.jpg">
        <img src="/images/healthlogo/Care_health_insurance_logo.png">
        <img src="/images/healthlogo/cigna-health-insurance.webp">
        <img src="/images/healthlogo/galaxy.png">
        <img src="/images/healthlogo/narayana.jpg">
        <img src="/images/healthlogo/niva.png">
        <img src="/images/healthlogo/star-health-insurance.webp">
      </div>
    </div>
  </div>
</section>