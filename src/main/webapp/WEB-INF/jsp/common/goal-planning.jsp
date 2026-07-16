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
        <li class="breadcrumb-item active" aria-current="page">Goal Planning</li>
      </ol>
    </nav>
    <div class="text-center sr-section">
      <span class="category-label sr-child">Planning</span>
      <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Goal Planning</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<!-- ── SUB-NAVIGATION ──────────────────────────────────────────────── -->
<div class="service-pill-nav">
  <div class="container">
    <div class="d-flex flex-wrap justify-content-center gap-3 sr-reveal">
      <a href="/services/child-education" class="service-pill">Child Education Planning</a>
      <a href="/services/goal-planning" class="service-pill active">Goal Planning</a>
      <a href="/services/retirement-planning" class="service-pill">Retirement Planning</a>
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
          <img src="/images/services/Goal_Planning.webp" class="img-fluid" alt="Goal Planning">
        </div>
      </div>
      <div class="col-lg-7">
        <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 24px;">Your Roadmap to Success</h2>
        <p class="sr-child" style="color: var(--text-muted); font-size: 16px; line-height: 1.8; margin-bottom: 24px;">
          Have you ever wondered where you want to be in five years? Or reflected on what you've accomplished by the end of the day? Many people feel their dreams remain unfulfilled, but without goals, it's easy to lose focus and direction.
        </p>
        <p class="sr-child" style="color: var(--text-muted); font-size: 16px; line-height: 1.8; margin-bottom: 24px;">
          While we can't predict disasters, we can certainly mitigate their impact with proper planning. Setting goals is crucial for turning your visions into reality.
        </p>
        <div class="sr-child" style="background: rgba(0, 152, 153, 0.05); border-left: 4px solid var(--brand-primary); padding: 20px; border-radius: 0 12px 12px 0;">
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 8px;">SMART Concept</h4>
          <p style="color: var(--text-muted); font-size: 15px; margin-bottom: 0;">
            Our experts make sure to set your goals based on the SMART framework: Specific, Measurable, Achievable, Relevant, and Timebound.
          </p>
        </div>
      </div>
    </div>

    <!-- Why Goal Planning -->
    <div class="row g-4 mb-5 pb-4 sr-section">
      <div class="col-12 sr-child">
        <h2 style="font-size: 2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Why Should We Do Goal Planning?</h2>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-compass"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Provides Clear Direction</h4>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-fire"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Boosts Motivation</h4>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-lightbulb"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Enhances Decision Making</h4>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-chart-line"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Increases Productivity</h4>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-medal"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Builds Confidence</h4>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="premium-card h-100">
          <div class="mv-icon"><i class="fas fa-wallet"></i></div>
          <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Promotes Financial Stability</h4>
        </div>
      </div>
    </div>

    <!-- Assistance Section -->
    <div class="row mb-5 sr-section">
      <div class="col-lg-12 sr-child">
        <div style="background: rgba(0, 152, 153, 0.03); border-radius: 20px; padding: 40px; border: 1px solid rgba(0,152,153,0.1);">
          <div class="row align-items-center">
            <div class="col-lg-5 mb-4 mb-lg-0">
              <h3 style="font-size: 1.8rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">How Our Representatives Assist You</h3>
              <p style="color: #6b7280; font-size: 15px; line-height: 1.8; margin-bottom: 0;">
                Our expert advisors will guide you through the process of mapping out your financial future step by step.
              </p>
            </div>
            <div class="col-lg-6 offset-lg-1">
              <ul class="content-list">
                <li><strong style="color: #1a1f2e;">Risk Profiling:</strong> We analyze your risk tolerance and conclude your investor type.</li>
                <li><strong style="color: #1a1f2e;">Long-Term Goals:</strong> We set your long-term goals (&gt; 5 years) based on your risk profile, such as:</li>
                <ul class="content-list" style="margin-left: 20px; margin-top: 10px;">
                  <li>Kids Education &amp; Higher Education</li>
                  <li>Kids Marriage Planning</li>
                  <li>Bread Winner Retirement</li>
                </ul>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- CTA Strip -->
    <div class="cta-strip sr-reveal">
      <div class="d-flex align-items-center justify-content-between flex-wrap gap-4">
        <div>
          <h3>Start Planning Your Goals Today</h3>
          <p>Get in touch with us to define your roadmap to success with our expert guidance.</p>
        </div>
        <a href="/contactus" class="cta-btn">Contact Us</a>
      </div>
    </div>

  </div>
</section>
