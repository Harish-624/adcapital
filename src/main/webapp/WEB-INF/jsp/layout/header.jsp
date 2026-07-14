<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



      <style>
        .fixed-top {
          position: fixed !important;
          top: 0 !important;
          left: 0;
          right: 0;
          width: 100%;
          z-index: 1030;
        }

        .sticky {
          position: sticky;
          top: 0;
          background-color: yellow;
          padding: 50px;
          font-size: 20px;
        }

        /* Full Width Sticky Navbar */
        .navbar {
          background: #ffffff !important;
          padding: 12px 32px !important;
          box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05) !important;
          /* Base transition — ensures compact change slides, not jumps */
          transition: padding 0.35s cubic-bezier(0.4, 0, 0.2, 1),
            box-shadow 0.35s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .navbar .navbar-nav {
          gap: 1.5rem;
          align-items: center;
        }

        /* Nav links — smooth underline animation via background-size
           (background-size never gets clipped by overflow unlike ::after) */
        .navbar .navbar-nav .nav-link {
          position: relative;
          color: #4b5563 !important;
          font-weight: 500;
          font-size: 15px;
          padding: 8px 0 !important;
          outline: none;
          margin: 0;
          /* Underline drawn via background gradient */
          background-image: linear-gradient(#0d9997, #0d9997);
          background-repeat: no-repeat;
          background-position: center bottom 0px;
          background-size: 0% 2px;
          transition: color 0.3s ease,
            background-size 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .navbar .navbar-nav .nav-link:hover,
        .navbar .navbar-nav .nav-link.active,
        .navbar .navbar-nav .nav-link.active-page {
          color: #0d9997 !important;
          background-size: 100% 2px;
        }

        /* ─── Page-load animations ────────────────────────────────────────────
           Compositor-only (opacity + transform) — zero layout / paint cost.   */
        @keyframes navFromLeft {
          from {
            opacity: 0;
            transform: translateX(-18px);
          }

          to {
            opacity: 1;
            transform: translateX(0);
          }
        }

        @keyframes navFromRight {
          from {
            opacity: 0;
            transform: translateX(18px);
          }

          to {
            opacity: 1;
            transform: translateX(0);
          }
        }

        /* Logo slides from the left */
        .navbar-brand {
          animation: navFromLeft 0.5s cubic-bezier(0.22, 1, 0.36, 1) 0.05s both;
        }

        /* First 4 nav items converge from LEFT, last 4+ from RIGHT.
           Items 4 & 5 share the same delay so they arrive together
           in the center — creating a smooth converging effect.       */
        .navbar-nav>*:nth-child(1) {
          animation: navFromLeft 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.10s both;
        }

        .navbar-nav>*:nth-child(2) {
          animation: navFromLeft 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.16s both;
        }

        .navbar-nav>*:nth-child(3) {
          animation: navFromLeft 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.22s both;
        }

        .navbar-nav>*:nth-child(4) {
          animation: navFromLeft 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.28s both;
        }

        .navbar-nav>*:nth-child(5) {
          animation: navFromRight 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.28s both;
        }

        .navbar-nav>*:nth-child(6) {
          animation: navFromRight 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.22s both;
        }

        .navbar-nav>*:nth-child(7) {
          animation: navFromRight 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.16s both;
        }

        .navbar-nav>*:nth-child(8) {
          animation: navFromRight 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.10s both;
        }

        .navbar-nav>*:nth-child(9) {
          animation: navFromRight 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.07s both;
        }

        .navbar-nav>*:nth-child(10) {
          animation: navFromRight 0.45s cubic-bezier(0.22, 1, 0.36, 1) 0.05s both;
        }

        /* Register/Login buttons slide from the right */
        .signup-btn {
          animation: navFromRight 0.5s cubic-bezier(0.22, 1, 0.36, 1) 0.45s both;
        }

        .login-btn {
          animation: navFromRight 0.5s cubic-bezier(0.22, 1, 0.36, 1) 0.52s both;
        }

        /* Remove dropdown caret arrows from navbar toggles */
        .navbar .dropdown-toggle::after {
          display: none !important;
        }

        /* Topbar custom styling */
        .topbarback {
          background-color: #0d9997 !important;
        }

        .top-social-icon {
          display: inline-block;
          transition: transform 0.3s ease;
        }

        .top-social-icon:hover {
          transform: scale(1.1);
        }

        /* Dropdown — card-like appearance */
        .dropdown-menu {
          position: absolute;
          z-index: 1000;
          display: none;
          border: 1px solid rgba(0, 0, 0, 0.05) !important;
          border-radius: 16px !important;
          box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1) !important;
          padding: 12px !important;
          background: #fff;
          min-width: 240px;
          margin-top: 15px;
          left: 0;
          text-align: left;
          list-style: none;
          background-clip: padding-box;
        }

        .dropdown-item {
          border-radius: 8px;
          padding: 10px 16px;
          font-size: 14px;
          font-weight: 500;
          color: #374151;
          transition: all 0.3s ease;
        }

        .dropdown-item:hover {
          background: rgba(13, 153, 151, 0.08);
          color: #0d9997;
          transform: translateX(4px);
        }

        /* Login/Register — navbar pill buttons */
        .login-btn {
          background: linear-gradient(90deg, #0d9997 0%, #29c1ac 100%) !important;
          color: #fff !important;
          font-weight: 600;
          font-size: 13px;
          border: 2px solid transparent !important;
          border-radius: 50px;
          text-transform: uppercase;
          padding: 8px 32px !important;
          /* Wider padding */
          transition: all 0.3s ease;
          white-space: nowrap;
          letter-spacing: 0.3px;
        }

        .login-btn:hover {
          background: linear-gradient(90deg, #0b8785 0%, #24b09c 100%) !important;
          color: #fff !important;
          box-shadow: 0 4px 12px rgba(13, 153, 151, 0.3) !important;
          transform: translateY(-1px);
        }

        .signup-btn {
          background: transparent !important;
          border: 1px solid #0d9997 !important;
          /* Thinner border for ghost button */
          color: #0d9997 !important;
          font-weight: 600;
          font-size: 13px;
          border-radius: 50px;
          text-transform: uppercase;
          padding: 8px 32px !important;
          /* Wider padding */
          transition: all 0.3s ease;
          white-space: nowrap;
          letter-spacing: 0.3px;
        }

        .signup-btn:hover {
          background: rgba(13, 153, 151, 0.08) !important;
          color: #0d9997 !important;
          box-shadow: none !important;
          transform: translateY(-1px);
        }

        /* Mobile hamburger — clean icon */
        .navbar-toggler {
          border: none;
        }

        .navbar-toggler:focus {
          box-shadow: none;
        }


        /* Mobile drawer — slide-down */
        @media (max-width: 991px) {
          .navbar-collapse {
            background: #fff;
            border-radius: 0 0 16px 16px;
            padding: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
          }
        }

        /* ── Scroll compact: navbar tightens once user scrolls ── */
        .navbar.scrolled {
          box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1) !important;
          padding: 6px 32px !important;
          transition: padding 0.3s ease, box-shadow 0.3s ease;
        }

        .navbar-brand img {
          transition: width 0.3s ease;
        }

        .navbar.scrolled .navbar-brand img {
          width: 150px;
        }

        .navbar-brand {
          padding-top: 0.3125rem;
          padding-bottom: .3125rem;
          font-size: 1.25rem;
          white-space: nowrap;
        }
      </style>

      <header class="fixed-top">


        <!-- Spinner Start -->
        <!--  <div id="spinner" class="show position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
       <div class="spinner-grow text-primary" role="status"></div>
   </div> -->
        <!-- Spinner End -->

        <style>
          .top-utility-bar {
            background-color: #07191E;
            height: 42px;
            font-family: 'Inter', sans-serif;
            position: relative;
            display: flex;
            align-items: center;
          }

          /* Extension down to middle of navbar */
          .top-utility-bar::after {
            content: '';
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            height: 50px;
            background-color: #07191E;
            z-index: 1;
          }

          .top-utility-bar a,
          .top-utility-bar span {
            color: #ffffff;
            font-size: 13px;
            font-weight: 500;
            letter-spacing: 0.3px;
            text-decoration: none;
            transition: color 0.25s ease;
          }

          .top-utility-bar a:hover,
          .top-utility-bar a:hover span {
            color: #0d9997 !important;
            opacity: 1;
          }

          .top-utility-bar .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.15);
            transition: background 0.3s, transform 0.2s;
            color: #ffffff;
            font-size: 12px;
          }

          .top-utility-bar .social-icons a:hover {
            background: rgba(13, 153, 151, 0.35);
            color: #0d9997;
            transform: translateY(-1px);
          }

          /* Container to exactly match the width of the floating navbar */
          .top-utility-container {
            width: 95%;
            max-width: 1500px;
            margin: 0 auto;
            padding-left: 48px;
            padding-right: 48px;
          }

          /* Topbar slide-in animations */
          @keyframes utilityFromLeft {
            from {
              opacity: 0;
              transform: translateX(-24px);
            }

            to {
              opacity: 1;
              transform: translateX(0);
            }
          }

          @keyframes utilityFromRight {
            from {
              opacity: 0;
              transform: translateX(24px);
            }

            to {
              opacity: 1;
              transform: translateX(0);
            }
          }

          .utility-bar-left {
            animation: utilityFromLeft 0.55s cubic-bezier(0.22, 1, 0.36, 1) 0.05s both;
          }

          .utility-bar-right {
            animation: utilityFromRight 0.55s cubic-bezier(0.22, 1, 0.36, 1) 0.15s both;
          }
        </style>
        <div class="top-utility-bar d-flex align-items-center w-100">
          <div class="top-utility-container w-100">
            <div class="row align-items-center w-100 m-0 justify-content-between flex-nowrap">
              <!-- Left: Phone & Email -->
              <div class="col-auto text-start p-0 d-flex align-items-center utility-bar-left"
                style="position: relative; z-index: 2;" id="mobileContactWrapper">
                <div class="d-flex align-items-center pe-2 pe-md-4 contact-phone-wrapper"
                  style="border-right: 1px solid rgba(255,255,255,0.6);">
                  <i class="fas fa-phone-alt me-1 me-md-2 text-white contact-icon"
                    style="font-size: 12px; cursor: pointer;" onclick="toggleMobileContact('phone')"></i>
                  <a href="tel:+917402515544" class="contact-text phone-text"><span style="font-size: 11px;">+91 74025
                      15544</span></a>
                </div>
                <div class="d-flex align-items-center ps-2 ps-md-4 contact-email-wrapper">
                  <i class="fas fa-envelope me-1 me-md-2 contact-icon"
                    style="font-size: 13px; color: #fff; cursor: pointer;" onclick="toggleMobileContact('email')"></i>
                  <a href="mailto:connect@adcapitalinvestment.com" class="contact-text email-text"><span
                      style="font-size: 11px;">connect@adcapitalinvestment.com</span></a>
                </div>
              </div>

              <script>
                function toggleMobileContact(type) {
                  if (window.innerWidth < 576) {
                    var wrapper = document.getElementById('mobileContactWrapper');
                    if (type === 'email') {
                      wrapper.classList.add('show-email');
                    } else {
                      wrapper.classList.remove('show-email');
                    }
                  }
                }
              </script>

              <!-- Right: Social -->
              <div class="col-auto text-end p-0 utility-bar-right" style="position: relative; z-index: 2;">
                <div class="social-icons d-flex justify-content-end align-items-center gap-2 gap-md-3">
                  <span class="d-none d-md-inline" style="font-size: 12px; margin-right: 4px; color: #a1adb2;">Follow
                    us:</span>
                  <a target="_blank" href="https://api.whatsapp.com/send?phone=918667847016">
                    <i class="fab fa-whatsapp"></i>
                  </a>
                  <a target="_blank" href="https://youtube.com/shorts/rWfT_5NitG4?feature=shared">
                    <i class="fab fa-youtube"></i>
                  </a>
                  <a target="_blank"
                    href="https://www.instagram.com/aravind__elangovan?igsh=MWRqcTQxamFtYjg4eQ%3D%3D&utm_source=qr">
                    <i class="fab fa-instagram"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Topbar End -->

        <style>
          /* Floating Navbar overrides */
          .floating-navbar {
            width: 96% !important;
            max-width: 1540px;
            margin: 0px auto !important;
            border-radius: 12px !important;
            padding-left: 48px !important;
            padding-right: 48px !important;
            box-shadow: 0 16px 40px rgba(0, 0, 0, 0.08) !important;
            background: #ffffff !important;
            /* Lock height so it never changes page to page */
            min-height: 100px !important;
            display: flex !important;
            align-items: center !important;
          }

          /* Constrain logo so it never stretches the navbar */
          .floating-navbar .navbar-brand img {
            width: 140px !important;
            height: auto !important;
            max-height: 74px !important;
            object-fit: contain !important;
            display: block !important;
          }


          /* Round Search Icon Button */
          .search-btn-round {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #f3f6f8;
            color: #333;
            text-decoration: none;
            transition: all 0.3s ease;
          }

          .search-btn-round:hover {
            background: #0E9A9A;
            color: #fff;
          }

          @media (max-width: 767px) {
            .top-utility-container {
              padding-left: 15px !important;
              padding-right: 15px !important;
              width: 100% !important;
            }

            .utility-bar-left .pe-4 {
              padding-right: 10px !important;
            }

            .utility-bar-left .ps-4 {
              padding-left: 10px !important;
            }

            .utility-bar-left span {
              font-size: 10px !important;
            }

            .floating-navbar {
              padding-left: 15px !important;
              padding-right: 15px !important;
              width: 100% !important;
            }
          }

          /* Mobile Topbar Toggle Animation */
          @media (max-width: 575px) {
            .contact-text {
              display: inline-block;
              white-space: nowrap;
              overflow: hidden;
              transition: max-width 0.4s cubic-bezier(0.4, 0, 0.2, 1),
                opacity 0.4s ease,
                transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
              vertical-align: middle;
            }

            .utility-bar-left:not(.show-email) .phone-text {
              max-width: 120px;
              opacity: 1;
              transform: translateX(0);
            }

            .utility-bar-left:not(.show-email) .email-text {
              max-width: 0px;
              opacity: 0;
              transform: translateX(-10px);
              pointer-events: none;
            }

            .utility-bar-left.show-email .phone-text {
              max-width: 0px;
              opacity: 0;
              transform: translateX(-10px);
              pointer-events: none;
            }

            .utility-bar-left.show-email .email-text {
              max-width: 190px;
              opacity: 1;
              transform: translateX(0);
            }
          }

          @media (min-width: 576px) {
            .contact-text {
              max-width: none !important;
              opacity: 1 !important;
              transform: none !important;
            }
          }
        </style>

        <div class="top-utility-bg-extension"
          style="position: absolute; top: 42px; left: 0; width: 100%; height: 50px; background-color: #07191E; z-index: 1010; border-bottom: 3px solid #0d9997;">
        </div>
        <!-- We use a wrapper to keep the floating navbar positioned correctly -->
        <div class="navbar-wrapper w-100" style="position: absolute; top: 42px; left: 0; z-index: 1020;">
          <nav class="navbar navbar-expand-lg navbar-light floating-navbar">
            <a href="/" class="navbar-brand p-0">
              <img src="/images/logo/logo1.png" style="width: 140px;">
            </a>
            <div class="d-flex align-items-center d-xl-none gap-3 pe-2">
                <a href="https://adcapital.themfbox.com/" style="color: #0d9997; font-size: 24px; text-decoration: none; display: flex; align-items: center;" title="User Account">
                    <i class="far fa-user-circle"></i>
                </a>
                <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                  style="color: #0d9997; padding: 4px 8px; border: none; box-shadow: none;">
                  <i class="fas fa-bars" style="font-size: 24px;"></i>
                </button>
            </div>
            <div class="collapse navbar-collapse bg-transparent" id="navbarCollapse">
              <div class="navbar-nav ms-auto mx-xl-auto p-0">
                <a href="/" class="nav-item nav-link">Home</a>
                <a href="/aboutus" class="nav-item nav-link">About Us</a>
                <!-- <a href="/services" class="nav-item nav-link">Services</a> -->
                <!-- <div class="nav-item dropdown">
                           <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Services</a>
                           <div class="dropdown-menu rounded">
                               <a href="/services/mutual-fund" class="dropdown-item">Mutual fund's</a>
                               <a href="/services/life-insurance" class="dropdown-item">Life Insurance</a>
                                <a href="/services/health-insurance" class="dropdown-item">Health Insurance</a>
                               <a href="/services/vehicle-Insurance" class="dropdown-item">Vehicle Insurance</a>
                                <a href="/services/general-insurance" class="dropdown-item">General and Property Insurance</a>
                                <a href="/services/bonds" class="dropdown-item">Bond's</a>
                                <a href="/services/loans" class="dropdown-item">Loan</a>
                                <a href="/services/portfolio-management-schemes" class="dropdown-item">PMS</a>
                                <a href="/services/pan-services" class="dropdown-item">Pan Services</a>
                                <a href="/services/incometax-returns-filing" class="dropdown-item">Income Tax Returns Filing</a>
                                <a href="/services/credit-card" class="dropdown-item">Credit Card </a>
                                
                           </div>
                       </div> -->
                <!-- <a href="project.html" class="nav-item nav-link">Projects</a> -->
                <!-- <ul class="p-0" style="list-style:none;">
                       		<li class="nav-item"> <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MF Research</a>
								<ul class="dropdown-menu mega-menu">
									<li class="mega-menu-content">
										<div class="row gx-0 gx-lg-3" id="drpMenu">									
											<div class="col-lg-4">
												
												<ul class="list-unstyled pb-lg-1">
													<li><a href="/mutual-funds-research/mutual-fund-lumpsum-returns-calculator" class="dropdown-item">Mutual Fund Lumpsum Return Calculator</a></li>
                                					<li><a href="/mutual-funds-research/mutual-fund-sip-investment-calculator" class="dropdown-item">Mutual Fund SIP Calculator</a></li>
												</ul>
												</div>
												<div class="col-lg-4">
												<ul class="list-unstyled">
													<li><a href="/mutual-funds-research/stp-calculator-profit-transfer" class="dropdown-item">STP Calculator Profit Transfer</a></li>
                               						<li><a href="/mutual-funds-research/top-performing-mutual-funds" class="dropdown-item">Mutual Fund Trailing Returns</a></li>
												</ul>
											</div>
											/column
											<div class="col-lg-4">
												
												<ul class="list-unstyled">
																		<li><a href="/mutual-funds-research/mutual-fund-information" class="dropdown-item">Mutual Fund Information</a></li>
                              
                               						<li><a href="/mutual-funds-research/mutual-fund-comparison-with-asset-classes" class="dropdown-item">MF Comparison with Asset Classes</a></li>
													
												</ul>
												</div>	
												<div class="col-lg-4">
												
												<ul class="list-unstyled">
												<li><a href="/mutual-funds-research/top-swp-funds" class="dropdown-item">Top SWP Funds</a></li>
                               						<li><a href="/mutual-funds-research/mutual-fund-stp-investment-calculator" class="dropdown-item">Mutual Fund STP Calculator</a></li>
													
												</ul>
												</div>	
												<div class="col-lg-4">
												
												<ul class="list-unstyled ">
												<li><a href="/mutual-funds-research/mutual-fund-category-returns" class="dropdown-item">Mutual Fund Category Returns</a></li>
                              					 <li><a href="/mutual-funds-research/latest-NAV-mutual-funds" class="dropdown-item">Latest Nav</a></li>
													
												</ul>
												
											</div>	
																											
											/column
										</div> /.row
									</li>
									/.mega-menu-content
								</ul> /.dropdown-menu
							</li>
                       </ul> -->
                <div class="nav-item dropdown">
                  <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Services</a>
                  <div class="dropdown-menu rounded">
                    <a href="/services/mutual-fund" class="dropdown-item">Mutual Fund Advisory</a>
                    <a href="/services/child-education" class="dropdown-item">Exclusive Child Education planning</a>
                    <a href="/services/goal-planning" class="dropdown-item">Goal-Oriented Financial Planning</a>
                    <a href="/services/retirement-planning" class="dropdown-item">Retirement Planning for a Secured
                      Future</a>
                    <a href="/services/financial-planning" class="dropdown-item">Expert Financial Consulting</a>
                    <a href="/services/health-insurance" class="dropdown-item">Insurance</a>
                  </div>
                </div>
                <div class="nav-item dropdown">
                  <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MF Research</a>
                  <div class="dropdown-menu rounded">
                    <a target="_blank" href="/mutual-funds-research/sip-with-annual-increase" class="dropdown-item">SIP
                      with Annual Increase</a>
                    <a target="_blank" href="/mutual-funds-research/rolling-return-vs-benchmark"
                      class="dropdown-item">Rolling Returns vs Benchmark</a>
                    <a target="_blank"
                      href="/mutual-funds-research/mutual-fund-rolling-returns-comparison-with-gold-and-sensex"
                      class="dropdown-item">Rolling Returns vs Sensex & Gold</a>
                    <a target="_blank" href="/mutual-funds-research/top-consistent-mutual-fund-performers"
                      class="dropdown-item">Top Consistent Mutual Fund Performers</a>
                    <a target="_blank" href="/mutual-funds-research/mutual-fund-portfolio-overlap"
                      class="dropdown-item">Mutual Fund Portfolio Overlap</a>
                    <a target="_blank" href="/mutual-funds-research/best-performing-mutual-funds"
                      class="dropdown-item">Mutual Fund Selectors</a>
                    <a target="_blank" href="/mutual-funds-research/mutual-fund-swp-investment-calculator"
                      class="dropdown-item">Mutual Fund SWP Calculator</a>
                    <a target="_blank" href="/mutual-funds-research/top-performing-mutual-funds"
                      class="dropdown-item">Mutual Fund Trailing Returns</a>
                  </div>
                </div>
                <div class="nav-item dropdown">
                  <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Calculators</a>
                  <div class="dropdown-menu rounded">
                    <a target="_blank" href="/tools-and-calculators/become-a-crorepati" class="dropdown-item">Become a
                      Crorepati</a>
                    <a href="/tools-and-calculators/mutual-fund-sip-calculator-step-up" class="dropdown-item">SIP
                      Calculator Step Up</a>
                    <!-- <a target="_blank" href="/tools-and-calculators/sip-with-annual-increase" class="dropdown-item">SIP with Annual Increase</a> -->
                    <a target="_blank" href="/tools-and-calculators/target-amount-sip-calculator"
                      class="dropdown-item">Target Amount SIP Calculator</a>
                    <a target="_blank" href="/tools-and-calculators/future-value-inflation-calculator"
                      class="dropdown-item">Future Value Calculator</a>
                    <a target="_blank" href="/tools-and-calculators/asset-allocation" class="dropdown-item">Asset
                      Allocation Calculator</a>
                    <a target="_blank" href="/tools-and-calculators/human-life-value-calculator"
                      class="dropdown-item">Human Life Value Calculator</a>
                    <a target="_blank" href="/tools-and-calculators/children-education-planner"
                      class="dropdown-item">Child Education Planner</a>
                    <a target="_blank" href="/tools-and-calculators/lumpsum-calculator" class="dropdown-item">Lumpsum
                      Calculator</a>
                  </div>
                </div>
                <!--  <div class="nav-item dropdown">
                           <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MF Research</a>
                           <div class="dropdown-menu rounded">
                               <a href="/mutual-funds-research/mutual-fund-lumpsum-returns-calculator" class="dropdown-item">Mutual Fund Lumpsum Return Calculator</a>
                                <a href="/mutual-funds-research/mutual-fund-sip-investment-calculator" class="dropdown-item">Mutual Fund SIP Calculator</a>
                               <a href="/mutual-funds-research/top-swp-funds" class="dropdown-item">Top SWP Funds</a>
                               <a href="/mutual-funds-research/mutual-fund-stp-investment-calculator" class="dropdown-item">Mutual Fund STP Calculator</a>
                               <a href="/mutual-funds-research/stp-calculator-profit-transfer" class="dropdown-item">STP Calculator Profit Transfer</a>
                               <a href="/mutual-funds-research/top-performing-mutual-funds" class="dropdown-item">Mutual Fund Trailing Returns</a>
                               <a href="/mutual-funds-research/mutual-fund-category-returns" class="dropdown-item">Mutual Fund Category Returns</a>
                               <a href="/mutual-funds-research/latest-NAV-mutual-funds" class="dropdown-item">Latest Nav</a>
                               <a href="/mutual-funds-research/mutual-fund-information" class="dropdown-item">Mutual Fund Information</a>
                              
                               <a href="/mutual-funds-research/mutual-fund-comparison-with-asset-classes" class="dropdown-item">Mutual Fund Lumpsum Returns</a>
                           </div>
                       </div> -->
                <!-- <div class="nav-item dropdown">
                           <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Calculators</a>
                           <div class="dropdown-menu rounded">
                           		<a href="/tools-and-calculators/mutual-fund-sip-calculator-step-up" class="dropdown-item">SIP Calculator Step Up</a>
                           		<a href="/tools-and-calculators/goal-based-top-up-sip" class="dropdown-item">Goal based Top Up SIP</a>
                           		<a href="/tools-and-calculators/personal-loan-emi-calculator" class="dropdown-item">Personal EMI Calculator</a>
                           		<a href="/tools-and-calculators/lumpsum-target-calculator" class="dropdown-item">Lumpsum Target Calculator</a>
                           		<a href="/tools-and-calculators/lumpsum-calculator" class="dropdown-item">Lumpsum Calculator</a>
                           		<a href="/tools-and-calculators/future-value-inflation-calculator" class="dropdown-item">Future Value Calculator</a>
                           		<a href="/tools-and-calculators/children-education-planner" class="dropdown-item">Children Education Planner</a>
                           		<a href="/tools-and-calculators/save-more-by-spending-less-calculator" class="dropdown-item">Spending Less Calculator</a>
                           		<a href="/tools-and-calculators/networth-calculator" class="dropdown-item">Networth Calculator</a>
                           		<a href="/tools-and-calculators/human-life-value-calculator" class="dropdown-item">Human Life Value Calculator</a>
                           
                               <a href="/tools-and-calculators/become-a-crorepati" class="dropdown-item">Become A Crorepati</a>
                               <a href="/tools-and-calculators/systematic-investment-plan-calculator" class="dropdown-item">SIP Return Calculator</a>
                               <a href="/tools-and-calculators/retirement-planning-calculator" class="dropdown-item">Retirement Planning Calculator</a>
                               <a href="/tools-and-calculators/mutual-fund-sip-calculator-step-up" class="dropdown-item">SIP Calculator Step Up</a>
                               <a href="/tools-and-calculators/lumpsum-target-calculator" class="dropdown-item">Lumpsum Target Calculator</a>
                               <a href="/tools-and-calculators/target-amount-sip-calculator" class="dropdown-item">Target Amount SIP Calculator</a>
                           </div>
                       </div> -->
                <div class="nav-item dropdown">
                  <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Articles</a>
                  <div class="dropdown-menu rounded">
                    <a href="/blog" class="dropdown-item">Blog</a>
                    <a href="/news" class="dropdown-item">News</a>
                  </div>
                </div>
                <a href="/contactus" class="nav-item nav-link">Contacts</a>
                <a href="/important-books-and-links" class="nav-item nav-link">Links</a>
              </div>
            </div>
            <div class="d-none d-xl-flex flex-shirink-0">
              <!-- <div id="phone-tada" class="d-flex align-items-center justify-content-center me-4">
                       <a href="" class="position-relative animated tada infinite">
                           <i class="fa fa-phone-alt fa-2x"></i>
                           <div class="position-absolute" style="top: -7px; left: 20px;">
                               <span><i class="fa fa-comment-dots text-secondary"></i></span>
                           </div>
                       </a>
                   </div>
                   <div class="d-flex flex-column pe-4 border-end">
                       <span class="">Have any questions?</span>
                       <span class="text-secondary">Call: + 0123 456 7890</span>
                   </div> -->
              <!-- <div class="d-flex align-items-center justify-content-center ms-4 ">
                       <a href="#"><i class="bi bi-search fa-2x"></i> </a>
                   </div> -->

              <c:choose>
                <c:when test="${accountMap != null}">
                  <nav class="navbar navbar-expand-lg sticky-navbar"
                    style="height:60px; background: transparent;color:#fff;">
                    <div class="collapse navbar-collapse" id="mainNavigation">
                      <ul class="navbar-nav ml-auto mr-auto">
                        <li class="nav__item has-dropdown">
                          <a href="#" data-toggle="dropdown" class="dropdown-toggle nav__item-link"
                            style="color:#fff;"><i class="fa fa-user" aria-hidden="true"></i> &nbsp;
                            ${accountMap.firstname}<span class="caret"></span></a>
                          <c:choose>
                            <c:when test="${accountMap.usertypeid eq '1'}">
                              <ul class="dropdown-menu header-menu">
                                <li class="nav__item">
                                  <a class="nav__item-link" href="<c:url value=" /" />"><i
                                    class="fa fa-home fa-fw"></i>&nbsp; Home</a>
                                  <a class="nav__item-link" href="<c:url value="
                                    http://shilpaassociates.themfbox.com/investor" />"><i
                                    class="fa fa-laptop fa-fw"></i> &nbsp; Dashboard</a>
                                  <a class="nav__item-link" href="<c:url value="
                                    http://shilpaassociates.themfbox.com/investor/profile" />"><i
                                    class="fa fa-user fa-fw"></i> &nbsp; Profile</a>
                                  <a class="nav__item-link" href="<c:url value="
                                    http://shilpaassociates.themfbox.com/investor/investor-settings" />"><i
                                    class="fa fa-cog"></i> &nbsp; Settings</a>
                                  <a class="nav__item-link" href="/logout"><i class="fas fa-sign-out-alt"></i> &nbsp;
                                    Logout</a>
                                </li>
                              </ul>
                            </c:when>
                            <c:when
                              test="${accountMap.usertypeid eq '2' || accountMap.usertypeid eq '4' || accountMap.usertypeid eq '7'}">
                              <ul class="dropdown-menu header-menu">
                                <li class="nav__item">
                                  <a class="dropdown-item" href="<c:url value=" /" />"><i
                                    class="fa fa-home fa-fw"></i>&nbsp; Home</a>
                                  <a class="dropdown-item" href="<c:url value="
                                    http://shilpaassociates.themfbox.com/rm/investor/search" />"><i
                                    class="fa fa-user fa-fw"></i> &nbsp; Investor Search</a>
                                  <a class="dropdown-item" href="<c:url value="
                                    http://shilpaassociates.themfbox.com/rm/investor/settings" />"><i
                                    class="fa fa-cog fa-fw"></i>&nbsp; Settings</a>
                                  <a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt"></i> &nbsp;
                                    Logout</a>
                                </li>
                              </ul>
                            </c:when>
                            <c:when test="${accountMap.usertypeid eq '3'}">
                              <ul class="dropdown-menu header-menu">
                                <li class="nav__item">
                                  <a class="dropdown-item" href="<c:url value=" /" />"><i class="fa fa-home fa-fw"></i>
                                  &nbsp; Home</a>
                                  <a class="dropdown-item" href="<c:url value="
                                    http://shilpaassociates.themfbox.com/family/portfolio" />"> <i
                                    class="fa fa-laptop fa-fw"></i>&nbsp; Dashboard</a>
                                  <a class="dropdown-item" href="<c:url value="
                                    http://shilpaassociates.themfbox.com/family/change-password" />"><i
                                    class="fa fa-cog fa-fw"></i> &nbsp; Settings</a>
                                  <a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt"></i> &nbsp;
                                    Logout</a>
                                </li>
                              </ul>
                            </c:when>
                            <c:when test="${accountMap.usertypeid eq '5'}">
                              <ul class="dropdown-menu header-menu">
                                <li class="nav__item">
                                  <a class="dropdown-item" href="<c:url value=" /" />"><i class="fa fa-home fa-fw"></i>
                                  &nbsp; Home</a>
                                  <a class="dropdown-item" href="<c:url value="
                                    http://shilpaassociates.themfbox.com/admin" />"><i class="fa fa-laptop fa-fw"></i>
                                  &nbsp; Dashboard</a>
                                  <a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt"></i> &nbsp;
                                    Logout</a>
                                </li>
                              </ul>
                            </c:when>
                          </c:choose>
                        </li><!-- /.nav-item -->
                      </ul><!-- /.navbar-nav -->
                      <button class="close-mobile-menu d-block d-lg-none"><i class="fas fa-times"></i></button>
                    </div><!-- /.navbar-collapse -->
                  </nav>
                </c:when>
                <c:otherwise>
                  <div class="d-flex align-items-center gap-3">


                    <div>
                      <a href="https://adcapital.themfbox.com/signup" class="btn signup-btn">
                        REGISTER
                      </a>
                    </div>
                    <div>
                      <a href="https://adcapital.themfbox.com/" class="btn login-btn d-flex align-items-center gap-2">
                        LOGIN <i class="fas fa-arrow-right" style="font-size: 12px;"></i>
                      </a>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>

          </nav>
        </div>
        <!-- Navbar End -->
      </header>

      <script>
        (function () {
          // Prevent browser scroll restoration on reload — ensures page always
          // starts at top:0 so the fixed header is fully visible from the first paint.
          if ('scrollRestoration' in history) {
            history.scrollRestoration = 'manual';
          }
          window.scrollTo(0, 0);

          var navbar = document.querySelector('.navbar');
          if (!navbar) return;

          // NOTE: .scrolled class toggling is handled centrally in layout.jsp
          // to avoid duplicate passive scroll listeners on every page.

          // Smooth page-load reveal via CSS keyframes (no inline transforms)
          // defined in the <style> block above

        })();
      </script>