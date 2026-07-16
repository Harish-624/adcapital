<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
/* ── Individual Service Page Styles (Template B) ─────────────────────────────── */
.svc-detail-hero {
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  padding: 80px 0 60px;
  position: relative;
  overflow: hidden;
}
.svc-detail-hero::before {
  content: ''; position: absolute; top: -80px; right: -80px;
  width: 400px; height: 400px;
  background: radial-gradient(circle, rgba(255,255,255,0.12) 0%, transparent 70%);
  border-radius: 50%;
}
.svc-detail-hero h1 { color:#fff; font-size:2.5rem; font-weight:700; }
.svc-detail-hero .breadcrumb-item,
.svc-detail-hero .breadcrumb-item a { color:rgba(255,255,255,0.75); font-size:14px; text-decoration:none; }
.svc-detail-hero .breadcrumb-item.active { color:#fff; font-weight:500; }
.svc-detail-hero .breadcrumb-item+.breadcrumb-item::before { color:rgba(255,255,255,0.5); }

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
.logo_items { display: inline-block; animation: 35s slides infinite linear; }
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
        <li class="breadcrumb-item active" aria-current="page">Life Insurance</li>
      </ol>
    </nav>
    <div class="text-center sr-section">
      <span class="category-label sr-child">Protection</span>
      <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Life Insurance</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<!-- ── SUB-NAVIGATION ──────────────────────────────────────────────── -->
<div class="service-pill-nav">
  <div class="container">
    <div class="d-flex flex-wrap justify-content-center gap-3 sr-reveal">
      <a href="/services/health-insurance" class="service-pill">Health Insurance</a>
      <a href="/services/life-insurance" class="service-pill active">Life Insurance</a>
      <a href="/services/vehicle-Insurance" class="service-pill">Vehicle Insurance</a>
      <a href="/services/business-insurance" class="service-pill">Business Insurance</a>
    </div>
  </div>
</div>

<!-- ── MAIN CONTENT ──────────────────────────────────────────────── -->
<section style="padding: 60px 0 20px;">
  <div class="container">
    
    <!-- Intro Row -->
    <div class="row align-items-center mb-5 pb-4 sr-section no-reverse">
      <div class="col-lg-5">
        <div class="about-image-stack sr-child">
          <div class="about-image-stack-teal"></div>
          <div class="about-image-stack-light"></div>
          <img src="/images/services/Life_Insurance.webp" class="img-fluid" alt="Life Insurance">
        </div>
      </div>
      <div class="col-lg-7">
        <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 24px;">What is Life insurance?</h2>
        <p class="sr-child" style="color: var(--text-muted); font-size: 16px; line-height: 1.8; margin-bottom: 24px;">
          Life insurance ensures your loved ones are financially secure in your absence. It helps replace lost income, pay off debts, cover daily expenses, and fund children's education, maintaining their standard of living.
        </p>
        <div class="sr-child" style="background: rgba(0, 152, 153, 0.05); border-left: 4px solid var(--brand-primary); padding: 20px; border-radius: 0 12px 12px 0;">
          <p style="color: var(--text-dark); font-size: 15px; line-height: 1.6; margin-bottom: 0; font-weight: 500; font-style: italic;">
            "We have provided Life insurance coverage worth over ₹102+ crores across India and globally."
          </p>
        </div>
      </div>
    </div>

    <!-- Benefits Section -->
    <div class="mb-5 sr-section">
      <h2 class="sr-child" style="font-size: 2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Why You Need Life Insurance</h2>
      <p class="sr-child" style="color: var(--text-muted); font-size: 16px; max-width: 600px;">Key advantages of securing a life insurance policy for you and your family.</p>
    </div>

    <div class="row g-4 mb-5 pb-4 sr-section">
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-users"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Protecting Your Family's Future</h4>
          <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">For families relying on your income, life insurance ensures they can continue to meet financial obligations and achieve long-term goals.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-credit-card"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Clearing Debts</h4>
          <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">It can help pay off debts and loans, such as credit card balances, personal loans, or a mortgage, so your loved ones are not burdened.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-briefcase"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Business Continuity</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">If you own a business, life insurance can help ensure continuity by providing funds for buy-sell agreements or funding business loans.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-percent"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Tax Advantages</h4>
          <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">The death benefit from a life insurance policy is generally income-tax-free to the beneficiary, providing a tax-efficient way to transfer wealth.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-heart"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Peace of Mind</h4>
          <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">Knowing that your loved ones will be financially protected and cared for in your absence can provide peace of mind and reduce stress.</p>
        </div>
      </div>
    </div>

    <!-- CTA Strip -->
    <div class="cta-strip sr-reveal">
      <div class="d-flex align-items-center justify-content-between flex-wrap gap-4">
        <div>
          <h3>Secure your family's future today</h3>
          <p>Get in touch with us to find the life insurance policy that best fits your needs.</p>
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
      <h3 style="font-size: 1.8rem; font-weight: 700; color: #1a1f2e;">Our <span style="color: #009899;">Life Insurance</span> Partners</h3>
    </div>
    <div class="logos sr-child">
      <div class="logo_items">
        <img src="/images/lifelogo/acko.webp">
        <img src="/images/lifelogo/aditya.webp">
        <img src="/images/lifelogo/Aviva-Logo.wine.webp">
        <img src="/images/lifelogo/bajaj-allianz.webp">
        <img src="/images/lifelogo/bandhan.webp">
        <img src="/images/lifelogo/Canara_HSBC_Life_Insurance.webp">
        <img src="/images/lifelogo/CreditAccess.webp">
        <img src="/images/lifelogo/digit-insurance.webp">
        <img src="/images/lifelogo/Future_Generali.webp">
        <img src="/images/lifelogo/hdfc.webp">
        <img src="/images/lifelogo/icici.webp">
        <img src="/images/lifelogo/india.webp">
        <img src="/images/lifelogo/LIC.webp">
        <img src="/images/lifelogo/max.webp">
        <img src="/images/lifelogo/pnblife.webp">
        <img src="/images/lifelogo/pramerica.webp">
        <img src="/images/lifelogo/sbi-life-insurance.webp">
        <img src="/images/lifelogo/shara.webp">
        <img src="/images/lifelogo/shriramlife.webp">
        <img src="/images/lifelogo/star-union.webp">
        <img src="/images/lifelogo/tataaig.webp">
      </div>
      <div class="logo_items">
        <img src="/images/lifelogo/acko.webp">
        <img src="/images/lifelogo/aditya.webp">
        <img src="/images/lifelogo/Aviva-Logo.wine.webp">
        <img src="/images/lifelogo/bajaj-allianz.webp">
        <img src="/images/lifelogo/bandhan.webp">
        <img src="/images/lifelogo/Canara_HSBC_Life_Insurance.webp">
        <img src="/images/lifelogo/CreditAccess.webp">
        <img src="/images/lifelogo/digit-insurance.webp">
        <img src="/images/lifelogo/Future_Generali.webp">
        <img src="/images/lifelogo/hdfc.webp">
        <img src="/images/lifelogo/icici.webp">
        <img src="/images/lifelogo/india.webp">
        <img src="/images/lifelogo/LIC.webp">
        <img src="/images/lifelogo/max.webp">
        <img src="/images/lifelogo/pnblife.webp">
        <img src="/images/lifelogo/pramerica.webp">
        <img src="/images/lifelogo/sbi-life-insurance.webp">
        <img src="/images/lifelogo/shara.webp">
        <img src="/images/lifelogo/shriramlife.webp">
        <img src="/images/lifelogo/star-union.webp">
        <img src="/images/lifelogo/tataaig.webp">
      </div>
    </div>
  </div>
</section>