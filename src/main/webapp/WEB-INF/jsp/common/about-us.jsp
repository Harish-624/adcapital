<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

      <style>
        /* ── About Us v2.2 Page Styles ─────────────────────────────── */

        /* ── PAGE HERO (Removed inline styles, now using global .page-hero-curved) ── */


        /* ── INTRO SECTION ─────────────────────────────── */
        .about-intro-section {
          background: #fff;
          padding: 100px 0;
        }

        /* ── Who We Are Image — two backing cards + white frame ── */
        .about-image-stack {
          position: relative;
          display: block;
          padding: 20px;
          width: 85%;
          max-width: 440px;
          margin: 0 auto;
        }

        /* Card 1: solid teal, positive angle */
        .about-image-stack-teal {
          position: absolute;
          inset: 0;
          background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
          border-radius: 24px;
          transform: rotate(3deg);
          z-index: 0;
          transition: transform 0.5s ease;
          opacity: 0.85;
        }

        /* Card 2: light teal, negative angle */
        .about-image-stack-light {
          position: absolute;
          inset: 0;
          background: linear-gradient(135deg, rgba(0, 152, 153, 0.18) 0%, rgba(0, 133, 161, 0.10) 100%);
          border-radius: 24px;
          transform: rotate(-4deg);
          z-index: 0;
          transition: transform 0.5s ease;
        }

        .about-image-stack:hover .about-image-stack-teal {
          transform: rotate(5deg) scale(1.02);
        }

        .about-image-stack:hover .about-image-stack-light {
          transform: rotate(-6deg) scale(1.02);
        }

        .about-image-stack img {
          position: relative;
          z-index: 1;
          border-radius: 20px;
          box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
          transition: transform 0.5s ease;
          width: 100%;
          display: block;
          border: 8px solid #ffffff;
          outline: 1px solid rgba(0, 152, 153, 0.15);
        }

        .about-image-stack:hover img {
          transform: translateY(-5px);
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

        .about-intro-section h2 {
          font-size: 2.2rem;
          font-weight: 700;
          color: #1a1f2e;
          line-height: 1.3;
          margin-bottom: 20px;
        }

        .about-quote {
          border-left: 4px solid #009899;
          padding: 16px 24px;
          background: linear-gradient(90deg, rgba(0, 152, 153, 0.08) 0%, rgba(255, 255, 255, 0) 100%);
          border-radius: 0 12px 12px 0;
          margin: 24px 0;
          font-weight: 600;
          color: #0085A1;
          font-size: 16px;
          font-style: italic;
        }

        .service-tag {
          display: inline-flex;
          align-items: center;
          gap: 10px;
          background: #fff;
          border: 1px solid #e5e7eb;
          border-radius: 8px;
          padding: 10px 18px;
          font-size: 14px;
          color: #374151;
          margin: 6px 6px 6px 0;
          font-weight: 500;
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
          transition: all 0.3s ease;
        }

        .service-tag:hover {
          border-color: #009899;
          transform: translateY(-2px);
          box-shadow: 0 6px 16px rgba(0, 152, 153, 0.1);
        }

        .service-tag i {
          color: #009899;
          font-size: 14px;
        }


        /* ── STATS BAR ─────────────────────────────── */
        .stats-bar {
          background: #f8fafb;
          padding: 60px 0;
          border-top: 1px solid #e9ecef;
          border-bottom: 1px solid #e9ecef;
        }

        .stat-block {
          text-align: center;
        }

        .stat-block .stat-num {
          font-size: 3rem;
          font-weight: 800;
          color: #009899;
          line-height: 1;
          margin-bottom: 12px;
          font-family: Arial, sans-serif;
          /* Fallback to a cleaner, structured font */
        }

        .stat-block .stat-lbl {
          font-size: 14px;
          color: #6b7280;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.5px;
        }

        .stat-divider {
          width: 1px;
          background: #e5e7eb;
          height: 60px;
          margin: 0 auto;
        }


        /* ── MISSION VISION ─────────────────────────────── */
        .mv-section {
          background: #fff;
          padding: 100px 0;
        }

        .mv-card {
          background: #fff;
          border-radius: 20px;
          border: 1px solid #f0f0f0;
          box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
          padding: 50px 40px;
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
        }

        .mv-icon i {
          color: #fff;
          font-size: 26px;
        }

        .mv-card h3 {
          font-size: 1.5rem;
          font-weight: 700;
          color: #1a1f2e;
          margin-bottom: 16px;
        }

        .mv-card p {
          color: #6b7280;
          font-size: 15px;
          line-height: 1.8;
          margin: 0;
        }


        /* ── TEAM SECTION ─────────────────────────────── */
        .team-section {
          background: #f8fafb;
          padding: 100px 0;
        }

        .team-tabs {
          border-bottom: none;
          gap: 12px;
        }

        .team-tabs .nav-link {
          display: inline-flex;
          align-items: center;
          gap: 8px;
          font-size: 15px;
          font-weight: 600;
          color: #6b7280;
          padding: 12px 24px;
          border-radius: 12px;
          border: 1px solid #e5e7eb;
          background: #fff;
          transition: all 0.3s ease;
        }

        .team-tabs .nav-link:hover {
          border-color: #009899;
          color: #009899;
          transform: translateY(-2px);
        }

        .team-tabs .nav-link.active {
          background: #009899;
          color: #fff !important;
          border-color: #009899;
          box-shadow: 0 8px 20px rgba(0, 152, 153, 0.25);
        }

        .team-panel {
          background: #fff;
          border-radius: 24px;
          border: none;
          box-shadow: 0 10px 40px rgba(0, 0, 0, 0.06);
          padding: 48px;
          margin-top: 40px;
        }

        /* ── TEAM PHOTO COLUMN (Elite Premium Design) ─── */

        /* Outer wrapper */
        .team-photo-wrapper {
          position: relative;
          width: 220px;
          margin: 40px auto 50px auto; 
          z-index: 1;
        }

        /* 1. Top Right Grid Pattern */
        .team-photo-wrapper::before {
          content: '';
          position: absolute;
          top: -30px;
          right: -30px;
          width: 120px;
          height: 120px;
          background-image: radial-gradient(rgba(0, 152, 153, 0.4) 2px, transparent 2px);
          background-size: 16px 16px;
          z-index: -2;
          transition: all 0.7s cubic-bezier(0.23, 1, 0.32, 1);
        }

        /* 2. Bottom Left Grid Pattern */
        .team-photo-wrapper::after {
          content: '';
          position: absolute;
          bottom: -30px;
          left: -30px;
          width: 120px;
          height: 120px;
          background-image: radial-gradient(rgba(0, 152, 153, 0.4) 2px, transparent 2px);
          background-size: 16px 16px;
          z-index: -2;
          transition: all 0.7s cubic-bezier(0.23, 1, 0.32, 1);
        }

        @keyframes ambientFloat {
          0%, 100% { translate: 0 0px; }
          50% { translate: 0 -12px; }
        }

        /* 3. The photo frame card */
        .team-photo-frame {
          position: relative;
          z-index: 2;
          border-radius: 20px; 
          aspect-ratio: 3 / 4;
          background: #fff;
          /* Thick white border */
          border: 6px solid #fff;
          box-shadow: 
            0 15px 35px rgba(0, 0, 0, 0.08);
          animation: ambientFloat 6s ease-in-out infinite;
          transform: perspective(1000px) rotateX(0deg) rotateY(0deg) scale(1);
          transform-style: preserve-3d;
          transition: box-shadow 0.6s cubic-bezier(0.23, 1, 0.32, 1), transform 0.1s ease-out;
        }

        /* 4. Offset Rotated Solid Card (Backdrop) */
        .team-photo-frame::before {
          content: '';
          position: absolute;
          inset: -4px; /* Slightly larger to peek out more */
          border-radius: 20px;
          /* Striped texture over the gradient */
          background-image: 
            repeating-linear-gradient(45deg, transparent, transparent 10px, rgba(255,255,255,0.15) 10px, rgba(255,255,255,0.15) 20px), 
            linear-gradient(135deg, #009899 0%, #00d2d3 100%);
          transform: rotate(8deg);
          transform-origin: center center;
          z-index: -1;
          box-shadow: 0 10px 20px rgba(0, 152, 153, 0.2);
          transition: all 0.7s cubic-bezier(0.23, 1, 0.32, 1);
        }

        /* 5. Opposing Solid Light Teal Card */
        .team-photo-frame::after {
          content: '';
          position: absolute;
          inset: -10px;
          border-radius: 24px;
          background: rgba(0, 184, 185, 0.12); /* Soft light teal */
          border: 1px solid rgba(0, 152, 153, 0.15); /* Subtle definition */
          transform: rotate(-6deg);
          transform-origin: center center;
          z-index: -2;
          transition: all 0.7s cubic-bezier(0.23, 1, 0.32, 1);
          pointer-events: none;
        }

        .team-photo-frame img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          object-position: top center;
          border-radius: 14px; 
          display: block;
          background: #f4f6f8;
          transition: transform 0.8s cubic-bezier(0.23, 1, 0.32, 1);
        }

        /* Hover Effects */
        .team-photo-wrapper:hover::before {
          transform: translate(20px, -20px);
          opacity: 0.8;
        }

        .team-photo-wrapper:hover::after {
          transform: translate(-20px, 20px);
          opacity: 0.8;
        }

        .team-photo-wrapper:hover .team-photo-frame::before {
          transform: rotate(14deg) scale(1.02); 
          box-shadow: 0 15px 30px rgba(0, 152, 153, 0.3);
        }

        .team-photo-wrapper:hover .team-photo-frame::after {
          transform: rotate(-10deg) scale(1.04); 
          background: rgba(0, 184, 185, 0.2);
          border-color: rgba(0, 152, 153, 0.3);
        }

        .team-photo-wrapper:hover .team-photo-frame {
          box-shadow: 
            0 25px 50px rgba(0, 0, 0, 0.15);
        }

        .team-photo-wrapper:hover .team-photo-frame img {
          transform: scale(1.05); /* Cinematic zoom */
        }

        /* badge card row — icon on top, title + subtitle stacked below */
        .team-badge-row {
          display: flex;
          flex-wrap: wrap;
          justify-content: center;
          gap: 10px;
          margin-top: 20px;
        }

        .team-badge {
          flex: 1 1 0;
          min-width: 85px;
          max-width: 120px;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 4px;
          background: #fff;
          border: 1px solid #e5e7eb;
          border-radius: 12px;
          padding: 14px 6px;
          font-size: 12px;
          color: #1a1f2e;
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
          text-align: center;
          transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .team-badge:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 18px rgba(0, 152, 153, 0.14);
        }

        .team-badge i {
          color: #009899;
          font-size: 17px;
          margin-bottom: 2px;
        }

        .team-badge .badge-title {
          font-weight: 700;
          font-size: 13px;
          color: #1a1f2e;
          line-height: 1.2;
        }

        .team-badge .badge-sub {
          font-weight: 500;
          font-size: 11px;
          color: #6b7280;
          line-height: 1.2;
        }

        /* ── RIGHT COLUMN ─── */
        .team-desc {
          display: flex;
          flex-direction: column;
          justify-content: center;
          padding: 10px 0;
          height: 100%;
        }

        .team-about-header {
          display: flex;
          align-items: center;
          gap: 12px;
          margin-bottom: 8px;
        }

        .team-about-header i {
          color: #009899;
          font-size: 1.4rem;
        }

        .team-about-header span {
          font-size: 1.3rem;
          font-weight: 800;
          color: #1a1f2e;
          letter-spacing: -0.3px;
        }

        .team-about-underline {
          width: 50px;
          height: 4px;
          background: #009899;
          border-radius: 4px;
          margin-bottom: 24px;
        }

        .team-desc p {
          color: #4b5563;
          line-height: 1.85;
          margin-bottom: 20px;
          font-size: 16px;
        }

        .expertise-pill {
          display: inline-block;
          background: rgba(0, 152, 153, 0.08);
          border: 1px solid rgba(0, 152, 153, 0.2);
          border-radius: 6px;
          padding: 6px 14px;
          font-size: 13px;
          color: #009899;
          font-weight: 600;
          margin: 4px;
          white-space: nowrap;
        }
      </style>

      <!-- ── PAGE HERO ──────────────────────────────────────────────── -->
      <div class="page-hero-curved">
        <div class="container text-center position-relative" style="z-index:2">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-3 justify-content-center sr-reveal">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">About</li>
            </ol>
          </nav>
          <div class="text-center sr-section">
            <span class="category-label sr-child">Discover Our Journey</span>
            <h1 class="sr-child mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">About A D
              Capital Investment</h1>
          </div>
        </div>
        <div class="page-hero-curve-bottom"></div>
      </div>

      <!-- ── WHO WE ARE ─────────────────────────────────────────────── -->
      <section class="about-intro-section">
        <div class="container">



          <div class="row align-items-center g-5 sr-section no-reverse">
            <div class="col-lg-5 position-relative d-flex align-items-center justify-content-center">
              <div class="about-image-stack sr-child">
                <div class="about-image-stack-teal"></div>
                <div class="about-image-stack-light"></div>
                <picture><source srcset="/images/about-us.webp" type="image/webp"><img loading="lazy" src="/images/about-us.png" alt="About A D Capital Investment"></picture>
              </div>
            </div>
            <div class="col-lg-7">
              <span class="about-label sr-child">Who We Are</span>
              <h2 class="sr-child">Empowering your investments with expert guidance.</h2>
              <p class="mb-3 sr-child" style="color: #4b5563; font-size: 16px;">Welcome to A D Capital Investment, where
                your
                financial growth is our priority. With over a decade of experience in the financial sector, we
                specialize in providing expertly managed mutual fund solutions tailored to meet the unique needs of
                individuals, businesses, and Non-Resident Indian (NRI) / Overseas Citizen of India (OCI) clients.</p>

              <div class="about-quote sr-child" style="--sr-idx: 5; --sr-idx-rev: 5;">
                "We have a strong client base of over 400+ across India and globally in mutual funds and insurance."
              </div>

              <h6 class="mb-3 mt-4 sr-child" style="font-weight:700; color:#1a1f2e; font-size: 1.1rem;">Our
                comprehensive
                services include:</h6>
              <div class="mb-4 d-flex flex-wrap sr-child">
                <span class="service-tag"><i class="fas fa-check-circle"></i> Mutual Fund Advisory</span>
                <span class="service-tag"><i class="fas fa-check-circle"></i> Goal-Oriented Financial Planning</span>
                <span class="service-tag"><i class="fas fa-check-circle"></i> Exclusive Child Education</span>
                <span class="service-tag"><i class="fas fa-check-circle"></i> Retirement Planning</span>
                <span class="service-tag"><i class="fas fa-check-circle"></i> Expert Financial Consulting</span>
                <span class="service-tag"><i class="fas fa-check-circle"></i> Comprehensive Insurance</span>
                <span class="service-tag"><i class="fas fa-check-circle"></i> Global investing via Gift City</span>
              </div>

              <p class="mb-3 sr-child" style="color: #4b5563;">Our mission is to help you navigate your financial
                journey with
                confidence and precision. We believe in a personalized approach to investment, ensuring that each client
                receives a strategy that aligns with their financial goals and risk tolerance.</p>
              <p class="mb-0 sr-child" style="color: #4b5563;">At A D Capital Investment, we are committed to
                transparency,
                integrity, and excellence. Join us and experience the difference of a trusted partner in your financial
                success.</p>
            </div>
          </div>
        </div>
      </section>

      <!-- ── STATS BAR WITH ANIMATED COUNTER ───────────────────────────────────────── -->
      <div class="stats-bar">
        <div class="container">
          <div class="row justify-content-center align-items-center g-4 sr-section">
            <div class="col-6 col-md sr-child">
              <div class="stat-block">
                <div class="stat-num"><span class="counter-value" data-target="10" data-suffix="+">0+</span></div>
                <div class="stat-lbl">Years Experience</div>
              </div>
            </div>
            <div class="col-12 col-md-auto d-none d-md-block px-2">
              <div class="stat-divider"></div>
            </div>
            <div class="col-6 col-md sr-child">
              <div class="stat-block">
                <div class="stat-num"><span class="counter-value" data-target="10" data-suffix="">0</span></div>
                <div class="stat-lbl">Expert Team</div>
              </div>
            </div>
            <div class="col-12 col-md-auto d-none d-md-block px-2">
              <div class="stat-divider"></div>
            </div>
            <div class="col-6 col-md sr-child">
              <div class="stat-block">
                <div class="stat-num"><span class="counter-value" data-target="21" data-suffix="+">0+</span></div>
                <div class="stat-lbl">Countries</div>
              </div>
            </div>
            <div class="col-12 col-md-auto d-none d-md-block px-2">
              <div class="stat-divider"></div>
            </div>
            <div class="col-6 col-md sr-child">
              <div class="stat-block">
                <div class="stat-num"><span class="counter-value" data-target="400" data-suffix="+">0+</span></div>
                <div class="stat-lbl">Clients Globally</div>
              </div>
            </div>
            <div class="col-12 col-md-auto d-none d-md-block px-2">
              <div class="stat-divider"></div>
            </div>
            <div class="col-6 col-md sr-child">
              <div class="stat-block">
                <div class="stat-num"><span class="counter-value" data-target="1000" data-suffix="+">0+</span></div>
                <div class="stat-lbl">Individuals Mentored</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- ── MISSION & VISION ───────────────────────────────────────── -->
      <section class="mv-section">
        <div class="container">
          <div class="row g-5 sr-section">
            <div class="col-12 text-center mb-2 sr-child">
              <span class="about-label">Our Purpose</span>
              <h2 class="mt-2" style="font-size:2.2rem; font-weight:700; color:#1a1f2e;">Our Mission &amp; Vision</h2>
            </div>
            <div class="col-lg-6 sr-child">
              <div class="mv-card">
                <div class="mv-icon"><i class="fas fa-bullseye"></i></div>
                <h3>Our Mission</h3>
                <p>Empowering smarter savings, strategic investments, and better debt management for a secure financial
                  future.</p>
              </div>
            </div>
            <div class="col-lg-6 sr-child">
              <div class="mv-card">
                <div class="mv-icon"><i class="fas fa-eye"></i></div>
                <h3>Our Vision</h3>
                <p>To be the most trusted wealth advisory firm, guiding clients toward financial success with expert
                  strategies.</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- ── MEET OUR TEAM ───────────────────────────────────────────── -->
      <section class="team-section">
        <div class="container sr-section">
          <div class="text-center mb-5 sr-child">
            <span class="about-label">Our Teams</span>
            <h2 class="mt-2" style="font-size:2.2rem; font-weight:700; color:#1a1f2e;">Meet Our Teams</h2>
          </div>

          <!-- Tab Navigation -->
          <div class="d-flex flex-wrap justify-content-center team-tabs sr-child" id="custom-team-tabs">
            <button class="nav-link active" data-target="panel-aravind"><i class="far fa-user"></i> Aravind Elangovan</button>
            <button class="nav-link" data-target="panel-ahilan"><i class="far fa-user"></i> Ahilan</button>
            <button class="nav-link" data-target="panel-vasanth"><i class="far fa-user"></i> Vasanth</button>
            <button class="nav-link" data-target="panel-akilandeswari"><i class="far fa-user"></i> Akilandeswari</button>
          </div>

          <!-- Tab Content -->
          <div class="tab-content sr-child">

            <!-- Aravind -->
            <div class="team-panel custom-tab-panel" id="panel-aravind" style="display: block;">
              <div class="row align-items-stretch g-4">
                <!-- LEFT: Photo column -->
                <div class="col-md-4">
                  <div class="team-photo-col">
                    <div class="team-photo-wrapper">
                      <div class="team-photo-frame">
                        <img src="/images/testmonial/Aravind.png" alt="Aravind Elangovan" loading="lazy">
                      </div>
                    </div>
                    <!-- badges -->
                    <div class="team-badge-row">
                      <div class="team-badge">
                        <i class="fas fa-shield-alt"></i>
                        <span class="badge-title">NISM</span>
                        <span class="badge-sub">Certified</span>
                      </div>
                      <div class="team-badge">
                        <i class="fas fa-umbrella"></i>
                        <span class="badge-title">IRDAI</span>
                        <span class="badge-sub">Certified</span>
                      </div>
                      <div class="team-badge">
                        <i class="fas fa-star"></i>
                        <span class="badge-title">MDRT</span>
                        <span class="badge-sub">Awarded</span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- RIGHT: Description -->
                <div class="col-md-8 team-desc">
                  <div class="team-about-header">
                    <i class="far fa-user"></i>
                    <span>About Aravind Elangovan</span>
                  </div>
                  <div class="team-about-underline"></div>
                  <p>At A D Capital Investment, our strength lies in the expertise and dedication of our team. Aravind
                    Elangovan, a cornerstone of our advisory team, is a highly qualified and experienced financial
                    professional.</p>
                  <p>Aravind holds certifications as a NISM-certified Mutual Fund Advisor and an IRDAI-certified
                    Insurance Advisor, showcasing his deep knowledge and commitment to excellence. Recognized for his
                    outstanding achievements, he is also an MDRT-awarded Financial Advisor — a mark of distinction in
                    the global financial advisory space.</p>
                  <p>With years of expertise in both investment and insurance, Aravind has successfully guided clients
                    across India and the globe, including a specialized focus on Non-Resident Indians (NRIs). His
                    client-centric approach combines personalized financial planning with data-driven analysis, ensuring
                    tailored solutions that align with individual goals and aspirations.</p>
                </div>
              </div>
            </div>

            <!-- Manikandan -->
            <div class="team-panel custom-tab-panel" id="panel-manikandan" style="display: none;">
              <div class="row align-items-stretch g-5">
                <div class="col-md-4 text-center position-relative">
                  <div class="team-photo-bg"></div>
                  <div class="team-photo-wrapper d-flex align-items-center justify-content-center"
                    style="background:#f8fafb;">
                    <i class="fas fa-user" style="font-size:64px; color:#009899;"></i>
                  </div>
                  <div class="d-flex flex-wrap justify-content-center">
                    <span class="expertise-pill">NISM Certified</span>
                    <span class="expertise-pill">NRI Specialist</span>
                  </div>
                </div>
                <div class="col-md-8 team-desc">
                  <p>At A D Capital Investment, we are proud to have Manikandan as a key part of our team. With over a
                    decade of experience in spreading financial awareness, Manikandan is committed to mentoring
                    individuals and groups to achieve financial freedom and secure their future.</p>
                  <h6>Financial Background</h6>
                  <p>Manikandan has been instrumental in creating personal finance awareness for over 500+ individuals,
                    empowering them to make confident and informed financial decisions.</p>
                  <h6>About Manikandan</h6>
                  <p>An Engineer by profession and having rich finance experience, Manikandan's passion for financial
                    planning led him to become NISM-certified under SEBI. He specializes in providing financial guidance
                    to clients in the Gulf region and has extensive expertise in serving Non-Resident Indians (NRI's).
                  </p>
                  <h6>His areas of expertise include:</h6>
                  <div class="d-flex flex-wrap">
                    <span class="expertise-pill">Comprehensive Goal Planning</span>
                    <span class="expertise-pill">Mutual Funds</span>
                    <span class="expertise-pill">Child Education</span>
                    <span class="expertise-pill">Retirement</span>
                  </div>
                  <p class="mt-4">With a client-focused approach and a specialization in handling Gulf region and NRI
                    clients, Manikandan is dedicated to making your financial journey seamless and successful.</p>
                </div>
              </div>
            </div>

            <!-- Ahilan -->
            <div class="team-panel custom-tab-panel" id="panel-ahilan" style="display: none;">
              <div class="row align-items-stretch g-4">
                <div class="col-md-4">
                  <div class="team-photo-col">
                    <div class="team-photo-wrapper">
                      <div class="team-photo-frame">
                        <img src="/images/testmonial/Akilan.jpg" alt="Ahilan" loading="lazy">
                      </div>
                    </div>
                    <div class="team-badge-row">
                      <div class="team-badge">
                        <i class="fas fa-umbrella"></i>
                        <span class="badge-title">IRDAI</span>
                        <span class="badge-sub">Certified</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-8 team-desc">
                  <div class="team-about-header">
                    <i class="far fa-user"></i>
                    <span>About Ahilan</span>
                  </div>
                  <div class="team-about-underline"></div>
                  <p>At A D Capital Investment, we are proud to have Ahilan as a valuable part of our team. An
                    IRDAI-certified Insurance Advisor, Ahilan brings a wealth of experience and expertise, ensuring
                    clients receive top-notch guidance in securing their financial future.</p>
                  <p>With extensive knowledge in insurance and financial planning, Ahilan is dedicated to helping
                    individuals and families protect their assets and achieve their long-term goals. His client-centric
                    approach focuses on providing personalized solutions tailored to unique needs and circumstances.</p>
                  <div class="d-flex flex-wrap mt-3">
                    <span class="expertise-pill">Health &amp; Term Insurance</span>
                    <span class="expertise-pill">Child Education &amp; Retirement Planning</span>
                  </div>
                  <p class="mt-3">Ahilan's professionalism, experience, and passion for empowering clients make him an
                    invaluable part of our team.</p>
                </div>
              </div>
            </div>

            <!-- Vasanth -->
            <div class="team-panel custom-tab-panel" id="panel-vasanth" style="display: none;">
              <div class="row align-items-stretch g-4">
                <div class="col-md-4">
                  <div class="team-photo-col">
                    <div class="team-photo-wrapper">
                      <div class="team-photo-frame">
                        <img src="/images/testmonial/Vasanth.jpg" alt="Vasanth" loading="lazy">
                      </div>
                    </div>
                    <div class="team-badge-row">
                      <div class="team-badge">
                        <i class="fas fa-globe"></i>
                        <span class="badge-title">UK</span>
                        <span class="badge-sub">Operations</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-8 team-desc">
                  <div class="team-about-header">
                    <i class="far fa-user"></i>
                    <span>About Vasanth</span>
                  </div>
                  <div class="team-about-underline"></div>
                  <p>At A D Capital Investment, we are delighted to have Vasanth leading our operations in the United
                    Kingdom. With a postgraduate degree from the UK, Vasanth brings a unique perspective and a strong
                    foundation in analytical thinking to our team.</p>
                  <p>Vasanth leverages his extensive experience and skill set to efficiently manage the UK operations
                    team, ensuring seamless service delivery for our international clients. His expertise lies in
                    coordinating with clients and providing tailored solutions that align with their financial goals.
                  </p>
                  <div class="d-flex flex-wrap mt-3">
                    <span class="expertise-pill">Operational Management</span>
                    <span class="expertise-pill">Goal-Oriented Solutions</span>
                    <span class="expertise-pill">Client-Centric Approach</span>
                  </div>
                  <p class="mt-3">Vasanth's dedication, professionalism, and leadership make him an integral part of our
                    team. Whether you're based in the UK or have cross-border financial needs, Vasanth ensures that A D
                    Capital Investment delivers excellence at every step.</p>
                </div>
              </div>
            </div>

            <!-- Akilandeswari -->
            <div class="team-panel custom-tab-panel" id="panel-akilandeswari" style="display: none;">
              <div class="row align-items-stretch g-4">
                <div class="col-md-4">
                  <div class="team-photo-col">
                    <div class="team-photo-wrapper">
                      <div class="team-photo-frame">
                        <img src="/images/testmonial/Akilandeswari.jpg" alt="Akilandeswari" loading="lazy">
                      </div>
                    </div>
                    <div class="team-badge-row">
                      <div class="team-badge">
                        <i class="fas fa-handshake"></i>
                        <span class="badge-title">Client</span>
                        <span class="badge-sub">Management</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-8 team-desc">
                  <div class="team-about-header">
                    <i class="far fa-user"></i>
                    <span>About Akilandeswari</span>
                  </div>
                  <div class="team-about-underline"></div>
                  <p>At A D Capital Investment, we are proud to have Akilandeswari as a key member of our customer
                    management team. She combines analytical precision with exceptional client service skills to provide
                    an outstanding experience for our customers.</p>
                  <p>With a strong academic background and a passion for excellence, Akilandeswari plays a pivotal role
                    in managing and enhancing client relationships. Her expertise ensures that every client receives
                    personalized attention and seamless support throughout their financial journey.</p>
                  <div class="d-flex flex-wrap mt-3">
                    <span class="expertise-pill">Customer Relationship Management</span>
                    <span class="expertise-pill">Personalized Support</span>
                    <span class="expertise-pill">Data-Driven Insights</span>
                  </div>
                  <p class="mt-3">Akilandeswari's dedication, skill, and client-first approach make her an invaluable
                    part of the A D Capital Investment team, committed to ensuring client satisfaction at every step.
                  </p>
                </div>
              </div>
            </div>

          </div><!-- end tab-content -->
        </div>
      </section>

      <!-- Custom JS -->
      <script>
        document.addEventListener('DOMContentLoaded', function () {

          // 1. TABS LOGIC
          const tabs = document.querySelectorAll('#custom-team-tabs .nav-link');
          const panels = document.querySelectorAll('.custom-tab-panel');
          tabs.forEach(tab => {
            tab.addEventListener('click', function (e) {
              e.preventDefault();
              tabs.forEach(t => t.classList.remove('active'));
              panels.forEach(p => { p.style.display = 'none'; p.style.opacity = '0'; });
              this.classList.add('active');
              const targetPanel = document.getElementById(this.getAttribute('data-target'));
              targetPanel.style.display = 'block';
              setTimeout(() => {
                targetPanel.style.transition = 'opacity 0.3s ease';
                targetPanel.style.opacity = '1';
              }, 50);
            });
          });

          // 2. ANIMATED SCROLL COUNT-UP (Cubic-out easing, ~1.2s)
          function animateValue(obj, start, end, duration) {
            let startTimestamp = null;
            const easeOutQuart = t => 1 - (--t) * t * t * t;
            const suffix = obj.getAttribute('data-suffix') || "";

            const step = (timestamp) => {
              if (!startTimestamp) startTimestamp = timestamp;
              const progress = Math.min((timestamp - startTimestamp) / duration, 1);
              const easedProgress = easeOutQuart(progress);

              const currentVal = Math.floor(easedProgress * (end - start) + start);
              obj.innerHTML = currentVal + suffix;

              if (progress < 1) {
                window.requestAnimationFrame(step);
              } else {
                obj.innerHTML = end + suffix; // ensure exact end value
              }
            };
            window.requestAnimationFrame(step);
          }

          const statNumbers = document.querySelectorAll('.counter-value');
          const observer = new IntersectionObserver((entries, obs) => {
            entries.forEach(entry => {
              if (entry.isIntersecting) {
                statNumbers.forEach(num => {
                  const endVal = parseInt(num.getAttribute('data-target'));
                  animateValue(num, 0, endVal, 1200);
                });
                obs.unobserve(entry.target);
              }
            });
          }, { threshold: 0.5 }); // triggers when 50% of the bar is visible

          const statsSection = document.querySelector('.stats-bar');
          if (statsSection) {
            observer.observe(statsSection);
          }

          // 3. 3D PARALLAX HOVER EFFECT FOR TEAM PHOTOS
          const photoWrappers = document.querySelectorAll('.team-photo-wrapper');
          photoWrappers.forEach(wrapper => {
            const frame = wrapper.querySelector('.team-photo-frame');
            if(!frame) return;

            wrapper.addEventListener('mousemove', (e) => {
              const rect = wrapper.getBoundingClientRect();
              const x = (e.clientX - rect.left - rect.width / 2) / (rect.width / 2);
              const y = (e.clientY - rect.top - rect.height / 2) / (rect.height / 2);
              
              const tiltX = y * -12; 
              const tiltY = x * 12;
              
              frame.style.transform = `perspective(1000px) rotateX(${tiltX}deg) rotateY(${tiltY}deg) scale(1.02)`;
            });

            wrapper.addEventListener('mouseleave', () => {
              frame.style.transform = `perspective(1000px) rotateX(0deg) rotateY(0deg) scale(1)`;
            });
          });

        });
      </script>