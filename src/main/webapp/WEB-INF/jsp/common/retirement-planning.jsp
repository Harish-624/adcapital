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
</style>

<!-- ── PAGE HERO ──────────────────────────────────────────────── -->
<div class="page-hero-curved">
  <div class="container position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center sr-reveal">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="/services">Services</a></li>
        <li class="breadcrumb-item active" aria-current="page">Retirement Planning</li>
      </ol>
    </nav>
    <div class="text-center sr-section">
      <span class="category-label sr-child">Planning</span>
      <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Retirement Planning</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<!-- ── SUB-NAVIGATION ──────────────────────────────────────────────── -->
<div class="service-pill-nav">
  <div class="container">
    <div class="d-flex flex-wrap justify-content-center gap-3 sr-reveal">
      <a href="/services/child-education" class="service-pill">Child Education Planning</a>
      <a href="/services/goal-planning" class="service-pill">Goal Planning</a>
      <a href="/services/retirement-planning" class="service-pill active">Retirement Planning</a>
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
          <img src="/images/services/Retirement_Planning.webp" class="img-fluid" alt="Retirement Planning">
        </div>
      </div>
      <div class="col-lg-7">
        <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 24px;">Secure Your Golden Years</h2>
        <p class="sr-child" style="color: var(--text-muted); font-size: 16px; line-height: 1.8; margin-bottom: 24px;">
          Retirement planning involves accumulating a specific amount of money by the time you reach retirement age. It's about creating a plan to live the lifestyle you've always dreamed of during your golden years.
        </p>
        <p class="sr-child" style="color: var(--text-muted); font-size: 16px; line-height: 1.8; margin-bottom: 24px;">
          Essentially, this means ensuring you have a steady source of income when you retire from your active career.
        </p>
        
        <div class="sr-child" style="background: rgba(0, 152, 153, 0.05); border-left: 4px solid var(--brand-primary); padding: 20px; border-radius: 0 12px 12px 0;">
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 8px;">Why plan for retirement?</h4>
          <p style="color: var(--text-muted); font-size: 15px; margin-bottom: 0;">
            Your current expenses will likely increase due to inflation and rising costs of living. It's essential to start planning for retirement as early as possible to ensure a comfortable and secure future.
          </p>
        </div>

        <div class="sr-child" style="background: rgba(255, 152, 0, 0.07); border-left: 4px solid #ff9800; padding: 20px; border-radius: 0 12px 12px 0; margin-top: 20px;">
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 8px;">Did you know?</h4>
          <p style="color: var(--text-muted); font-size: 15px; margin-bottom: 0;">
            Over 56% of parents in India depend on their children for financial support during retirement.
          </p>
        </div>
      </div>
    </div>

    <!-- Steps -->
    <div class="mb-5 mt-5 pt-4 sr-section">
      <h2 class="sr-child" style="font-size: 2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Steps to Retirement Planning</h2>
      <p class="sr-child" style="color: var(--text-muted); font-size: 16px; max-width: 700px;">Follow these essential steps to build a solid foundation for your retirement corpus.</p>
    </div>

    <div class="row g-4 mb-5 pb-4 sr-section">
      <div class="col-md-6 col-lg-6 sr-child">
        <div class="premium-card h-100 text-center">
          <div class="mb-4" style="width: 70px; height: 70px; background: rgba(0,152,153,0.1); color: var(--brand-primary); font-size: 28px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
            <i class="fas fa-home"></i>
          </div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">1. Envision Your Retirement Lifestyle</h4>
          <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">Decide what kind of life you see for yourself in your retirement. Do you want to live a quiet life in the countryside, or travel the world? The type of life you want to live will decide how much money you would need to save up.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-6 sr-child">
        <div class="premium-card h-100 text-center">
          <div class="mb-4" style="width: 70px; height: 70px; background: rgba(0,152,153,0.1); color: var(--brand-primary); font-size: 28px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
            <i class="fas fa-chart-pie"></i>
          </div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">2. Take Stock of Your Assets</h4>
          <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">The value of your existing assets will make up some of your retirement corpus. The rest of the corpus needs to be built over the time you have left till your retirement.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-6 sr-child">
        <div class="premium-card h-100 text-center">
          <div class="mb-4" style="width: 70px; height: 70px; background: rgba(0,152,153,0.1); color: var(--brand-primary); font-size: 28px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
            <i class="fas fa-hourglass-half"></i>
          </div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">3. Consider Your Time Horizon</h4>
          <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">Take a look at how much time you still have. As a rule of thumb, the longer you have for your investment, the larger the corpus you can build. Investments will be based on time left and risk appetite.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-6 sr-child">
        <div class="premium-card h-100 text-center">
          <div class="mb-4" style="width: 70px; height: 70px; background: rgba(0,152,153,0.1); color: var(--brand-primary); font-size: 28px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
            <i class="fas fa-seedling"></i>
          </div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">4. Choose Investment Avenues</h4>
          <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">Plan the investment avenues that can help you reach your goals. You can pick from ETFs, NPS, mutual funds, or stocks that offer growth or the assurance of debt.</p>
        </div>
      </div>
    </div>

    <!-- CTA Strip -->
    <div class="cta-strip sr-reveal">
      <div class="d-flex align-items-center justify-content-between flex-wrap gap-4">
        <div>
          <h3>Start building your retirement corpus today</h3>
          <p>Get in touch with us to define your roadmap to a stress-free and independent life.</p>
        </div>
        <a href="/contactus" class="cta-btn">Contact Us</a>
      </div>
    </div>

  </div>
</section>
