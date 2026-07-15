<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

      <style>
        /* ── PAGE HERO (Removed inline styles, now using global .page-hero-curved) ── */

        /* ── MV CARD STYLE ─────────────────────────────── */
        .mv-card {
          background: #fff;
          border-radius: 20px;
          border: 1px solid #f0f0f0;
          box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
          padding: 40px;
          transition: all 0.4s ease;
          position: relative;
          z-index: 1;
          height: 100%;
        }

        .mv-card:hover {
          transform: translateY(-5px);
          box-shadow: 0 20px 50px rgba(0, 152, 153, 0.12);
          border-color: rgba(0, 152, 153, 0.2);
        }

        /* ── TABS ─────────────────────────────── */
        .custom-nav-pills {
          justify-content: center;
          gap: 10px;
          margin-bottom: 40px;
        }

        .custom-nav-pills .nav-link {
          padding: 12px 30px;
          border-radius: 50px;
          font-weight: 600;
          color: #6b7280;
          background: #f3f4f6;
          transition: all 0.3s ease;
          border: none;
        }

        .custom-nav-pills .nav-link:hover {
          background: #e5e7eb;
          color: #1a1f2e;
        }

        .custom-nav-pills .nav-link.active {
          background: linear-gradient(135deg, #009899 0%, #0085A1 100%);
          color: #fff;
          box-shadow: 0 10px 20px rgba(0, 152, 153, 0.2);
        }

        .resource-link {
          color: #009899;
          text-decoration: none;
          font-weight: 600;
          font-size: 1.1rem;
          transition: color 0.3s;
        }

        .resource-link:hover {
          color: #0085A1;
        }

        .resource-icon {
          width: 60px;
          height: 60px;
          border-radius: 12px;
          background: rgba(0, 152, 153, 0.1);
          display: flex;
          align-items: center;
          justify-content: center;
          margin-bottom: 20px;
        }

        .resource-icon i {
          font-size: 24px;
          color: #009899;
        }

        /* ── TAB CARD SLIDE-IN ANIMATION ─────────────────── */
        @keyframes cardSlideIn {
          from {
            opacity: 0;
            transform: translateY(30px);
          }

          to {
            opacity: 1;
            transform: translateY(0);
          }
        }

        /* When a tab-pane is shown (Bootstrap adds .show.active), 
           each sr-child card inside it animates in one by one */
        .tab-pane.show.active .sr-child {
          animation: cardSlideIn 0.55s cubic-bezier(0.25, 1, 0.5, 1) both;
        }

        /* Stagger delays for up to 12 cards */
        .tab-pane.show.active .sr-child:nth-child(1) {
          animation-delay: 0.05s;
        }

        .tab-pane.show.active .sr-child:nth-child(2) {
          animation-delay: 0.15s;
        }

        .tab-pane.show.active .sr-child:nth-child(3) {
          animation-delay: 0.25s;
        }

        .tab-pane.show.active .sr-child:nth-child(4) {
          animation-delay: 0.35s;
        }

        .tab-pane.show.active .sr-child:nth-child(5) {
          animation-delay: 0.45s;
        }

        .tab-pane.show.active .sr-child:nth-child(6) {
          animation-delay: 0.55s;
        }

        .tab-pane.show.active .sr-child:nth-child(7) {
          animation-delay: 0.65s;
        }

        .tab-pane.show.active .sr-child:nth-child(8) {
          animation-delay: 0.75s;
        }

        .tab-pane.show.active .sr-child:nth-child(9) {
          animation-delay: 0.85s;
        }

        .tab-pane.show.active .sr-child:nth-child(10) {
          animation-delay: 0.95s;
        }

        .tab-pane.show.active .sr-child:nth-child(11) {
          animation-delay: 1.05s;
        }

        .tab-pane.show.active .sr-child:nth-child(12) {
          animation-delay: 1.15s;
        }
      </style>

      <!-- ── PAGE HERO ──────────────────────────────────────────────── -->
      <div class="page-hero-curved">
        <div class="container text-center position-relative" style="z-index:2">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-3 justify-content-center sr-reveal" data-sr-reveal-delay="0.2s">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Links And Books</li>
            </ol>
          </nav>
          <div class="text-center">
            <span class="category-label sr-reveal" data-sr-reveal-delay="0.1s">Resources</span>
            <h1 class="sr-reveal mt-2 mb-0" data-sr-reveal-delay="0.1s"
              style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Links And Books</h1>
          </div>
        </div>
        <div class="page-hero-curve-bottom"></div>
      </div>

      <section style="padding: 80px 0; background: #fafafa;">
        <div class="container">
          <ul class="nav nav-pills custom-nav-pills sr-reveal" data-sr-reveal-delay="0.1s" id="pills-tab"
            role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link ${activeTab == 'links' ? '' : 'active'}" id="pills-process-tab" data-bs-toggle="pill" data-bs-target="#pills-process"
                type="button" role="tab" aria-controls="pills-process" aria-selected="${activeTab != 'links'}">Our Process</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link ${activeTab == 'links' ? 'active' : ''}" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
                type="button" role="tab" aria-controls="pills-home" aria-selected="${activeTab == 'links'}">Important Links</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile"
                type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Recommended Books</button>
            </li>
          </ul>

          <div class="tab-content sr-section" data-sr-reveal-delay="0.2s" id="pills-tabContent">

            <!-- LINKS TAB -->
            <div class="tab-pane fade ${activeTab == 'links' ? 'show active' : ''}" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
              <div class="row g-4">
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://zerodha.com/varsity/" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3" style="max-height:120px;" src="/img/online.png" alt="Knowledge">
                    </a>
                    <a class="resource-link" href="https://zerodha.com/varsity/" target="_blank">Online Knowledge
                      Content</a>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://www.nseindia.com/" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3" style="max-height:120px;" src="/img/nse.png" alt="NSE">
                    </a>
                    <a class="resource-link" href="https://www.nseindia.com/" target="_blank">NSE - Exchange</a>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://www.bseindia.com/" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3" style="max-height:120px;" src="/img/bse.png" alt="BSE">
                    </a>
                    <a class="resource-link" href="https://www.bseindia.com/" target="_blank">BSE - Exchange</a>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://www.tradingview.com/chart" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3" style="max-height:120px;" src="/img/analyse.png" alt="Analyse">
                    </a>
                    <a class="resource-link" href="https://www.tradingview.com/chart" target="_blank">Stock Analysis</a>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://www.screener.in/" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3" style="max-height:120px;" src="/img/stock.png" alt="Screener">
                    </a>
                    <a class="resource-link" href="https://www.screener.in/" target="_blank">Screener.in</a>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://www.tickertape.in/" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3" style="max-height:120px;" src="/img/tick.png" alt="Tickertape">
                    </a>
                    <a class="resource-link" href="https://www.tickertape.in/" target="_blank">Tickertape.in</a>
                  </div>
                </div>
              </div>
            </div>

            <!-- BOOKS TAB -->
            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
              <div class="row g-4">
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://amzn.in/d/4b6Uka7" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3 shadow-sm" style="max-height:200px;" src="/img/richdad.png"
                        alt="Rich Dad Poor Dad">
                    </a>
                    <a class="resource-link" href="https://amzn.in/d/4b6Uka7" target="_blank">Rich Dad Poor Dad</a>
                    <p class="text-muted mt-2 mb-0" style="font-size:0.9rem;">Robert Kiyosaki</p>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://amzn.in/d/eFrvNyg" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3 shadow-sm" style="max-height:200px;" src="/img/think.png"
                        alt="Think and Grow Rich">
                    </a>
                    <a class="resource-link" href="https://amzn.in/d/eFrvNyg" target="_blank">Think and Grow Rich</a>
                    <p class="text-muted mt-2 mb-0" style="font-size:0.9rem;">Napoleon Hill</p>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://amzn.in/d/b72wYjJ" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3 shadow-sm" style="max-height:200px;" src="/img/sycology.png"
                        alt="Psychology of Money">
                    </a>
                    <a class="resource-link" href="https://amzn.in/d/b72wYjJ" target="_blank">The Psychology of
                      Money</a>
                    <p class="text-muted mt-2 mb-0" style="font-size:0.9rem;">Morgan Housel</p>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://amzn.in/d/0cW2avt" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3 shadow-sm" style="max-height:200px;" src="/img/itelligent.png"
                        alt="Intelligent Investor">
                    </a>
                    <a class="resource-link" href="https://amzn.in/d/0cW2avt" target="_blank">The Intelligent
                      Investor</a>
                    <p class="text-muted mt-2 mb-0" style="font-size:0.9rem;">Benjamin Graham</p>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://amzn.in/d/9mydsn3" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3 shadow-sm" style="max-height:200px;" src="/img/coffee.png"
                        alt="Coffee Can Investing">
                    </a>
                    <a class="resource-link" href="https://amzn.in/d/9mydsn3" target="_blank">Coffee Can Investing</a>
                    <p class="text-muted mt-2 mb-0" style="font-size:0.9rem;">Saurabh Mukherjea</p>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 sr-child">
                  <div class="mv-card text-center">
                    <a href="https://amzn.in/d/1JLYNAT" target="_blank" class="d-block mb-3">
                      <img class="img-fluid rounded-3 shadow-sm" style="max-height:200px;" src="/img/oneup.png"
                        alt="One Up On Wall Street">
                    </a>
                    <a class="resource-link" href="https://amzn.in/d/1JLYNAT" target="_blank">One Up On Wall Street</a>
                    <p class="text-muted mt-2 mb-0" style="font-size:0.9rem;">Peter Lynch</p>
                  </div>
                </div>
              </div>
            </div>

            <!-- PROCESS TAB -->
            <div class="tab-pane fade ${activeTab == 'links' ? '' : 'show active'}" id="pills-process" role="tabpanel" aria-labelledby="pills-process-tab">
              <div class="row g-5">
                <div class="col-12 sr-child">
                  <div class="mv-card">
                    <h3 class="mb-4"><span style="color:#009899;">Step 1:</span> Ensure Appropriate Life Cover</h3>
                    <p class="text-muted mb-4">Protect your family's future with affordable term insurance. It provides financial support and peace of mind when your loved ones need it most.</p>
                    <img class="img-fluid rounded-3 shadow-sm mx-auto d-block" src="/images/process/step1.png" alt="Step 1">
                  </div>
                </div>
                <div class="col-12 sr-child">
                  <div class="mv-card">
                    <h3 class="mb-4"><span style="color:#009899;">Step 2:</span> Define Financial Goals</h3>
                    <p class="text-muted mb-4">Goals are grouped into short-, medium-, and long-term categories as a general guide. You can modify them anytime to suit your personal financial needs.</p>
                    <img class="img-fluid rounded-3 shadow-sm mx-auto d-block" src="/images/process/step2.png" alt="Step 2">
                  </div>
                </div>
                <div class="col-12 sr-child">
                  <div class="mv-card">
                    <h3 class="mb-4"><span style="color:#009899;">Step 3:</span> Goal-Based Financial Planning</h3>
                    <p class="text-muted mb-4">Every financial goal deserves a dedicated plan. Goal-based financial planning helps align your investments with your short-, medium-, and long-term objectives.</p>
                    <img class="img-fluid rounded-3 shadow-sm mx-auto d-block" src="/images/process/step3.png" alt="Step 3">
                  </div>
                </div>
                <div class="col-12 sr-child">
                  <div class="mv-card">
                    <h3 class="mb-4"><span style="color:#009899;">Step 4:</span> Calculate Retirement Corpus</h3>
                    <p class="text-muted mb-4">A well-planned retirement ensures financial security and peace of mind for you and your family. Consistent investing today helps create a comfortable tomorrow.</p>
                    <img class="img-fluid rounded-3 shadow-sm mx-auto d-block" src="/images/process/step4.png" alt="Step 4">
                  </div>
                </div>
                <div class="col-12 sr-child">
                  <div class="mv-card">
                    <h3 class="mb-4"><span style="color:#009899;">Step 5:</span> Risk Profile Analysis</h3>
                    <p class="text-muted mb-4">Understanding your risk profile is the foundation of smart investing. A proper risk analysis helps balance potential returns with an acceptable level of risk.</p>
                    <img class="img-fluid rounded-3 shadow-sm mx-auto d-block" src="/images/process/step5.png" alt="Step 5">
                  </div>
                </div>
                <div class="col-12 sr-child">
                  <div class="mv-card">
                    <h3 class="mb-4"><span style="color:#009899;">Step 6:</span> Building Your Investment Portfolio</h3>
                    <p class="text-muted mb-4">Asset allocation spreads your investments across different asset classes to manage risk and improve long-term returns. A well-balanced portfolio stays aligned with your financial goals and risk profile.</p>
                    <img class="img-fluid rounded-3 shadow-sm mx-auto d-block" src="/images/process/step6.png" alt="Step 6">
                  </div>
                </div>
                <div class="col-12 sr-child">
                  <div class="mv-card">
                    <h3 class="mb-4"><span style="color:#009899;">Step 7:</span> Initiate the SIP with Step-up</h3>
                    <p class="text-muted mb-4">After your confirmation, we will initiate your SIP. Stay updated on your portfolio anytime with convenient web and mobile access across iOS and Android devices.</p>
                    <img class="img-fluid rounded-3 shadow-sm mx-auto d-block" src="/images/process/step7.png" alt="Step 7">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <script>
        /* Re-trigger sr-child slide-in on every Bootstrap tab switch */
        document.addEventListener('DOMContentLoaded', function () {
          var tabEls = document.querySelectorAll('[data-bs-toggle="pill"]');
          tabEls.forEach(function (tabEl) {
            tabEl.addEventListener('shown.bs.tab', function (event) {
              var targetId = event.target.getAttribute('data-bs-target');
              var pane = document.querySelector(targetId);
              if (!pane) return;
              // Force animation replay: remove & re-add sr-child class on all children
              var cards = pane.querySelectorAll('.sr-child');
              cards.forEach(function (card) {
                card.classList.remove('sr-child');
                // Reflow trick — reading offsetHeight forces the browser to apply the removal
                void card.offsetHeight;
                card.classList.add('sr-child');
              });
            });
          });
        });
      </script>