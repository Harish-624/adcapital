<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script src="https://code.iconify.design/iconify-icon/1.0.2/iconify-icon.min.js"></script>
<script src="https://kit.fontawesome.com/c36903e4bc.js" crossorigin="anonymous"></script>


<style>
.page-heading {
    padding-top: 6rem;
    padding-bottom: 2rem;
}
.service-menu{
	background-color:#edfbfa;
}
.serv-menu{
	color:#000;
}
.serv-menu-act{
	font-weight:600;
	color:#F48716 !important;
}
.just-content{
	text-align:justify;
}
h4.service__title {
    height: 35px;
}
.service-item .service__icon img:nth-of-type(2) {
    position: absolute;
    right: -60px;
    font-size: 140px;
    opacity: 0.1;
    top: 100px;
}
</style>
    <!-- Main -->
    <main>
    <!-- Page Title -->
        <div class="page-hero-curved">
          <div class="container text-center position-relative" style="z-index:2">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb mb-3 justify-content-center">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a href="/services">Services</a></li>
                <li class="breadcrumb-item active" aria-current="page">Mutual Fund</li>
              </ol>
            </nav>
            <div class="text-center">
              <span class="category-label">Investment</span>
              <h1 class="mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Mutual Fund</h1>
            </div>
          </div>
          <div class="page-hero-curve-bottom"></div>
        </div>
        <!-- End Page Title -->
        <!-- Section -->
        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                	<div class="col-lg-3">
                        <div class="card">
                            <div class="card-body service-menu p-4">
                                <ul class="list-unstyled">
                                    <li class="mb-3"><a class="serv-menu-act" href="/services/mutual-fund"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>Mutual Funds</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/stock"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>Stock Broking</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/small-savings"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>Small Savings</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/fixed-deposit"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>Fixed Deposits</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/rbi-bonds"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>RBI Bonds</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/life-insurance"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>Life Insurance</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/health-insurance"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>Health Insurance</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/national-pension-scheme"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>National Pension Scheme (NPS)</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/home-and-personal-loans"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>Home And Personal Loan</a></li>
                                    <li class="mb-3"><a class="serv-menu" href="/services/income-tax-filing"><iconify-icon icon="uil:angle-double-right" class="mb-0" style="padding-right: 0.3rem; font-size: 20px; vertical-align: middle;"></iconify-icon>Income Tax Filing</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="card">
                            <div class="card-body p-4 p-lg-5">
                                <h4 class="mb-2">What is mutual fund?</h4>
                                <p class="just-content">Mutual funds are financial instruments which invest in a portfolio of securities. These securities may be stocks, bonds, money market instruments, gold, silver and real estate investment trusts (REITs) etc. You can buy units of mutual funds; each unit represents a certain percentage of the mutual fund scheme portfolio. Mutual funds are managed by professional fund managers who manage the schemes according to the investment objectives of the schemes.</p>
                                <h4 class="pt-3">How to invest in mutual funds?</h4>
                                <p class="just-content">When an asset management company (AMC) house launches a new mutual fund scheme, it invites subscriptions from the public in the New Fund Offer (NFO). In the NFO period, investors are allotted units at par value (usually Rs 10). If you invested Rs 10,000 in a mutual fund scheme during the NFO period, you would be allotted 1,000 units. You need to be KYC compliant to invest in mutual funds. Your financial advisor can help you fulfil KYC requirements. Along with KYC documents, you need to provide bank details to invest in mutual funds. Investors can invest in mutual funds only from their own bank accounts.</p>
                                <p class="just-content">At the end of the NFO period, the money pooled from all the investors are invested in a diversified portfolio of securities according to the scheme's mandate. After the NFO, investors can buy units of open ended schemes from the AMC at prevailing Net Asset Values (NAV). You can also redeem open ended mutual fund schemes at any time at prevailing NAVs. The redemption proceeds will be credited to your bank account on T+3 for equity funds. Investors should note that for redemptions within a certain period of time from investment exit loads may apply.</p>
                                <h4 class="pt-3">Different types of mutual funds</h4>
                                <p class="just-content">There are three broad categories of mutual funds:-</p>
                                <h6 class="pt-3">Equity funds:</h6>
                                <p class="just-content">These mutual fund schemes invest in equity and equity related securities. Equity funds have sub-categories based on the market cap segments, where the scheme may primarily invest in e.g. large cap, large and midcap, midcap, small cap, multicap, flexicap etc. The primary investment objective of equity funds is capital appreciation.</p>
                                <h6 class="pt-3">Debt funds:</h6>
                                <p class="just-content">These mutual funds schemes invest in debt and money market instruments. Debt funds have sub-categories based on the maturity profiles of the underlying debt or money market instruments e.g. overnight, liquid, ultra-short duration, low duration, short duration, medium duration, long duration etc. The primary investment objective of equity funds is capital appreciation.</p>
                                <h6 class="pt-3">Hybrid funds:</h6>
                                <p class="just-content">These funds invest in both equity and debt securities. They may also invest in other classes like gold, REITs, InvITs etc. The primary investment objective of hybrid funds is asset allocation. Different types of hybrid funds include aggressive hybrid funds, conservative hybrid funds, balanced advantage funds, equity savings etc.</p>
                                <p class="just-content mt-5">Different fund categories and sub-categories have different risk profiles. Mutual funds provide investment solutions for a wide spectrum of risk appetites and investment needs. Your financial advisor can help you select the right investment option for you.</p>
                                
                                <h4 class="mb-2 pt-3">Taxation of mutual funds</h4>
                                <p class="just-content">Mutual funds, whose average equity allocation (i.e. where underlying assets are equity and equity related securities) is 65% or more, are treated as equity funds from tax perspective. These include all equity funds and also several hybrid fund categories. Short term capital gains (investment holding period of less than 12 months) in equity funds are taxed at 15%. Long term capital gains (investment holding period of more than 12 months) in equity funds are tax free up to Rs 100,000 and taxed at 10% thereafter. Short term capital gains (investment holding period of less than 36 months) in non equity funds are taxed as per the income tax rate of the investor. Long term capital gains (investment holding period of more than 36 months) in non equity funds are taxed at 20% after allowing for indexation. Investments in mutual fund Equity Linked Savings Schemes (ELSS) qualify for deductions under Section 80C.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End section -->
    </main>
    <!-- End Main -->
