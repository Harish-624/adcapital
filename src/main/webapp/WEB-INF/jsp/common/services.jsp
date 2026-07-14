<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
/* ── Services Page Styles ─────────────────────────────── */
/* ── PAGE HERO (Removed inline styles, now using global .page-hero-curved) ── */

.about-label {
  display: inline-block;
  font-size: 12px; font-weight: 700; letter-spacing: 0.1em;
  text-transform: uppercase; color: #009899;
  background: rgba(0,152,153,0.1);
  padding: 8px 18px; border-radius: 50px; margin-bottom: 20px;
}

/* ── SERVICE CARDS ─────────────────────────────── */
.services-section { background: #fff; padding: 80px 0; }

.svc-card {
  background: #fff;
  border-radius: 20px;
  border: 1px solid #f0f0f0;
  box-shadow: 0 10px 30px rgba(0,0,0,0.04);
  padding: 36px 32px;
  height: 100%;
  transition: all 0.4s ease;
  position: relative;
  overflow: hidden;
  z-index: 1;
}
.svc-card::after {
  content: '';
  position: absolute; inset: 0;
  background: linear-gradient(135deg, rgba(0,152,153,0.03) 0%, rgba(0,133,161,0.03) 100%);
  z-index: -1; opacity: 0;
  transition: opacity 0.4s ease;
}
.svc-card:hover { transform: translateY(-8px); box-shadow: 0 20px 50px rgba(0,152,153,0.12); border-color: rgba(0,152,153,0.2); }
.svc-card:hover::after { opacity: 1; }

.svc-icon {
  width: 64px; height: 64px; border-radius: 16px;
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  display: flex; align-items: center; justify-content: center;
  margin-bottom: 24px;
  box-shadow: 0 8px 20px rgba(0,152,153,0.3);
}
.svc-icon i { color: #fff; font-size: 26px; }

.svc-card h4 { font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px; }
.svc-card p { color: #6b7280; font-size: 14px; line-height: 1.7; margin-bottom: 20px; flex-grow: 1; }
.svc-link {
  display: inline-flex; align-items: center; gap: 8px;
  color: #009899; font-size: 14px; font-weight: 600;
  text-decoration: none; border-bottom: 1px solid transparent;
  transition: border-color 0.3s ease;
}
.svc-link:hover { border-color: #009899; color: #009899; }
.svc-card-inner { display: flex; flex-direction: column; height: 100%; }

/* ── CTA STRIP ─────────────────────────────── */
.cta-strip {
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  border-radius: 20px;
  padding: 60px 50px;
  margin: 0 0 80px;
  position: relative;
  overflow: hidden;
}
.cta-strip::before {
  content: '';
  position: absolute; top: -60px; right: -60px;
  width: 280px; height: 280px;
  background: radial-gradient(circle, rgba(255,255,255,0.12) 0%, transparent 70%);
  border-radius: 50%;
}
.cta-strip h3 { color:#fff; font-size:1.8rem; font-weight:700; margin-bottom:12px; }
.cta-strip p { color:rgba(255,255,255,0.85); font-size:16px; margin-bottom:0; }
.cta-btn {
  background:#fff; color:#009899; border:none;
  border-radius:12px; padding:16px 36px;
  font-size:15px; font-weight:700; text-decoration:none;
  transition: all 0.3s ease;
  display: inline-block;
  white-space: nowrap;
}
.cta-btn:hover { transform:translateY(-3px); box-shadow:0 12px 25px rgba(0,0,0,0.2); color:#009899; }

@media (max-width:768px) {
  .cta-strip { padding:40px 28px; text-align:center; }
  .cta-strip .d-flex { flex-direction:column; gap:24px; align-items:center !important; }
  .cta-btn { width:100%; text-align:center; }
}
</style>

<!-- ── PAGE HERO ──────────────────────────────────────────────── -->
<div class="page-hero-curved">
  <div class="container text-center position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center sr-reveal">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Services</li>
      </ol>
    </nav>
    <div class="text-center sr-section">
      <span class="category-label sr-child">Our Offerings</span>
      <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Our Services</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<!-- ── SECTION INTRO ──────────────────────────────────────────────── -->
<section style="padding: 80px 0 20px; background: #fff;">
  <div class="container text-center sr-section">
    <span class="about-label sr-child">What We Offer</span>
    <h2 class="sr-child" style="font-size:2.8rem; font-weight:800; color:#1a1f2e;">Services Built for Your Financial Growth</h2>
    <div class="sr-child" style="width:60px; height:4px; background:#009899; margin:20px auto 0; border-radius:2px;"></div>
    <p class="sr-child" style="color:#6b7280; font-size:16px; max-width:600px; margin:24px auto 0; line-height:1.8;">We provide a comprehensive range of financial, investment, and insurance solutions tailored to individuals, businesses, and NRI clients.</p>
  </div>
</section>

<!-- ── SERVICES GRID ──────────────────────────────────────────────── -->
<section class="services-section">
  <div class="container">
    <div class="row g-4 sr-section">

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-piggy-bank"></i></div>
            <h4>Mutual Fund</h4>
            <p>Investment vehicles that pool money from multiple investors to invest in a diversified portfolio of stocks, bonds, and other assets managed by professionals.</p>
            <a href="/services/mutual-fund" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-briefcase-medical"></i></div>
            <h4>Life Insurance</h4>
            <p>Financial security for your loved ones. Life insurance provides a safety net for your family in the event of your passing, ensuring their future is protected.</p>
            <a href="/services/life-insurance" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-notes-medical"></i></div>
            <h4>Health Insurance</h4>
            <p>Access to quality medical care with comprehensive health insurance. Covers hospital stays, doctor visits, and medical expenses across a network of providers.</p>
            <a href="/services/health-insurance" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-house-damage"></i></div>
            <h4>General Insurance</h4>
            <p>Financial protection against a wide range of risks, including damage to property, assets, and liability. Covers various sectors and geographic regions.</p>
            <a href="/services/general-insurance" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-car-crash"></i></div>
            <h4>Vehicle Insurance</h4>
            <p>Vehicle insurance is a contract between the owner and an insurance company providing financial protection against accidents, theft, and third-party liability.</p>
            <a href="/services/vehicle-Insurance" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-chart-line"></i></div>
            <h4>Bond's</h4>
            <p>Treasury Bonds, Government Securities, and Corporate Bonds — safe, reliable investment instruments backed by government credit and institutional ratings.</p>
            <a href="/services/bonds" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-file-invoice-dollar"></i></div>
            <h4>Loan</h4>
            <p>A sum of money borrowed with an agreement to repay over time with interest. We help you find the right loan products aligned with your financial capacity.</p>
            <a href="/services/loans" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-layer-group"></i></div>
            <h4>PMS</h4>
            <p>Portfolio Management Services managed by professional portfolio managers, providing customized investment strategies and real-time portfolio monitoring.</p>
            <a href="/services/portfolio-management-schemes" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-id-card"></i></div>
            <h4>PAN Services</h4>
            <p>Assistance with Permanent Account Number applications and updates — an essential identifier issued by the Income Tax Department of India for all taxpayers.</p>
            <a href="/services/pan-services" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-file-alt"></i></div>
            <h4>Income Tax Returns</h4>
            <p>Filing income tax returns is a legal obligation and a financial management essential. We ensure compliance, accuracy, and timely submissions for all profiles.</p>
            <a href="/services/incometax-returns-filing" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-credit-card"></i></div>
            <h4>Credit Card</h4>
            <p>A gateway to financial flexibility, rewards, and security. We help you choose the right credit card products matching your spending habits and reward preferences.</p>
            <a href="/services/credit-card" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 sr-child">
        <div class="svc-card">
          <div class="svc-card-inner">
            <div class="svc-icon"><i class="fas fa-sync-alt"></i></div>
            <h4>Insurance Renewal</h4>
            <p>Seamless renewal of Life Insurance and Non-Life Insurance accounts. Stay covered without interruption — we handle the paperwork so you don't have to.</p>
            <a href="/services/insurance-renewal" class="svc-link">Explore Service <i class="fas fa-arrow-right fa-sm"></i></a>
          </div>
        </div>
      </div>

    </div>

    <!-- CTA Strip -->
    <div class="cta-strip mt-5 sr-reveal">
      <div class="d-flex align-items-center justify-content-between flex-wrap gap-4">
        <div>
          <h3>Ready to accelerate your financial growth?</h3>
          <p>Speak with our expert advisors and find the right plan for your goals.</p>
        </div>
        <a href="/contactus" class="cta-btn">Get in Touch</a>
      </div>
    </div>

  </div>
</section>