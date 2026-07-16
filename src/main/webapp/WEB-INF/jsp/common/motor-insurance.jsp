<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
/* ── Individual Service Page Styles (Template B) ─────────────────────────────── */
/* ── PAGE HERO (Removed inline styles, now using global .page-hero-curved) ── */

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

/* ── CTA STRIP ─────────────────────────────── */
.cta-strip {
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  border-radius: 20px; padding: 60px 50px; position: relative; overflow: hidden; z-index: 1;
}
.cta-strip::before {
  content: ''; position: absolute; top: -60px; right: -60px; width: 280px; height: 280px;
  background: radial-gradient(circle, rgba(255,255,255,0.12) 0%, transparent 70%); border-radius: 50%;
}
.cta-strip h3 { color:#fff; font-size:1.8rem; font-weight:700; margin-bottom:12px; }
.cta-strip p { color:rgba(255,255,255,0.85); font-size:16px; margin-bottom:0; }
.cta-btn {
  background:#fff; color:#009899; border:none; border-radius:12px; padding:16px 36px;
  font-size:15px; font-weight:700; text-decoration:none; transition: all 0.3s ease; display: inline-block; white-space: nowrap;
}
.cta-btn:hover { transform:translateY(-3px); box-shadow:0 12px 25px rgba(0,0,0,0.2); color:#009899; }

@media (max-width:768px) {
  .cta-strip { padding:40px 28px; text-align:center; }
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
  <div class="container text-center position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center sr-reveal" data-sr-reveal-delay="0.2s">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="/services">Services</a></li>
        <li class="breadcrumb-item active" aria-current="page">Vehicle Insurance</li>
      </ol>
    </nav>
    <div class="text-center">
      <span class="category-label sr-reveal" data-sr-reveal-delay="0.1s">Protection</span>
      <h1 class="sr-reveal mt-2 mb-0" data-sr-reveal-delay="0.1s" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Vehicle Insurance</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<!-- ── SUB-NAVIGATION ──────────────────────────────────────────────── -->
<div style="background: rgba(0,152,153,0.03); padding: 20px 0; border-bottom: 1px solid rgba(0,152,153,0.1);">
  <div class="container">
    <div class="d-flex flex-wrap justify-content-center gap-3 sr-reveal fadeIn" data-sr-reveal-delay="0.1s">
      <a href="/services/health-insurance" class="btn" style="background: #fff; color: #6b7280; border-radius: 50px; padding: 8px 24px; font-weight: 500; font-size: 14px; border: 1px solid #e5e7eb; transition: all 0.3s;">Health Insurance</a>
      <a href="/services/life-insurance" class="btn" style="background: #fff; color: #6b7280; border-radius: 50px; padding: 8px 24px; font-weight: 500; font-size: 14px; border: 1px solid #e5e7eb; transition: all 0.3s;">Life Insurance</a>
      <a href="/services/vehicle-Insurance" class="btn" style="background: #009899; color: #fff; border-radius: 50px; padding: 8px 24px; font-weight: 500; font-size: 14px; border: 1px solid #009899; box-shadow: 0 4px 12px rgba(0,152,153,0.2);">Vehicle Insurance</a>
      <a href="/services/business-insurance" class="btn" style="background: #fff; color: #6b7280; border-radius: 50px; padding: 8px 24px; font-weight: 500; font-size: 14px; border: 1px solid #e5e7eb; transition: all 0.3s;">Business Insurance</a>
    </div>
  </div>
</div>

<!-- ── MAIN CONTENT ──────────────────────────────────────────────── -->
<section style="padding: 80px 0 20px; background: #fff;">
  <div class="container">
    
    <!-- Intro Row -->
    <div class="row align-items-center mb-5 pb-4 sr-section no-reverse">
      <div class="col-lg-5" style="margin-top: -20px;">
        <div class="about-image-stack sr-child">
          <div class="about-image-stack-teal"></div>
          <div class="about-image-stack-light"></div>
          <img src="/images/services/Vehicle_Insurance.webp" class="img-fluid" alt="Vehicle Insurance">
        </div>
      </div>
      <div class="col-lg-7">
        <span class="about-label sr-child">Overview</span>
        <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 24px;">Financial Protection on the Road</h2>
        <p class="sr-child" style="color: #6b7280; font-size: 16px; line-height: 1.8; margin-bottom: 20px;">
          Vehicle insurance, also known as auto insurance or car insurance, is a contract between the vehicle owner and an insurance company that provides financial protection against losses or damages resulting from accidents, theft, and other incidents involving the insured vehicle.
        </p>
        <p class="sr-child" style="color: #6b7280; font-size: 16px; line-height: 1.8; margin-bottom: 20px;">
          Vehicle insurance policies are typically paid through premiums, which are based on factors such as the driver's age, driving history, location, type of vehicle, and coverage limits.
        </p>
        <div class="sr-child" style="background: rgba(0, 152, 153, 0.05); border-left: 4px solid #009899; padding: 20px; border-radius: 0 12px 12px 0;">
          <p style="color: #1a1f2e; font-size: 15px; line-height: 1.7; margin-bottom: 0; font-weight: 500;">
            <i class="fas fa-info-circle" style="color: #009899; margin-right: 8px;"></i>
            Having vehicle insurance is not only a legal requirement in many jurisdictions but also provides peace of mind and financial protection in case of accidents or unforeseen events.
          </p>
        </div>
      </div>
    </div>

    <!-- Types of Coverage -->
    <div class="text-center mb-5 sr-section">
      <span class="about-label sr-child">Coverages</span>
      <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">Types of Coverage</h2>
      <p class="sr-child" style="color: #6b7280; font-size: 16px; max-width: 600px; margin: 0 auto;">Understanding the different components of a vehicle insurance policy to ensure complete protection.</p>
    </div>

    <div class="row row-cards g-4 mb-5 pb-4 sr-section">
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-car-crash"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Liability Coverage</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">The most basic type of coverage required by law. It covers the costs of injury or damage to other people or their property if you are at fault.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-user-injured"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Bodily Injury Liability</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Covers medical expenses, lost wages, and legal fees for injuries caused to others in an accident.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-house-damage"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Property Damage Liability</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Covers the cost of repairing or replacing another person's property damaged in an accident caused by the insured driver.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-car"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Collision Coverage</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Pays for damages to the insured vehicle resulting from a collision with another vehicle or object, regardless of fault.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-shield-alt"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Comprehensive Coverage</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Covers damages caused by events other than collisions, such as theft, vandalism, natural disasters, fire, and falling objects.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-plus-square"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Personal Injury Protection</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Covers medical expenses and potentially lost wages for the driver and passengers in the insured vehicle, regardless of fault.</p>
        </div>
      </div>
    </div>

    <!-- CTA Strip -->
    <div class="cta-strip sr-reveal">
      <div class="d-flex align-items-center justify-content-between flex-wrap gap-4">
        <div>
          <h3>Ensure complete protection on the road</h3>
          <p>Contact our experts to find the right vehicle insurance coverage for your specific needs.</p>
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
      <h3 style="font-size: 1.8rem; font-weight: 700; color: #1a1f2e;">Our <span style="color: #009899;">Vehicle Insurance</span> Partners</h3>
    </div>
    <div class="logos sr-child">
      <div class="logo_items">
        <img src="/images/generallogo/ergo.png">
        <img src="/images/generallogo/Future_Generali.jpg">
        <img src="/images/generallogo/icicilamboard.png">
        <img src="/images/generallogo/IFFCO.png">
        <img src="/images/generallogo/liberty-general.png">
        <img src="/images/generallogo/Magmalogo.png">
        <img src="/images/generallogo/national-insurance.png">
        <img src="/images/generallogo/Navi_New_Logo.png">
        <img src="/images/generallogo/reliance-general-insurance.png">
        <img src="/images/generallogo/royalsundram.png">
        <img src="/images/generallogo/sbigeneral.png">
        <img src="/images/generallogo/shriram-general-insurance.png">
        <img src="/images/generallogo/tata-aig.png">
        <img src="/images/generallogo/universal sompo general insurance.jpg">
        <img src="/images/generallogo/Zurich-Kotak-Logo.png">
      </div>
      <div class="logo_items">
        <img src="/images/generallogo/ergo.png">
        <img src="/images/generallogo/Future_Generali.jpg">
        <img src="/images/generallogo/icicilamboard.png">
        <img src="/images/generallogo/IFFCO.png">
        <img src="/images/generallogo/liberty-general.png">
        <img src="/images/generallogo/Magmalogo.png">
        <img src="/images/generallogo/national-insurance.png">
        <img src="/images/generallogo/Navi_New_Logo.png">
        <img src="/images/generallogo/reliance-general-insurance.png">
        <img src="/images/generallogo/royalsundram.png">
        <img src="/images/generallogo/sbigeneral.png">
        <img src="/images/generallogo/shriram-general-insurance.png">
        <img src="/images/generallogo/tata-aig.png">
        <img src="/images/generallogo/universal sompo general insurance.jpg">
        <img src="/images/generallogo/Zurich-Kotak-Logo.png">
      </div>
    </div>
  </div>
</section>