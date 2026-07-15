<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://code.iconify.design/iconify-icon/1.0.2/iconify-icon.min.js"></script>
<script src="https://kit.fontawesome.com/c36903e4bc.js" crossorigin="anonymous"></script>

<style>
.just-content {
  text-align: justify;
}

/* ── Premium Accordion ─────────────────────────────── */
.premium-accordion .accordion-item {
  background: #fff;
  border: 1px solid #f3f4f6;
  border-radius: 16px !important;
  margin-bottom: 20px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.02);
  overflow: hidden;
  transition: all 0.3s ease;
}
.premium-accordion .accordion-item:hover {
  border-color: rgba(0, 152, 153, 0.2);
  box-shadow: 0 10px 25px rgba(0,0,0,0.04);
}
.premium-accordion .accordion-button {
  background: transparent;
  border: none;
  padding: 24px 30px;
  font-size: 1.15rem;
  font-weight: 600;
  color: #1a1f2e;
  box-shadow: none !important;
}
.premium-accordion .accordion-button:not(.collapsed) {
  color: #009899;
  background: rgba(0, 152, 153, 0.02);
}
.premium-accordion .accordion-button::after {
  background-size: 1.2rem;
  transition: transform 0.3s ease;
}
.premium-accordion .accordion-body {
  padding: 0 30px 30px;
  color: #4b5563;
  font-size: 1.05rem;
  line-height: 1.7;
  background: rgba(0, 152, 153, 0.02);
}
/* ── CTA Section ─────────────────────────────── */
.support-cta-section {
  background: linear-gradient(135deg, #f8f9fa 0%, #eef1f6 100%);
  border-radius: 24px;
  padding: 50px 40px;
  text-align: center;
  margin-top: 60px;
  border: 1px solid #e5e7eb;
}
.support-cta-section h3 {
  color: #1a1f2e;
  font-weight: 700;
  font-size: 2rem;
  margin-bottom: 15px;
}
.support-cta-section p {
  color: #4b5563;
  font-size: 1.1rem;
  max-width: 500px;
  margin: 0 auto 30px;
}
.cta-buttons {
  display: flex;
  justify-content: center;
  gap: 15px;
}
.btn-primary-premium {
  background: #009899;
  color: #fff;
  padding: 14px 32px;
  border-radius: 50px;
  font-weight: 600;
  text-decoration: none;
  transition: all 0.3s;
  box-shadow: 0 4px 15px rgba(0, 152, 153, 0.3);
}
.btn-primary-premium:hover {
  background: #007677;
  color: #fff;
  transform: translateY(-2px);
}
.gift-label {
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
</style>


<!-- Main -->
<main>

    <!-- Page Title -->
    <div class="page-hero-curved sr-section no-reverse">
        <div class="container text-center position-relative" style="z-index:2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-3 justify-content-center sr-child">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="/services">Services</a></li>
                    <li class="breadcrumb-item active" aria-current="page">GIFT City</li>
                </ol>
            </nav>
            <div class="text-center">
                <span class="category-label sr-child">Global Investment</span>
                <h1 class="mt-2 mb-0 sr-child" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">GIFT City</h1>
                <p class="sr-child mt-3 text-center mx-auto" style="font-size: 1.1rem; color: #4b5563; max-width: 600px;">Investment Services for NRI's &amp; Resident Indians</p>
            </div>
        </div>
        <div class="page-hero-curve-bottom"></div>
    </div>
    <!-- End Page Title -->

    <!-- Main Section -->
    <section style="padding: 80px 0 20px; background: #fff;">
        <div class="container">

            <!-- Intro Block -->
            <div class="row align-items-start mb-5 pb-2 sr-section">
                <div class="col-lg-10 mx-auto">
                    <h2 class="sr-child" style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 24px;">
                        Access Global Investment Opportunities Through India's International Financial Services Centre (IFSC)
                    </h2>

                    <div class="sr-child" style="background: rgba(0, 152, 153, 0.05); border-left: 4px solid #009899; padding: 20px; border-radius: 0 12px 12px 0; margin-bottom: 30px;">
                        <p style="color: #009899; font-size: 1.1rem; line-height: 1.7; margin-bottom: 0; font-weight: 500; font-style: italic;">
                            "Whether your goal is to build wealth in US Dollars and global currencies, diversify beyond Indian markets, or create a globally balanced portfolio, our experienced advisors provide end-to-end support—from onboarding to portfolio management."
                        </p>
                    </div>

                    <p class="sr-child" style="color: #6b7280; font-size: 16px; line-height: 1.8; margin-bottom: 20px;">
                        Expand your investment horizon with GIFT City (Gujarat International Finance Tec-City). At A D Capital Investment, we help NRIs, OCIs, and eligible resident Indians access international investment opportunities through India's world-class International Financial Services Centre (IFSC).
                    </p>
                </div>
            </div>

            <!-- Infographics Section 1 -->
            <div class="row mb-5 pb-4 sr-section">
                <div class="col-lg-10 mx-auto">
                    <div class="text-center mb-5 sr-child">
                        <span class="gift-label">At a Glance</span>
                        <h2 style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">GIFT City Framework</h2>
                        <p style="color: #6b7280; font-size: 16px; max-width: 700px; margin: 0 auto;">Explore the comprehensive structure available through India's premier international financial center.</p>
                    </div>
                    
                    <div class="row g-5">
                        <div class="col-12 sr-child">
                            <div class="premium-image-wrapper p-3 p-md-4 rounded-4" style="background: #f8f9fa; border: 1px solid #e5e7eb; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                                <img src="/images/services/gift-city-1.png" alt="GIFT City Infrastructure" class="img-fluid rounded-3 shadow-lg" style="width: 100%; border: 1px solid rgba(0,0,0,0.05);">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FAQ Section -->
            <div class="row mb-5 sr-section">
                <div class="col-lg-10 mx-auto">
                    <div class="text-center mb-5 sr-child">
                        <span class="gift-label sr-child">Knowledge Center</span>
                    </div>

                    <div class="accordion premium-accordion" id="giftCityFaq">

                        <!-- NEW FAQ 1: Why Invest Through GIFT City? -->
                        <div class="accordion-item sr-child">
                            <h2 class="accordion-header" id="headingInvestWhy">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInvestWhy" aria-expanded="true" aria-controls="collapseInvestWhy">
                                    Why Invest Through GIFT City?
                                </button>
                            </h2>
                            <div id="collapseInvestWhy" class="accordion-collapse collapse show" aria-labelledby="headingInvestWhy" data-bs-parent="#giftCityFaq">
                                <div class="accordion-body" style="padding-top: 15px;">
                                    <div class="row g-4 row-cards">
                                        <div class="col-md-6">
                                            <div class="mv-card h-100 mb-0">
                                                <div class="mv-icon"><i class="fas fa-globe"></i></div>
                                                <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Global Diversification</h4>
                                                <p style="color: #6b7280; font-size: 15px; line-height: 1.6; margin-bottom: 0;">Reduce concentration risk by investing across international markets, sectors, and asset classes.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mv-card h-100 mb-0">
                                                <div class="mv-icon"><i class="fas fa-dollar-sign"></i></div>
                                                <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">US Dollar Exposure</h4>
                                                <p style="color: #6b7280; font-size: 15px; line-height: 1.6; margin-bottom: 0;">Build long-term wealth through investment products denominated in US Dollars and other global currencies, depending on the product.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mv-card h-100 mb-0">
                                                <div class="mv-icon"><i class="fas fa-users-cog"></i></div>
                                                <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">International Fund Managers</h4>
                                                <p style="color: #6b7280; font-size: 15px; line-height: 1.6; margin-bottom: 0;">Invest in professionally managed portfolios offered through leading global and Indian asset managers operating within GIFT City.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mv-card h-100 mb-0">
                                                <div class="mv-icon"><i class="fas fa-shield-alt"></i></div>
                                                <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">International Regulatory Standards</h4>
                                                <p style="color: #6b7280; font-size: 15px; line-height: 1.6; margin-bottom: 0;">Benefit from a transparent financial ecosystem governed by the International Financial Services Centres Authority (IFSCA).</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mv-card h-100 mb-0">
                                                <div class="mv-icon"><i class="fas fa-bolt"></i></div>
                                                <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Efficient Investment Platform</h4>
                                                <p style="color: #6b7280; font-size: 15px; line-height: 1.6; margin-bottom: 0;">Access international investment opportunities through a streamlined and investor-friendly process.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mv-card h-100 mb-0">
                                                <div class="mv-icon"><i class="fas fa-chart-line"></i></div>
                                                <h4 style="font-size: 1.1rem; font-weight: 700; color: #1a1f2e; margin-bottom: 12px;">Long-Term Wealth Creation</h4>
                                                <p style="color: #6b7280; font-size: 15px; line-height: 1.6; margin-bottom: 0;">Complement your Indian investments with global exposure to build a resilient and diversified portfolio.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- NEW FAQ 2: Who Can Invest? -->
                        <div class="accordion-item sr-child">
                            <h2 class="accordion-header" id="headingInvestWho">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInvestWho" aria-expanded="false" aria-controls="collapseInvestWho">
                                    Who Can Invest?
                                </button>
                            </h2>
                            <div id="collapseInvestWho" class="accordion-collapse collapse" aria-labelledby="headingInvestWho" data-bs-parent="#giftCityFaq">
                                <div class="accordion-body">
                                    <p style="margin-bottom: 16px;">Our GIFT City investment solutions are ideal for:</p>
                                    <ul class="content-list" style="margin-bottom: 0;">
                                        <li>Non-Resident Indians (NRIs)</li>
                                        <li>Overseas Citizens of India (OCIs)</li>
                                        <li>Resident Indians</li>
                                        <li>High-Net-Worth Individuals (HNIs)</li>
                                        <li>Business Owners and Entrepreneurs</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Existing FAQ 1 (now 3) -->
                        <div class="accordion-item sr-child">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    What is GIFT City?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#giftCityFaq">
                                <div class="accordion-body">
                                    <p>GIFT City is India's International Financial Services Centre (IFSC), offering access to international financial products and services within a globally regulated environment.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Existing FAQ 2 (now 4) -->
                        <div class="accordion-item sr-child">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Who can invest through GIFT City?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#giftCityFaq">
                                <div class="accordion-body">
                                    <p>Investment eligibility depends on applicable regulations. NRIs, OCIs, and Resident Indians may access various GIFT City investment products.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Existing FAQ 3 (now 5) -->
                        <div class="accordion-item sr-child">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Why should I consider investing through GIFT City?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#giftCityFaq">
                                <div class="accordion-body">
                                    <p>GIFT City can help investors diversify internationally, gain exposure to global markets and currencies, and access professionally managed investment solutions—all within a transparent, globally regulated environment from within India.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Existing FAQ 4 (now 6) -->
                        <div class="accordion-item sr-child">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    Do you assist with the entire investment process?
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#giftCityFaq">
                                <div class="accordion-body">
                                    <p>Yes. Our team provides end-to-end assistance, including documentation, onboarding, investment selection, portfolio construction, and ongoing reviews.</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Infographics Section 2 -->
            <div class="row mb-5 pb-4 sr-section">
                <div class="col-lg-10 mx-auto">
                    <div class="text-center mb-5 sr-child">
                        <span class="gift-label">Investment Avenues</span>
                        <h2 style="font-size: 2.2rem; font-weight: 700; color: #1a1f2e; margin-bottom: 16px;">GIFT City Opportunities</h2>
                        <p style="color: #6b7280; font-size: 16px; max-width: 700px; margin: 0 auto;">Discover the various investment options and tax benefits available to different investor categories.</p>
                    </div>
                    
                    <div class="row g-5">
                        <div class="col-12 sr-child">
                            <div class="premium-image-wrapper p-3 p-md-4 rounded-4" style="background: #f8f9fa; border: 1px solid #e5e7eb; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                                <img src="/images/services/gift-city-2.png" alt="GIFT City Investments" class="img-fluid rounded-3 shadow-lg" style="width: 100%; border: 1px solid rgba(0,0,0,0.05);">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CTA Strip -->
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <div class="support-cta-section sr-reveal" data-sr-reveal-delay="0.3s">
                        <h3>Start Your Global Investment Journey Today</h3>
                        <p>Schedule a consultation and discover how a globally diversified portfolio can support your long-term financial goals.</p>
                        <div class="cta-buttons">
                            <a href="/contactus" class="btn-primary-premium">Schedule Consultation</a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </section>

</main>
