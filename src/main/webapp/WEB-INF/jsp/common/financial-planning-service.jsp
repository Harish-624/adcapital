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

/* ── LISTS ─────────────────────────────── */
.content-list { list-style: none; padding: 0; margin: 0; }
.content-list li {
  position: relative; padding-left: 30px; margin-bottom: 16px; color: #6b7280; line-height: 1.7;
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
  <div class="container text-center position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center sr-reveal">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="/services">Services</a></li>
        <li class="breadcrumb-item active" aria-current="page">Financial Planning</li>
      </ol>
    </nav>
    <div class="text-center sr-section">
      <span class="category-label sr-child">Planning</span>
      <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Financial Planning</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
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
          <img src="/images/services/Financial_Planning.png" class="img-fluid" alt="Financial Planning">
        </div>
      </div>
      <div class="col-lg-7">
        <span class="about-label sr-child">Overview</span>
        <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 24px;">Strategic Wealth Management</h2>
        <p class="sr-child" style="color: #6b7280; font-size: 16px; line-height: 1.8; margin-bottom: 20px;">
          Financial planning is a strategic process aimed at achieving future financial goals and ensuring long-term financial security. It involves assessing your current financial status, setting clear goals, evaluating risk tolerance, and managing cash flow and asset allocation.
        </p>
        <p class="sr-child" style="color: #6b7280; font-size: 16px; line-height: 1.8; margin-bottom: 0;">
          The process includes building a diversified investment portfolio, selecting appropriate financial products based on thorough research, and regularly monitoring and re-balancing the portfolio to adapt to changes. Financial planning is an ongoing effort that requires periodic adjustments to stay aligned with your evolving goals and circumstances.
        </p>
      </div>
    </div>

    <!-- Integrated Model -->
    <div class="row mb-5 pb-4 align-items-start sr-section">
      <div class="col-lg-12">
        <div class="mv-card p-md-5 sr-child">
          <div class="row align-items-center">
            <div class="col-md-6 mb-4 mb-md-0">
              <span class="about-label">Our Approach</span>
              <h3 style="font-size: 1.8rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">Integrated Financial Planning Model</h3>
              <p style="color: #6b7280; font-size: 15px; line-height: 1.8; margin-bottom: 0;">
                We utilize a comprehensive model designed to cover every aspect of your financial life, ensuring a robust and tailored strategy for your wealth.
              </p>
            </div>
            <div class="col-md-6">
              <ul class="content-list">
                <li>Basic personal information collection</li>
                <li>Income & expenses analysis</li>
                <li>Comprehensive risk profiling</li>
                <li>Setting actionable financial goals</li>
                <li>Review of existing investments</li>
                <li>Proposing new investments based on research</li>
                <li>Risk management & insurance evaluation</li>
                <li>Strategic asset allocation</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Why Financial Planning -->
    <div class="row row-cards g-4 mb-5 pb-4 sr-section">
      <div class="col-md-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-question-circle"></i></div>
          <h4 style="font-size: 1.3rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">Why financial planning?</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">
            Financial success impacts all areas of life. With longer retirement years and increased competition, effective financial planning is essential for future security. Successful investors plan wisely and make their money work for them.
          </p>
        </div>
      </div>
      
      <div class="col-md-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-check-circle"></i></div>
          <h4 style="font-size: 1.3rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">With Financial Planning</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">
            Life is unpredictable, but a proper plan provides wealth and peace of mind. It helps achieve family financial goals and prepares you for a secure, graceful retirement.
          </p>
        </div>
      </div>
      
      <div class="col-md-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon" style="background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%); box-shadow: 0 8px 20px rgba(231,76,60,0.3);"><i class="fas fa-times-circle"></i></div>
          <h4 style="font-size: 1.3rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">Without Financial Planning</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">
            Without a plan, unexpected events can derail your stability. Planning ensures you can confidently meet goals like your children's education, paying off loans, and securing a comfortable future.
          </p>
        </div>
      </div>
    </div>

    <!-- Quote Block -->
    <div class="row mb-5 text-center sr-reveal">
      <div class="col-lg-8 mx-auto">
        <div style="background: rgba(0, 152, 153, 0.05); padding: 40px; border-radius: 20px; border: 1px dashed rgba(0, 152, 153, 0.3);">
          <i class="fas fa-quote-left" style="font-size: 24px; color: #009899; margin-bottom: 16px;"></i>
          <p style="font-size: 1.2rem; font-style: italic; color: #1a1f2e; font-weight: 500; margin-bottom: 0; line-height: 1.6;">
            "A financial planner is like a working partner in your investment business; find a trustworthy and experienced financial planner."
          </p>
        </div>
      </div>
    </div>

    <!-- CTA Strip -->
    <div class="cta-strip sr-reveal">
      <div class="d-flex align-items-center justify-content-between flex-wrap gap-4">
        <div>
          <h3>Start your financial journey today</h3>
          <p>Contact our team to get a comprehensive financial plan tailored to your life goals.</p>
        </div>
        <a href="/contactus" class="cta-btn">Contact Us</a>
      </div>
    </div>

  </div>
</section>
