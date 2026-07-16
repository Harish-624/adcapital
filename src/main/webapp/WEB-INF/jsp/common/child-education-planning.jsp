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
          content: '';
          position: absolute;
          top: -80px;
          right: -80px;
          width: 400px;
          height: 400px;
          background: radial-gradient(circle, rgba(255, 255, 255, 0.12) 0%, transparent 70%);
          border-radius: 50%;
        }

        .svc-detail-hero h1 {
          color: #fff;
          font-size: 2.5rem;
          font-weight: 700;
        }

        .svc-detail-hero .breadcrumb-item,
        .svc-detail-hero .breadcrumb-item a {
          color: rgba(255, 255, 255, 0.75);
          font-size: 14px;
          text-decoration: none;
        }

        .svc-detail-hero .breadcrumb-item.active {
          color: #fff;
          font-weight: 500;
        }

        .svc-detail-hero .breadcrumb-item+.breadcrumb-item::before {
          color: rgba(255, 255, 255, 0.5);
        }

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

        /* ── 3D IMAGE EFFECT ─────────────────────────────── */
        .about-image-wrapper {
          position: relative;
          display: inline-block;
          padding: 20px;
        }

        .about-image-backing {
          position: absolute;
          inset: 0;
          background: linear-gradient(135deg, rgba(0, 152, 153, 0.1) 0%, rgba(0, 133, 161, 0.05) 100%);
          border-radius: 24px;
          transform: rotate(-3deg);
          z-index: 0;
          transition: transform 0.5s ease;
        }

        .about-image-wrapper:hover .about-image-backing {
          transform: rotate(-5deg) scale(1.02);
        }

        .about-image-wrapper img {
          position: relative;
          z-index: 1;
          border-radius: 20px;
          box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
          transition: transform 0.5s ease;
        }

        .about-image-wrapper:hover img {
          transform: translateY(-5px);
        }

        /* ── CONTENT CARDS ─────────────────────────────── */
        .mv-card {
          background: #fff;
          border-radius: 20px;
          border: 1px solid #f0f0f0;
          box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
          padding: 36px 32px;
          height: 100%;
          transition: all 0.4s ease;
          position: relative;
          z-index: 0;
        }

        .row-cards .mv-card {
          height: 100%;
        }

        .mv-card::after {
          content: '';
          position: absolute;
          inset: 0;
          background: linear-gradient(135deg, rgba(0, 152, 153, 0.03) 0%, rgba(0, 133, 161, 0.03) 100%);
          z-index: -1;
          opacity: 0;
          transition: opacity 0.4s ease;
        }

        .mv-card:hover {
          transform: translateY(-5px);
          box-shadow: 0 20px 50px rgba(0, 152, 153, 0.12);
          border-color: rgba(0, 152, 153, 0.2);
        }

        .mv-card:hover::after {
          opacity: 1;
        }

        .mv-icon {
          width: 56px;
          height: 56px;
          border-radius: 14px;
          background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
          display: flex;
          align-items: center;
          justify-content: center;
          margin-bottom: 20px;
          box-shadow: 0 8px 20px rgba(0, 152, 153, 0.3);
          color: #fff;
          font-size: 24px;
        }

        /* ── LISTS ─────────────────────────────── */
        .content-list {
          list-style: none;
          padding: 0;
          margin: 0;
        }

        .content-list li {
          position: relative;
          padding-left: 30px;
          margin-bottom: 16px;
          color: #6b7280;
          line-height: 1.7;
          font-size: 15px;
        }

        .content-list li::before {
          content: '\f00c';
          font-family: 'Font Awesome 5 Free';
          font-weight: 900;
          position: absolute;
          left: 0;
          top: 2px;
          color: #009899;
          font-size: 14px;
        }

        /* ── CTA STRIP ─────────────────────────────── */
        .cta-strip {
          background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
          border-radius: 20px;
          padding: 60px 50px;
          position: relative;
          overflow: hidden;
          z-index: 1;
        }

        .cta-strip::before {
          content: '';
          position: absolute;
          top: -60px;
          right: -60px;
          width: 280px;
          height: 280px;
          background: radial-gradient(circle, rgba(255, 255, 255, 0.12) 0%, transparent 70%);
          border-radius: 50%;
        }

        .cta-strip h3 {
          color: #fff;
          font-size: 1.8rem;
          font-weight: 700;
          margin-bottom: 12px;
        }

        .cta-strip p {
          color: rgba(255, 255, 255, 0.85);
          font-size: 16px;
          margin-bottom: 0;
        }

        .cta-btn {
          background: #fff;
          color: #009899;
          border: none;
          border-radius: 12px;
          padding: 16px 36px;
          font-size: 15px;
          font-weight: 700;
          text-decoration: none;
          transition: all 0.3s ease;
          display: inline-block;
          white-space: nowrap;
        }

        .cta-btn:hover {
          transform: translateY(-3px);
          box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
          color: #009899;
        }

        @media (max-width:768px) {
          .cta-strip {
            padding: 40px 28px;
            text-align: center;
          }

          .cta-strip .d-flex {
            flex-direction: column;
            gap: 24px;
            align-items: center !important;
          }

          .cta-btn {
            width: 100%;
            text-align: center;
          }

          .about-image-wrapper {
            margin-bottom: 40px;
          }
        }

        /* ── NUMBERED CARDS ─────────────────────────────── */
        .step-card {
          background: #fff;
          border-radius: 20px;
          border: 1px solid #f0f0f0;
          padding: 30px;
          position: relative;
          overflow: hidden;
          height: 100%;
        }

        .step-number {
          position: absolute;
          top: -10px;
          right: 10px;
          font-size: 80px;
          font-weight: 800;
          color: rgba(0, 152, 153, 0.05);
          line-height: 1;
          z-index: 0;
        }

        .step-card-content {
          position: relative;
          z-index: 1;
        }
      </style>

      <!-- ── PAGE HERO ──────────────────────────────────────────────── -->
      <div class="page-hero-curved">
        <div class="container position-relative" style="z-index:2">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-3 justify-content-center sr-reveal">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item"><a href="/services">Services</a></li>
              <li class="breadcrumb-item active" aria-current="page">Child Education Planning</li>
            </ol>
          </nav>
          <div class="text-center sr-section">
            <span class="category-label sr-child">Planning</span>
            <h1 class="sr-child mt-2 mb-0"
              style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Child Education Planning</h1>
          </div>
        </div>
        <div class="page-hero-curve-bottom"></div>
      </div>

      <!-- ── SUB-NAVIGATION ──────────────────────────────────────────────── -->
      <div class="service-pill-nav">
        <div class="container">
          <div class="d-flex flex-wrap justify-content-center gap-3 sr-reveal">
            <a href="/services/child-education" class="service-pill active">Child Education Planning</a>
            <a href="/services/goal-planning" class="service-pill">Goal Planning</a>
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
                <img src="/images/services/Child_Education_planning.webp" class="img-fluid" alt="Child Education Planning">
              </div>
            </div>
            <div class="col-lg-7">
              <h2 class="sr-child"
                style="font-size: 2.2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 24px;">What is Child
                Education Planning?</h2>
              <p class="sr-child"
                style="color: var(--text-muted); font-size: 16px; line-height: 1.8; margin-bottom: 24px;">
                Child education planning refers to the process of systematically saving and investing to accumulate
                sufficient funds for a child's higher education. With rising education costs in India and abroad, it is
                essential to start early and choose the right investment instruments.
              </p>
              <p class="sr-child"
                style="color: var(--text-muted); font-size: 16px; line-height: 1.8; margin-bottom: 24px;">
                Education costs in India have been increasing at an average rate of 8-10% per annum, making it crucial
                for parents to plan well in advance. Whether you aim for an IIT, IIM, MBBS, or foreign university
                degree, a structured child education plan ensures that financial constraints do not hinder your child's
                dreams.
              </p>

              <h4 class="sr-child"
                style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px; margin-top: 32px;">
                Key Investment Factors</h4>
              <ul class="content-list sr-child" style="color: var(--text-muted);">
                <li><strong style="color: var(--text-dark);">Time Horizon:</strong> The number of years left before the
                  child enters higher education determines the investment strategy.</li>
                <li><strong style="color: var(--text-dark);">Inflation Factor:</strong> Education inflation must be
                  factored in to estimate the required corpus.</li>
                <li><strong style="color: var(--text-dark);">Risk Appetite:</strong> Parents must balance between
                  high-growth investments and low-risk instruments.</li>
              </ul>
            </div>
          </div>

          <!-- Steps -->
          <div class="mb-5 mt-5 pt-4 sr-section">
            <h2 class="sr-child"
              style="font-size: 2rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Steps to Invest
            </h2>
            <p class="sr-child" style="color: var(--text-muted); font-size: 16px; max-width: 600px;">Follow these
              crucial steps to ensure you're on the right track for your child's future.</p>
          </div>

          <div class="row g-4 mb-5 pb-4 sr-section">
            <div class="col-md-6 col-lg-3 sr-child">
              <div class="premium-card h-100 position-relative overflow-hidden">
                <div class="step-number"
                  style="position: absolute; top: -10px; right: 10px; font-size: 80px; font-weight: 800; color: rgba(0,152,153,0.05); line-height: 1; z-index: 0;">
                  1</div>
                <div style="position: relative; z-index: 1;">
                  <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Set a
                    target corpus</h4>
                  <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">Estimate the
                    future cost of education for your child in today's terms and adjust for inflation.</p>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 sr-child">
              <div class="premium-card h-100 position-relative overflow-hidden">
                <div class="step-number"
                  style="position: absolute; top: -10px; right: 10px; font-size: 80px; font-weight: 800; color: rgba(0,152,153,0.05); line-height: 1; z-index: 0;">
                  2</div>
                <div style="position: relative; z-index: 1;">
                  <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Select
                    investment mix</h4>
                  <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">A
                    diversified portfolio ensures stable returns, balancing between equity and debt.</p>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 sr-child">
              <div class="premium-card h-100 position-relative overflow-hidden">
                <div class="step-number"
                  style="position: absolute; top: -10px; right: 10px; font-size: 80px; font-weight: 800; color: rgba(0,152,153,0.05); line-height: 1; z-index: 0;">
                  3</div>
                <div style="position: relative; z-index: 1;">
                  <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Start
                    early</h4>
                  <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">The earlier
                    you start, the more you benefit from compounding and long-term growth.</p>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 sr-child">
              <div class="premium-card h-100 position-relative overflow-hidden">
                <div class="step-number"
                  style="position: absolute; top: -10px; right: 10px; font-size: 80px; font-weight: 800; color: rgba(0,152,153,0.05); line-height: 1; z-index: 0;">
                  4</div>
                <div style="position: relative; z-index: 1;">
                  <h4 style="font-size: 1.15rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px;">Review
                    & rebalance</h4>
                  <p style="color: var(--text-muted); font-size: 14px; line-height: 1.7; margin-bottom: 0;">Investments
                    should be monitored and adjusted as per market conditions and financial goals.</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Types of Plans -->
          <div class="row mb-5 pb-4 align-items-start">
            <div class="col-lg-12">
              <div class="sr-section"
                style="background: rgba(0, 152, 153, 0.03); border-radius: 20px; padding: 50px; border: 1px solid rgba(0,152,153,0.1);">
                <div class="text-center mb-5 sr-child">
                  <h3 style="font-size: 1.8rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Different Types
                    of Child Education Plans</h3>
                  <p style="color: #6b7280; font-size: 15px; max-width: 600px; margin: 0 auto;">Parents in India have
                    multiple investment options to build an education corpus.</p>
                </div>

                <div class="row g-4">
                  <div class="col-md-6 sr-child">
                    <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Mutual Funds
                      for Children</h4>
                    <p style="color: #6b7280; font-size: 14px; margin-bottom: 12px;">Provide flexibility, liquidity, and
                      inflation-beating returns.</p>
                    <ul class="content-list mb-4">
                      <li><strong>Equity Mutual Funds:</strong> Suitable for long-term goals (10+ years).</li>
                      <li><strong>Debt Mutual Funds:</strong> Ideal for medium-term goals (3-7 years).</li>
                      <li><strong>Hybrid Funds:</strong> A mix of equity and debt for a balanced approach.</li>
                    </ul>
                  </div>

                  <div class="col-md-6 sr-child">
                    <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Sukanya
                      Samriddhi Yojana (SSY)</h4>
                    <p style="color: #6b7280; font-size: 14px; margin-bottom: 12px;">For the girl child.</p>
                    <ul class="content-list mb-4">
                      <li><strong>Interest Rate:</strong> 7.5-8% (Government-backed)</li>
                      <li><strong>Lock-in Period:</strong> Till the girl turns 21 years</li>
                      <li><strong>Tax Benefit:</strong> EEE (Exempt-Exempt-Exempt)</li>
                    </ul>
                  </div>

                  <div class="col-md-6 sr-child">
                    <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Public
                      Provident Fund (PPF)</h4>
                    <ul class="content-list mb-4">
                      <li><strong>Risk-Free:</strong> Guaranteed by the Government of India</li>
                      <li><strong>Lock-in:</strong> 15 years (Partial withdrawal for higher education)</li>
                      <li><strong>Tax Benefits:</strong> Exempt under Section 80C in Old Tax Regime</li>
                    </ul>
                  </div>

                  <div class="col-md-6 sr-child">
                    <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Child
                      Insurance Plans</h4>
                    <ul class="content-list mb-4">
                      <li>Provides financial protection in case of the parent's demise.</li>
                      <li>Offers maturity benefits aligned with educational milestones.</li>
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
                <h3>Start your child's education planning today</h3>
                <p>Consider a mix of SIPs, government schemes, and tax-efficient investments with our expert help.</p>
              </div>
              <a href="/contactus" class="cta-btn">Contact Us</a>
            </div>
          </div>

        </div>
      </section>