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

/* ── 3D IMAGE EFFECT (From About Us) ─────────────────────────────── */
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
  transition: all 0.4s ease; position: relative; z-index: 0;
}
/* Use on grid cards so equal-height siblings match in a row */
.row-cards .mv-card { height: 100%; }
.mv-card::after {
  content: ''; position: absolute; inset: 0;
  background: linear-gradient(135deg, rgba(0,152,153,0.03) 0%, rgba(0,133,161,0.03) 100%);
  z-index: -1; opacity: 0; transition: opacity 0.4s ease; border-radius: 20px;
}
.mv-card:hover { transform: translateY(-5px); box-shadow: 0 20px 50px rgba(0,152,153,0.12); border-color: rgba(0,152,153,0.2); }
.mv-card:hover::after { opacity: 1; }

.mv-icon {
  width: 56px; height: 56px; border-radius: 14px;
  background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
  display: flex; align-items: center; justify-content: center; margin-bottom: 20px;
  box-shadow: 0 8px 20px rgba(0,152,153,0.3); color: #fff; font-size: 24px;
}

.content-list { list-style: none; padding: 0; margin: 0; }
.content-list li {
  position: relative; padding-left: 30px; margin-bottom: 16px; color: #6b7280; line-height: 1.7;
}
.content-list li::before {
  content: '\f00c'; font-family: 'Font Awesome 5 Free'; font-weight: 900;
  position: absolute; left: 0; top: 2px; color: #009899; font-size: 14px;
}
.content-list li strong { color: #1a1f2e; font-weight: 600; display: block; margin-bottom: 4px; }

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
        <li class="breadcrumb-item active" aria-current="page">Mutual Fund</li>
      </ol>
    </nav>
    <div class="text-center sr-section">
      <span class="category-label sr-child">Investment</span>
      <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Mutual Fund</h1>
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
          <img src="/images/services/mutual_fund.png" class="img-fluid" alt="Mutual Funds">
        </div>
      </div>
      <div class="col-lg-7">
        <span class="about-label sr-child">Overview</span>
        <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 24px;">What is a mutual fund?</h2>
        <p class="sr-child" style="color: #6b7280; font-size: 16px; line-height: 1.8; margin-bottom: 24px;">
          Mutual funds are investment vehicles that pool money from multiple investors to invest in a diversified portfolio of securities such as stocks, bonds, or other assets. Here are the key characteristics and aspects of mutual funds:
        </p>
        <ul class="content-list sr-child">
          <li><strong>Investment Pooling</strong> Investors contribute money to a mutual fund, which is managed by a professional portfolio manager or team. The pooled funds are invested in a diversified portfolio according to the fund's objectives.</li>
          <li><strong>Diversification</strong> Mutual funds spread investments across a wide range of assets, reducing risk compared to individual stocks or bonds. This includes different sectors, industries, and regions.</li>
          <li><strong>Professional Management</strong> Managed by experienced professionals who make investment decisions based on thorough research to achieve the fund's growth or income objectives.</li>
        </ul>
      </div>
    </div>

    <!-- Types of Mutual Funds -->
    <div class="text-center mb-5 sr-section">
      <span class="about-label sr-child">Options</span>
      <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">Types of Mutual Funds</h2>
      <p class="sr-child" style="color: #6b7280; font-size: 16px; max-width: 600px; margin: 0 auto;">There are various types of mutual funds tailored to different investor needs and goals.</p>
    </div>

    <div class="row row-cards g-4 mb-5 pb-4 sr-section">
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-chart-line"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Equity Funds</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Invest primarily in company shares to generate long-term capital appreciation. Suitable for investors seeking higher growth with a higher risk appetite.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-rupee-sign"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Debt Funds</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Invest in fixed-income instruments such as government securities, treasury bills, and corporate bonds. Ideal for stable income and lower risk.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-balance-scale"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Hybrid Funds</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Combine equity and debt investments to balance growth potential with capital preservation, making them suitable for moderate-risk investors.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-chart-pie"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Index Funds</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Passively track benchmark indices such as the Nifty 50 or Sensex, offering low-cost diversification and market-linked returns.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-globe"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">International Funds</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Invest in global markets and international companies, helping investors diversify geographically and gain exposure to global growth opportunities.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 sr-child">
        <div class="mv-card">
          <div class="mv-icon"><i class="fas fa-bullseye"></i></div>
          <h4 style="font-size: 1.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Solution-Oriented & Specialty Funds</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.7; margin-bottom: 0;">Designed for specific financial goals or themes, such as retirement, children's education, sectoral investments or technology-focused portfolios.</p>
        </div>
      </div>
    </div>

    <!-- Taxation Section -->
    <div class="row mb-3 sr-section">
      <div class="col-lg-10 mx-auto">
        <div class="text-center mb-4 sr-child">
          <span class="about-label">Knowledge</span>
          <h2 style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e;">Taxation of Mutual Funds</h2>
        </div>
        <div class="sr-child text-center mt-4">
          <img src="/images/services/Taxation_Mutual_fund.jpeg" class="img-fluid rounded-4 shadow-lg" alt="Taxation of Mutual Funds" style="width: 100%; border: 1px solid rgba(0,0,0,0.05);">
        </div>
      </div>
    </div>

    <!-- CTA Strip -->
    <div style="padding-top: 40px; padding-bottom: 60px;">
      <div class="cta-strip sr-reveal">
        <div class="d-flex align-items-center justify-content-between flex-wrap gap-4">
          <div>
            <h3>For more details contact our team</h3>
            <p>Get personalized guidance on selecting the best mutual funds for your financial goals.</p>
          </div>
          <a href="/contactus" class="cta-btn">Contact Us</a>
        </div>
      </div>
    </div>

  </div>
</section>