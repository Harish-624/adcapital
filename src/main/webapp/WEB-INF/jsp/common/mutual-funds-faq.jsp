<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
  /* ── Premium Hero Section ─────────────────────────────── */
  .premium-faq-hero {
    background: linear-gradient(135deg, #f8f9fa 0%, #eef1f6 100%);
    padding: 160px 0 80px;
    position: relative;
    overflow: hidden;
  }
  .premium-faq-hero::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -20%;
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 60%);
    border-radius: 50%;
    pointer-events: none;
  }
  .hero-label {
    display: inline-block;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: #009899;
    margin-bottom: 20px;
  }
  .premium-faq-hero h1 {
    color: #1a1f2e;
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 20px;
    letter-spacing: -0.02em;
  }
  .premium-faq-hero p {
    color: #4b5563;
    font-size: 1.1rem;
    line-height: 1.7;
    max-width: 600px;
    margin: 0 auto;
  }

  /* ── Search Bar ─────────────────────────────── */
  .faq-search-wrapper {
    margin-top: -35px;
    position: relative;
    z-index: 10;
    margin-bottom: 50px;
  }
  .faq-search-box {
    background: #fff;
    border-radius: 50px;
    padding: 8px 12px 8px 30px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.08), 0 5px 15px rgba(0,0,0,0.03);
    display: flex;
    align-items: center;
    max-width: 650px;
    margin: 0 auto;
    border: 1px solid rgba(0,0,0,0.03);
    transition: all 0.3s ease;
  }
  .faq-search-box:focus-within {
    box-shadow: 0 20px 45px rgba(0, 152, 153, 0.15);
    border-color: rgba(0, 152, 153, 0.3);
  }
  .faq-search-box i {
    color: #9ca3af;
    font-size: 20px;
  }
  .faq-search-box input {
    border: none;
    box-shadow: none;
    font-size: 1.05rem;
    color: #1a1f2e;
    padding: 15px 20px;
    width: 100%;
  }
  .faq-search-box input:focus {
    outline: none;
  }
  .faq-search-box input::placeholder {
    color: #9ca3af;
  }
  .faq-search-btn {
    background: #009899;
    color: #fff;
    border: none;
    border-radius: 40px;
    padding: 12px 30px;
    font-weight: 600;
    transition: all 0.3s ease;
  }
  .faq-search-btn:hover {
    background: #0085A1;
    transform: translateY(-1px);
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
    box-shadow: 0 6px 20px rgba(0, 152, 153, 0.4);
  }
  .btn-secondary-premium {
    background: #fff;
    color: #1a1f2e;
    padding: 14px 32px;
    border-radius: 50px;
    font-weight: 600;
    text-decoration: none;
    border: 1px solid #e5e7eb;
    transition: all 0.3s;
  }
  .btn-secondary-premium:hover {
    background: #f3f4f6;
    color: #1a1f2e;
    border-color: #d1d5db;
  }
</style>

<section class="premium-faq-hero text-center">
  <div class="container">
    <div class="hero-label">Knowledge Center</div>
    <h1>Mutual Funds FAQ</h1>
    <p>Find comprehensive answers to all your questions about mutual funds, investments, and growing your wealth.</p>
  </div>
</section>

<div class="container mb-5 pb-5">
  <div class="faq-search-wrapper sr-reveal">
    <div class="faq-search-box">
      <i class="fa fa-search"></i>
      <input type="text" placeholder="Search for answers...">
      <button class="faq-search-btn">Search</button>
    </div>
  </div>

  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="accordion premium-accordion sr-section" id="accordionExample">
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						        What is a Mutual Fund?
						      </button>
						    </h2>
						    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Mutual fund is a financial instrument which pools the money of different people and invests them in different financial securities like stocks, bonds etc. The Asset Management Company (AMC), i.e. the company which manages the mutual fund raises money from the public. The AMC then deploys the money by investing in different financial securities like stocks, bonds etc. The securities are selected keeping in mind the investment objective of the fund.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingTwo">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						        How do AMCs manage MF Investments?
						      </button>
						    </h2>
						    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>The Asset Management Company (AMC), i.e. the company which manages the mutual fund raises money from the public. The AMC then deploys the money by investing in different financial securities like stocks, bonds etc. The securities are selected keeping in mind the investment objective of the fund. For example, if the investment objective of the fund is capital appreciation, the fund will invest in shares of different companies. If the investment objective of the fund is to generate income, then the fund will invest in fixed income securities that pay interest.</p>
						        <p>Each investor in a mutual fund owns units of the fund, which represents a portion of the holdings of the mutual fund. On an on-going basis, the fund managers will manage the fund to ensure that the investment objectives are met. For the services the AMCs provide to the investors, they incur expenses and charge a fee to the unit holders. These expenses are charged against proportionately against the assets of the fund and are adjusted in the price of the unit. Mutual funds are bought or sold on the basis of Net Asset Value (NAV). Unlike share prices which changes constantly depending on the activity in the share market, the NAV is determined on a daily basis, computed at the end of the day based on closing price of all the securities that the mutual fund holds in its portfolio.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingThree">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						        What are Open Ended & Close Ended Mutual Funds?
						      </button>
						    </h2>
						    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>There are essentially two kinds of mutual funds.</p>
						        <p><b>Open Ended Schemes:</b> Investors can buy units of open ended schemes at any time. Investors can also sell units of open ended schemes at any time, though some schemes (e.g. equity linked savings schemes) may have a lock in period during which the investor cannot sell the units. The percentage ownership of investors in the assets of open ended schemes changes whenever investors purchase or sell units. Since you can sell units of open ended schemes at any time, high liquidity is ensured to the investors. However, costs may apply if you sell units of open ended scheme before a certain period of time from the date of investment. We will discuss this in more details later.</p>
						        <p><b>Close Ended Schemes:</b> Close ended schemes are open for subscription only for a limited period of time, during the offer period. These schemes have fixed tenure and the investors can sell or redeem only after the maturity of the scheme. Upon maturity, depending on the scheme, the units get automatically redeemed or in some cases, the investors can switch to a different scheme. Close ended schemes are open for subscription only for a limited period of time, during the new fund offer (NFO) period. These schemes have fixed tenure and the investors can sell or redeem only after the maturity of the scheme. Upon maturity, depending on the scheme, the units get automatically redeemed or in some cases, the AMC gives option to unit holders to switch to a different scheme. The percentage ownership of investors in the assets of close ended schemes is unchanged throughout the tenure of the scheme as new investors cannot buy units post closure of the NFO. Some close ended schemes are listed on stock exchanges and you can buy or sell them through your share trading / demat account in the stock exchange, but the liquidity of these schemes listed on the exchanges is still quite low.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingFour">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
						        What are the advantages of mutual funds?
						      </button>
						    </h2>
						    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>There are 5 key advantages of investing in mutual funds:-</p>
						        <p><b>Risk Diversification:</b> Mutual funds help investors diversify their risks by investing in a portfolio of stocks and other securities across different sectors, companies and market capitalizations. A diversified portfolio reduces risks associated with individual stocks or other assets or specific sectors. If an equity investor were to create a well-diversified portfolio by directly investing in stocks it would require a large investment. On the other hand, mutual fund investors can buy units of equity mutual funds with an investment of as low as Rs 5,000/- only. Mutual funds are managed by professional fund managers who are experts in picking the right stocks to get the best risk adjusted returns. A common investor often lacks this expertise and thus should invest through the mutual fund route.</p>
						        <p><b>Economies of scale in transaction costs:</b> Since mutual funds buy and sell securities in large volumes, transaction costs on a per unit basis is much lower than buying or selling stocks directly by an individual investor.</p>
						        <p><b>Tax efficiency:</b> Mutual funds are more tax efficient than most of the other investment products. Long term capital gains (holding period of more than 1 year) for equity and equity oriented mutual funds are tax exempt up to the gain of Rs 100,000. For investments made in debt funds, prior to 1st April 2023, long term capital gain (holding period of more than 3 years) is taxed at 20% with indexation. Once indexation (due to inflation) is factored in, the long-term capital gains tax is reduced considerably, especially for investors in the higher tax bracket. However, following the Amendment to Finance Bill 2023, the indexation benefit on debt mutual funds has been withdrawn. Debt funds will now be taxed at investor's tax slab rate. These changes bring taxation of debt and debt oriented mutual funds at par with fixed deposits for investments made from 1st April 2023 onward.</p>
						        <p>Investments in mutual fund Equity Linked Savings Schemes (ELSS) up to Rs 150,000 in a financial year qualify for deductions under Section 80C of The Income Tax Act 1961.</p>
						        <p><b>High Liquidity:</b> Open ended mutual funds are more liquid than many other investment products like shares, debentures and variety of deposit products (excluding bank fixed deposits). Investors can redeem their units fully or partially at any time in open ended funds. Moreover, the procedure of redemption is standardized across all mutual funds.</p>
						        <p><b>Variety of products and modes of investment:</b> Mutual funds offer investors a variety of products to suit their risk profiles and investment objectives. Apart from equity funds, there are income funds, tax plans (ELSS Funds), balanced funds, monthly income plans and liquid funds to suit different investment requirements. Mutual funds also offer investors flexibility in terms of modes of investment and withdrawal. Investors can opt for different investment modes like lump sum (or one time), systematic investment plans, systematic transfer plans (from other mutual fund scheme to the other in the same AMC) or switching from one scheme to another.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingFive">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
						        What are Mutual Fund Units?
						      </button>
						    </h2>
						    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Units are the building blocks of a mutual fund scheme. A unit represents percentage ownership of the total pool of money managed by the Asset Management Company. Generally, Mutual fund units are priced at Rs 10 at the time of launch (known as New Fund Offer or NFO) of the scheme and its price fluctuates with change in value of the assets of the scheme</p>
						        <p>Suppose you have invested Rs 100,000 in a mutual fund. If the price of a unit of the fund is Rs 10, then the mutual fund house will allot you 10,000 units. Let us assume the total money invested in the fund by all the investors is Rs 100 Crores. The mutual fund invests the money to buy equity or fixed income securities. Each unit will represent 0.000001% value of all the securities the mutual fund has in its holdings. If you have 10,000 units, then your portion of the mutual fund holdings will be 0.01%.</p>
						        <p>As the value of portfolio of securities held by the mutual increases or decreases, so will the price of the units. If the value of assets increases from Rs 100 Crores to Rs 110 Crores, without the issue of new units, the price of the unit will be Rs 11 (0.000001% X 110 Crores). Please note that the percentage ownership represented by unit of the total assets of a scheme will change from time to time as new investors invest in the scheme or existing investors exit (redeem) from the scheme.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingSix">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
						        What is NAV in mutual funds?
						      </button>
						    </h2>
						    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Mutual funds are bought or sold on the basis of Net Asset Value (NAV). NAV is essentially the price of a unit. NAV is calculated by dividing the net assets (market value of the securities and cash held by the fund minus the liabilities) of the fund by the total number of units outstanding. Unlike share prices which changes constantly during the day depending on the activity in the share market, the NAV is determined on a daily basis, computed at the end of the day based on closing price of all the securities that the mutual fund owns after making appropriate adjustments.</p>
						        <p>Contrary to popular misconception, schemes with high NAVs are not overpriced and funds with low NAVs are not attractively priced. Older the fund higher will be the NAV over a period of time. Low or high, the NAV by itself does not impact the return on investment from the mutual fund. The percentage change in a fund's NAV over a period of time denotes the percentage returns on investment of all the unit holders of the fund over the same period.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingSeven">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
						        What is an Expense Ratio?
						      </button>
						    </h2>
						    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Expense ratio is the annual cost incurred by the AMC to operate a mutual fund scheme, expressed as a percentage of the total assets of the scheme. The cost includes fund manager expense, cost of the supporting infrastructure for the fund manager, transaction costs (for buying and selling securities), marketing and distribution costs (commissions paid to mutual fund distributors). If the total assets under management of a scheme is Rs 500 crores and the expense ratio is 1.5%, then it implies that, Rs 7.5 crores (1.5% X 500 crores) is the operating expenses of the scheme. This expense is deducted from the asset value of the scheme on a pro-rata basis; units are priced after deducting expense ratio. Investors should note that, the NAV of a scheme is net of the expense ratio. Expense ratios of different schemes and plans of the same AMC may be different.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingEight">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
						        What are Regular Plans and Direct Plans?
						      </button>
						    </h2>
						    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Mutual funds have traditionally been distributed through MF distributors in India. MF distributors mandatorily need to have certification from AMFI (the nodal body of mutual funds in India) to ensure that they have sufficient knowledge to give investment advice to investors. Apart from investment advice, MF distributors also help investors with fulfilment of their purchase or redemption transactions (fulfilling KYC requirements, filling application forms and submission to AMCs or mutual fund registrars), as well as ongoing customer service. For their services, MF distributors get commissions from the AMC. If you make your mutual fund investment through a MF distributors, you will invest in, what is known as, regular plan of the scheme.</p>
						        <p>Some years back, investors were also provided with the option of investing directly with the AMC, without going through a MF distributors. If you submit your mutual fund investment application directly to the AMC (online or offline), you will invest in, what is known as, direct plan of the scheme. The most obvious difference between regular and direct plan is that, unlike in a regular plan, you need to have capability to decide which scheme to invest in and how to manage your investment on an ongoing basis. You will also have to devote time and effort to fulfil the transaction by yourself by providing necessary documents for KYC, filling forms and visiting the AMC (online or offline). The advantage of direct plan versus regular plan is in the expense ratio. Since in direct plans, AMCs do not have to pay commissions to the MF distributors, the expense ratio is lower. Hence, the returns are higher.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingNine">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
						        What is an Exit Load?
						      </button>
						    </h2>
						    <div id="collapseNine" class="accordion-collapse collapse" aria-labelledby="headingNine" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>AMCs may charge a fee if you redeem (sell) your units within a specified period from the date of investment. This fee is known as exit load. Let us understand exit load with the help of an example. Suppose, you invested Rs 1 lakh in a scheme whose NAV was Rs 20; in other words, you bought 5,000 units of the scheme. Let us assume that, the exit load is 1% for redemptions within 12 months from the date of purchase. Suppose after 8 months, the NAV of the scheme is Rs 23. The value of the 5,000 units will be Rs 1.15 lakhs. However, if you redeem (sell) all your units after 8 months, you will not get a credit of Rs 1.15 lakhs to the bank because exit load will apply. Exit load per unit will be 23 paise (1% X 23) and total exit load will be Rs 1,150. This amount will be deducted from your redemption proceeds and only Rs 1,13,850 will be credited to your bank account. Investors should note that, exit load does not just apply for redemptions; they are also applicable for switches, Systematic Transfer Plans (STP) and Systematic Withdrawal Plans (SWP), as long as those transactions take place, within the exit load period.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingTen">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
						        What are Growth and Dividend Options in a Mutual Fund Scheme?
						      </button>
						    </h2>
						    <div id="collapseTen" class="accordion-collapse collapse" aria-labelledby="headingTen" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Growth and Dividend are essentially options of how investors want cash-flows. During the course of a year, a mutual fund scheme may make profits through dividends from shares ownership or interests from bonds owned by the scheme and also through portfolio churn (profit booking by buying and selling shares and bonds). In a growth option the profit is re-invested to generate more returns whereas in dividend option the profits are distributed to the investors on a regular basis (annual, semi-annual, quarterly, monthly etc). Dividends are declared on a per unit basis. Capital appreciation is much higher in growth option because investors benefit from compounding over a long investment horizon; NAV in growth options grows much more than dividend options where the NAVs get re-adjusted whenever the scheme declares dividends. However, some investors may need income during the tenure of the investment and dividend option is suitable for such investors.</p>
						        <p>Dividend re-investment is another option available to investors. In this option the dividends instead of being distributed to investors, get re-invested to buy units of the scheme. A dividend re-investment option works very much like growth option. The major difference between growth and dividend re-investment option is that, in growth option investor gets capital appreciation through growth in NAV, whereas in dividend re-investment the investor gets capital appreciation through incremental units (the NAVs of dividend and dividend re-investment options are the same). Tax consequences of growth and dividend re-investment option are different (we will discuss in more details in a separate post).</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingEleven">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
						        What are different types of returns in mutual funds?
						      </button>
						    </h2>
						    <div id="collapseEleven" class="accordion-collapse collapse" aria-labelledby="headingEleven" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Let us see some common terms associated with one of the most important aspects of mutual fund investments, i.e. returns and what it means to you.</p>
						        <p><b>Absolute Return:</b> Absolute return is the growth in your investment expressed in percentage terms. It can be understood with the help of a simple example. Suppose you invested Rs 1 Lakh in a mutual fund scheme. Three years later the value of your investment is Rs 1.4 Lakhs; you can know the value of your investment from the account statement sent to you by the AMC or the registrar (e.g. CAMS or Karvy). The total profit made by you is Rs 40,000. The absolute return earned by you in percentage terms is 40%. Absolute return ignores the time over which the growth was achieved; if your Rs 1 Lakh investment grew to Rs 1.4 Lakhs in 5 years (instead of 3), the absolute return will still be 40%.</p>
						        <p><b>Annualized Return:</b> Annualized return, as the name suggests, measures how much your investment grew in value on a yearly basis. An important thing to note in annualized returns is that, the effect of compounding is included. Compounding is, very simply, profits made on profits. If you invested Rs 1 Lakh in a mutual fund scheme and the value of your investment after 3 years is Rs 1.4 Lakhs, then annualized returns will be 11.9%. Notice that annualized return of 11.9% is less than the absolute return (40%) divided by the investment period (3 years); this is due to compounding effect. If you invested Rs 1 Lakh in a mutual fund scheme and the value of your investment after 5 years is Rs 1.4 Lakhs, then annualized returns will be 7%.</p>
						        <p><b>Total Return:</b> Total return is the actual rate of return earned from the investment and includes both capital gains and dividends. Let us assume that, you invested Rs 1 Lakh in a mutual fund scheme at a NAV of Rs 20. The number of units of the scheme purchased by you is 5,000 (1 Lakh divided by 20). The NAV of the scheme after 1 year is Rs 22. The value of your units after 1 year will, therefore, be Rs 1.1 Lakhs (22 X 5,000). The capital gains made by you will be Rs 10,000. Let us also assume that, during the year, the scheme declared Rs 2 per unit as dividend. Total dividend paid to you by the AMC would be Rs 10,000 (2 X 5,000). The total return earned by you will be Rs 10,000 capital gains + Rs 10,000 dividends = Rs 20,000. The total return in percentage terms will be 20%.</p>
						        <p><b>Trailing Return:</b> Trailing return is the annualized return over a certain trailing period ending today. Let us understand this with the help of an example. Suppose the NAV of a scheme today (March 10, 2017) is Rs 100. 3 years back (i.e. March 10, 2014), the NAV of the scheme was Rs 60. The 3 year trailing return of the fund is 18.6%. Suppose the NAV of the scheme 5 years back (i.e. March 10, 2012) was Rs 50. The 5 year trailing return of the fund is 14.9%.</p>
						        <p>The trailing period can be 1 year, 2 years, 3 years, 5 years, 10 years etc; basically any period. Trailing return is the most popular mutual performance measure. The returns that you see on most mutual fund websites are actually trailing returns. If you go to our Mutual Fund Research section, Top Performing Funds, the returns that you see are, in fact, trailing returns. Investors should note that, trailing returns are biased by current market conditions relative to market conditions prevailing at the start of the trailing period. Trailing returns are high in bull markets and low in bear markets.</p>
						        <p><b>Point to Point Return:</b> As the name suggests, point to point returns measures annualized returns between two points of time. For example, if you are interested in how a mutual fund scheme performed during a particular period, say 2012 to 2014, you will look at point to point returns. To calculate point to point returns of a mutual fund scheme, you necessarily need to have a start date and end date. You will look up the NAVs of the scheme on start and end dates, and then calculate the annualized returns. In our Mutual Fund Research section, you find point to point returns of one or more schemes by using our Mutual Fund Point to Point Returns - Multiple Schemes & Periods tool.</p>
						        <p><b>Annual Return: </b>Annual return of a mutual fund scheme is the return given by the scheme from January 1 (or the earliest business day of the year) to December 31 (last business day of the year) of any calendar year. For example, if the NAVs of a scheme on January 1 and December 31 are Rs 100 and 110 respectively, the annual return for that year will be 10%. Most mutual fund research portals, including our portal, show annual returns of a scheme in the scheme details page. Annual returns are shown on the scheme details page in popular mutual fund websites. Mutual funds are market linked investments and the market conditions in a particular year will have a significant impact on annual returns. However, comparing annual returns across years relative to benchmark or fund category, can give you a sense of fund performance consistency.</p>
						        <p><b>Rolling Returns: </b>Rolling returns are the annualized returns of the scheme taken for a specified period (rolling returns period) on every day/week/month and taken till the last day of the duration compared to the scheme benchmark (e.g. Nifty, BSE 100, BSE 200, BSE 500, CNX 500, BSE Midcap, CNX Midcap etc) or fund category (e.g. large cap funds, diversified equity funds, midcap funds, balanced funds etc). Rolling returns are usually shown in a chart format. A rolling returns chart shows the annualized returns of the scheme over the rolling returns period on every day from the start date, compared to the benchmark or category. <br>Rolling returns is not widely used in India, but is widely accepted globally as the best measure of a fund's performance. Trailing returns have a recency bias (as explained earlier) and point to point returns are specific to the period in consideration (and therefore, may not be relevant for the present time). Rolling returns, on the other hand, measures the fund's absolute and relative performance across all timescales, without any bias. Rolling return is also the best tool to understand, performance consistency and the fund manager performance.<br>We, in NKJ Finserv, are proud that, we are among the very few mutual fund research portals which show rolling returns. You can see rolling returns of any mutual fund scheme relative to the benchmark, by using our tool Rolling Return vs Benchmark. You can see rolling returns of one or more mutual fund schemes relative to their fund category, by using our tool Rolling Return vs Category. In NKJFinserv.com , in addition to the chart format, we also show rolling returns in a tabular format. To see rolling returns in tabular format on our portal, you can click on the button, See Rolling Returns in Tabular Format, on the bottom right hand side in rolling return pages.</p>
						        <p><b>Quartile Ranking: </b>Which is more important, absolute return or relative return? It differs from individual to individual and we can debate this till the cows come home, but the reality is that, in this competitive age, there is emphasis on relative performance, both in our work-place and also for our kids in school. Quartile ranking is a measure of relative performance of mutual fund scheme. Investors should note that, quartile ranking is not a measure of returns, but is actually a rank versus against all other funds in its category. <br>The rankings range from "Top Quartile" to "Bottom Quartile" for different time periods. Mutual funds with the highest percent returns in the chosen time period are assigned to "Top Quartile", whereas those with the lowest returns are assigned to "Bottom Quartile". Quartile rankings are compiled by sorting the funds based on trailing returns over a period chosen by the user. Funds in the top 25% are assigned the ranking of "Top Quartile", the next 25% are assigned a ranking of "Upper Middle Quartile", the next 25% after that are assigned a ranking of "Lower Middle Quartile" and the lowest 25% are assigned the ranking of "Bottom Quartile". While, the current quartile ranking of a mutual fund scheme is important, even more important is the consistency of quartile ranking across several quarters. You can see quartile ranks of different mutual fund schemes in a category in our research tool, Mutual Fund Quartile Ranking.<br></p>
						        <p><b>SIP Returns / XIRR: </b>All the returns measures that we have discussed thus far, relate to lump sum or one-time investments. Lump sum investment returns are relatively simpler to measure because, essentially you are measuring growth in investment value between two points of time (in the case of total returns, dividends, if any, also need to be factored). However, systematic investment plan (SIP) represents a series of cash-flows and so computing SIP returns is more complicated. The financial metric used to calculate the returns from a series of cash-flows (e.g. SIP, SWP, STP etc) is known as the Internal Rate of Return (IRR). The formula of IRR is outside the scope of this post. If cash-flows are not an exact regular time intervals, then a modification of IRR, known as XIRR (in excel), is used to measure SIP returns.<br>You can see XIRR of SIPs of different mutual fund schemes across different time periods in our Mutual Fund Research section, Top Performing Systematic Investment Plan. If you want to see SIP returns over a specific time period, you can use our tool, Mutual Fund SIP Calculator. Some AMCs offer SIP products where you can increase the SIP instalments on an annual basis; these products are known as Step up SIP, SIP Top up etc.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingTwelve">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
						        What are the different types of Mutual Funds?
						      </button>
						    </h2>
						    <div id="collapseTwelve" class="accordion-collapse collapse" aria-labelledby="headingTwelve" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>There are various types of mutual fund schemes such as equity funds, debt funds and tax savings funds etc. Again within equity funds and debt funds there are various categories of schemes available for the investors to invest. We will now examine the various categories of funds within debt and equity.</p>
						        <h6>Different types of Equity Funds</h6>
						        <p>Funds that invest in equity shares are called equity funds. They carry the principal objective of capital appreciation of the investment over a medium to long-term investment horizon. Equity Funds are high risk funds and their returns are linked to the stock markets. They are best suited for investors who are seeking long term growth. There are different types of equity funds such as Diversified funds, Sector specific funds and Index based funds.</p>
						        <h6>Diversified equity mutual funds</h6>
						        <p>As per definition, diversified equity mutual funds are purely equity funds which invest in a large number of stocks across different sectors. The objective is to diversify unsystematic risks and generate highest risk adjusted returns. Company specific and sector specific risks are unsystematic risks.</p>
						        <p>Some research houses (e.g. CRISIL) and publications employ a stricter definition for diversified equity funds. As per their definition diversified equity funds are equity funds, which invest in stocks across different sectors and market segments. In other words, as per this definition, diversified equity funds in addition to investing in stocks across different industry sectors (e.g. Banking, oil and gas, cement and construction, automobiles, technology, pharmaceuticals, capital goods, FMCG, power, infrastructure etc), also invest in stocks across different market segments in terms of market capitalization (i.e. large cap, midcap, small cap and micro cap companies). These funds are also known as flexicap or multicap funds.</p>
						        <h6>Large cap equity mutual funds</h6>
						        <p>Companies are categorized as large cap, mid cap and small cap, based on their relative market capitalizations. Market capitalization is simply the market value of the company, calculated by multiplying the share price of a company with the company' total number of shares outstanding. Bombay Stock Exchange (BSE) categorizes companies into market cap segments based on the 80-15-5 rule. In the 80-15-5 rule, companies listed on BSE are arranged in descending order of market cap (highest to lowest) and starting from the top (company with highest market cap), the largest market companies which cover 80% of the total market cap of all the companies listed on the BSE are categorized as large cap companies.</p>
						        <p>Large cap companies are typically at Market Capitalization > INR 70k crore; Mid Caps are INR 25k - 70k crore; Small Caps are INR 10k - 25k Crore and Micro Caps are INR 3k - 10k Crores.</p>
						        <p>Funds which invest amongst the large cap companies are known as Large Cap Equity Funds.</p>
						        <p>Bluechip companies are the largest of large cap companies. There is no standard definition of bluechip companies; usually they are the very well-known leading companies in their industry sectors and have a strong track record of paying dividends regularly. Bluechip companies have a long history of strong financial performance and sought after by both domestic and foreign investors. Examples of some bluechip stocks are TCS, Reliance, ONGC, ITC, HDFC Bank etc.</p>
						        <h6>Mid cap equity mutual funds</h6>
						        <p>The next set of companies which cover 80 to 95% of the total market cap of all BSE listed companies are categorized as mid cap companies. The last set of companies covering 95 to 100% of total market cap of all BSE listed companies, are small cap companies.</p>
						        <p>Mid cap companies are typically companies which have a market capitalization ranging from INR 25k - 70k crore. Mid cap companies tend to be less well known, less researched and are thought to be more risky than large cap companies. Mutual fund schemes which invest the majority portion of their portfolio in mid cap companies are called mid cap funds. Midcap funds tend to be more volatile than large cap funds. Midcap funds can also be less liquid than large cap funds in extreme market conditions.</p>
						        <p>The funds which invest amongst these set of companies are called mid cap funds.</p>
						        <h6>Small cap equity mutual funds</h6>
						        <p>The market capitalizations of small cap companies are INR 10k - 25k Crore. These companies are smaller than midcap companies and thought to be riskier than even midcap companies. Mutual fund schemes which invest the majority portion of their portfolio in small cap companies are called small cap funds. Small cap funds tend to be more volatile and less liquid than mid cap funds.</p>
						        <p>The funds which invest amongst these small companies are called small cap funds.</p>
						        <h6>Sectoral Funds</h6>
						        <p>Sector investing is an alternative approach that chooses investments according to a particular theme or sector. Sectoral funds are commonly known as where investment is done in a particular industry of the economy. Some of these industries are real estate, agriculture, FMCG, power and energy, pharmaceuticals, infrastructure, banking, technology, financial services, metal, etc. If an investor thinks that a particular industry will be growing in the near future, he can make his investments in the mutual fund of that particular sector instead of investing in different equity shares of that sector. Such sectoral portfolios are very volatile in nature and the gains and losses depend on how in or out of favour the sector is.</p>
						        <h6>Balanced Funds</h6>
						        <p>Balanced funds, as the name suggests, balance the risks and generates returns between a pure debt fund and a pure equity fund. These type of mutual funds buy a combination of equity stocks (minimum 65%) & long term and short-term bonds (remaining 35%) to provide both income and capital appreciation while avoiding excessive risk. Investing in a Balanced Fund certainly comes as a more judicious choice. It benefits from the tremendous return generating potential of equities and the risk reduction characteristic of fixed income investments. Balanced Funds not only provide Growth to the Invested Corpus but also render stability to the investments made due to holding of debt securities in its portfolio.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingThirteen">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
						        What are fixed income or debt mutual funds?
						      </button>
						    </h2>
						    <div id="collapseThirteen" class="accordion-collapse collapse" aria-labelledby="headingThirteen" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Fixed income or Debt mutual funds primarily invest in a variety fixed income securities like treasury bills, commercial papers, certificates of deposits, corporate bonds and government bonds, issued by different banks, companies and the Government. The fixed income securities are of a range of maturity profiles from short maturity period of 3 months to long maturity periods of 30 years or more. The primary investment objective of short term debt mutual funds (short term maturity profile) is to generate income while that of long term debt funds (long term maturity profile) is to generate both income and capital appreciation. Unlike bank deposits, debt funds are not risk free investments.</p>
						        <p>There are two kinds of risk associated with debt funds:-</p>
						        <p>Interest rate risk</p>
						        <p>Credit risk</p>
						        <p>Long term debt funds have higher sensitivity to interest rate risks, while short term debt funds have lower sensitivity to interest rate risks. Corporate bond funds are exposed to credit risks. However, for the vast majority of debt mutual funds credit risk is quite low. Even the corporate bond funds, which aim to generate few percentage points of additional yield by investing in slightly lower rated corporate bonds, majority of the bonds in the fund portfolios are rated AAA and AA.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingFourteen">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">
						        What are the different types of debt mutual funds?
						      </button>
						    </h2>
						    <div id="collapseFourteen" class="accordion-collapse collapse" aria-labelledby="headingFourteen" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>There are broadly seven types of debt mutual funds in India.</p>
						        <p><b>Gilt Funds:</b> Gilt funds invest in Government securities with varying maturities. Average maturities of government bonds in the portfolio of long term gilt funds are in the range of 15 to 30 years. The fund manager in long term gilt funds actively manage their portfolio and take duration calls with outlook on the interest rate. The returns of these funds are highly sensitive to interest rates movements. The NAVs of gilt funds can be extremely volatile. The primary objective of Gilt Funds is capital appreciation. Investors with moderate to high risk tolerance level, looking for capital appreciation, can invest in Gilt Funds.</p>
						        <p><b>Income Funds:</b> Income funds invest in a variety of fixed income securities such as bonds, debentures and government securities, across different maturity profiles. For example they can invest in 2 to 3 year corporate non convertible debenture and at the same time invest in a 20 year Government bond. Their investment strategy is a mix of both hold to maturity (accrual income) and duration calls. This enables them to earn good returns in different interest rate scenarios. However, the average maturities of securities in the portfolio of income funds are in the range of 7 to 20 years. Therefore, these funds are also highly sensitive to interest rate movements. However, the interest rate sensitivity of income funds is less than gilt funds. Investors with moderate to high risk tolerance level, looking for both income and capital appreciation in different interest rate scenarios, can invest in income funds.</p>
						        <p><b>Short Term Debt Funds:</b> Short term bond funds invest in Commercial Papers (CP), Certificate of Deposits (CD) and short maturity bonds. The average maturities of the securities in the portfolio of short term bond funds are in the range of 2-3 years. The fund managers employ a predominantly accrual (hold to maturity) strategy for these funds. Short term debt funds are suitable for investors with low risk tolerance, looking for stable income.</p>
						        <p><b>Credit Opportunities Funds:</b> Credit opportunities fund are similar to short term debt funds. The fund managers lock in a few percentage points of additional yield by investing in slightly lower rated corporate bonds. Despite the slightly lower credit rating of the bonds in the credit opportunities fund portfolio, on an average, majority of the bonds in the fund portfolios are rated AAA and AA. The average maturities of the bonds in the portfolio of credit opportunities funds are in the range of 2 to 3 years. The fund managers hold the bonds to maturity and so there is very little interest rate risk. Credit Opportunities funds are suitable for investors with low risk tolerance, looking for slightly higher income than short term debt funds.</p>
						        <p><b>Fixed Maturity Plans:</b> Fixed Maturity Plans (FMPs) are close ended schemes. In other words investors can subscribe to this scheme only during the offer period. The tenure of the scheme is fixed. FMPs invest in fixed income securities of maturities matching with the tenure of the scheme. This is done to reduce or prevent re-investment risk. Since the bonds in the FMP portfolio are held till maturity, the returns of FMPs are very stable. FMPs are suitable for investors with low risk tolerance, looking for stable returns and tax advantage over an investment period of 3 years or more. They can provide better post tax returns than bank fixed deposits and are attractive investment options when yields are high.</p>
						        <p><b>Liquid Funds:</b> Liquid fund are money market mutual funds and invest primarily in money market instruments like treasury bills, certificate of deposits and commercial papers and term deposits, with the objective of providing investors an opportunity to earn returns, without compromising on the liquidity of the investment. Typically they invest in money market securities that have a residual maturity of less than or equal to 91 days. Liquid funds give higher returns than savings bank. Unlike savings bank interest, no tax is deducted at source for liquid fund returns. There is no exit load. Withdrawals from liquid funds are processed within 24 hours on business days. Liquid funds are suitable for investors who have substantial amount of cash lying idle in their savings bank account.</p>
						        <p><b>Monthly Income Plans:</b> Monthly income plans are debt oriented hybrid mutual funds. These funds invest 75-80% of their portfolio in fixed income securities and the 20-25% in equities. The equity portion of the portfolio of Monthly Income Plans provides a kicker to the generally stable returns generated by the debt portion of the portfolio. Monthly income plans can generate higher returns from pure debt funds. However, the risk is also slightly higher in monthly income plans compared to most of the other debt fund categories.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingFifteen">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFifteen" aria-expanded="false" aria-controls="collapseFifteen">
						        What are money market mutual funds?
						      </button>
						    </h2>
						    <div id="collapseFifteen" class="accordion-collapse collapse" aria-labelledby="headingFifteen" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>A money market fund is a type of open ended debt fund that invests solely in money market instruments. Money market instruments are fixed income securities like treasury bills, certificate of deposits and commercial papers and term deposits, which have very short term maturities and are highly liquid. The objective of money market mutual funds is to provide investors an opportunity to earn returns, without compromising on capital safety and liquidity of the investment. Typically money market mutual funds invest in money market securities that have a residual maturity of ranging from few days to at most few months. This helps the fund managers of liquid funds in meeting the redemption demand from the investors. Money market mutual funds are mainly used by institutional investors for parking money from time to time. Money market mutual funds, also known as Liquid funds, are also offered to retail investors to park their cash on a short term basis. While the terms money market mutual funds and liquid funds are used interchangeably, there are two kinds of money market mutual funds.</p>
						        <p><b>Liquid Funds:</b> Liquid funds are money market mutual funds and invest primarily in money market instruments like treasury bills, certificate of deposits and commercial papers and term deposits, with the objective of providing investors an opportunity to earn returns, without compromising on the liquidity of the investment. Typically they invest in money market securities that have a residual maturity of less than or equal to 91 days.</p>
						        <p><b>Ultra Short Term Bond Funds:</b> Ultra short term bond funds invest in money market instruments that mature in 6 to 12 months. Longer average maturities, enable ultra short debt funds get higher returns than liquid funds. However for the same reason, the volatilities of the short term debt funds are also slightly higher than liquid funds.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingSixteen">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSixteen" aria-expanded="false" aria-controls="collapseSixteen">
						        What are liquid funds?
						      </button>
						    </h2>
						    <div id="collapseSixteen" class="accordion-collapse collapse" aria-labelledby="headingSixteen" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Liquid fund are money market mutual funds and invest primarily in money market instruments like treasury bills, certificate of deposits and commercial papers and term deposits, with the objective of providing investors an opportunity to earn returns, without compromising on the liquidity of the investment. Typically they invest in money market securities that have a residual maturity of less than or equal to 91 days. This helps the fund managers of liquid funds in meeting the redemption demand from the investors.</p>
						        <p>Liquid funds provide a better alternative to investors who keep their surplus money parked in a savings bank account. While savings bank accounts typically pay interest rates in the range of 4 to 5%, liquid funds can potentially give much higher returns. Compared to other mutual fund categories, these funds have very low risk. Key benefits of liquid funds are:-</p>
						        <p><b>High liquidity:</b> Liquid funds do not have any exit load. Therefore, they can be redeemed any time after investment without any penalty</p>
						        <p><b>Higher returns than savings bank:</b> Liquid funds give higher returns than savings bank. Savings bank interest rate is around 4%, whereas liquid funds can give higher returns by at least a few percentage points. The returns of liquid funds rise when bond yields rise and fall when bond yield, but they can always provide higher returns than savings bank.</p>
						        <p><b>Low volatility:</b> Liquid funds are less volatile than longer term debt funds, since the underlying securities in their investment portfolio have short durations. Fixed income securities with short durations or maturities have lower interest rate risk, since the probability of the interest rates changing before the maturity of the securities is lower.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingSeventeen">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeventeen" aria-expanded="false" aria-controls="collapseSeventeen">
						        What is the difference between ULIPs and mutual funds?
						      </button>
						    </h2>
						    <div id="collapseSeventeen" class="accordion-collapse collapse" aria-labelledby="headingSeventeen" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>Unit Linked Insurance Plans (ULIPs) are combined life insurance cum investment products. Unlike traditional insurance plans e.g. endowment, money back plans, pension plans etc, ULIPs are market-linked and have the potential to deliver higher returns compared to traditional plans. However, ULIPs, unlike traditional life insurance plans, do not offer capital safety. ULIPs provide investors with life insurance cover and at the same time investment in a fund of their choice.</p>
						        <p>Mutual fund, on the other hand, is a purely market linked instrument, which pools the money of different people and invests them in different financial securities like stocks, bonds etc. Each investor in a mutual fund owns units of the fund, which represents a portion of the holdings of the mutual fund.</p>
						        <p>One can think of ULIP as a mutual fund with a term life insurance plan attached to it. In terms of gross investment returns ULIPs have performed comparably with mutual funds over a 5 year period. However, net returns to investors are lower in ULIP because various costs are deducted from ULIP premiums before they are invested in the ULIP fund. A portion of the ULIP premium goes towards buying the life cover or sum assured. Another portion goes towards a variety of fees like, premium allocation fees, policy administration fees, fund management etc. The balance premium is then invested in the ULIP fund.</p>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item sr-child">
						    <h2 class="accordion-header" id="headingEightteen">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEightteen" aria-expanded="false" aria-controls="collapseEightteen">
						        What is the difference between ETFs and mutual funds?
						      </button>
						    </h2>
						    <div id="collapseEightteen" class="accordion-collapse collapse" aria-labelledby="headingEightteen" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <p>An Exchange Traded Fund is essentially a basket of stocks that reflects the composition of an Index, like the Sensex or the Nifty. The price of the ETF reflects the net asset value of the basket of stocks. Exchange Traded Funds (ETFs) are are listed and traded on exchanges like stocks. There are various categories of ETFs in India. They are:-</p>
						        <p>Equity</p>
						        <p>Gold</p>
						        <p>World Indices</p>
						        <p>Debt</p>
						        <p>While an ETF is similar to a mutual fund in many ways, there are crucial differences between ETFs and mutual funds.</p>
						        <p>Unlike a mutual fund, where NAV is calculated at the end of the day, the price of the ETF changes real time throughout the day, based on the actual share prices of the underlying stocks at any point of time during the day</p>
						        <p>Mutual funds are actively managed, whereas ETFs are passively managed. Mutual funds aim to generate an alpha (or outperformance versus a market benchmark), whereas ETFs aim to track a particular index</p>
						        <p>Mutual funds have specific investment objectives, like capital appreciation, income generation, large cap stock focus, midcap stock focus, sector focus etc. ETFs only aim to track the relevant index and reduce tracking errors</p>
						        <p>Even though mutual funds aim to diversify unsystematic risks (or security specific risk), and they do diversify, to a large extent, there is likely to be still some residual unsystematic risk in mutual funds because mutual funds do not exactly reflect the market portfolio. ETFs, on the other hand, are only subject to systematic risk (or market risk), since they reflect the market portfolio. You need to have a demat account to invest in ETFs. On the other hand, you do not necessarily need to have a demat account to invest in mutual funds.</p>
						      </div>
						    </div>
						  </div>
						</div>
      </div>
      
      <div class="support-cta-section sr-reveal" data-sr-reveal-delay="0.3s">
        <h3>Still have questions?</h3>
        <p>Our wealth management advisors are here to provide personalized guidance tailored to your financial goals.</p>
        <div class="cta-buttons">
          <a href="/contactus" class="btn-primary-premium">Contact Our Team</a>
        </div>
      </div>

    </div>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.faq-search-box input');
    const searchBtn = document.querySelector('.faq-search-btn');
    const items = document.querySelectorAll('.accordion-item');

    function filterItems() {
        if(!searchInput) return;
        const query = searchInput.value.toLowerCase();
        
        items.forEach(item => {
            const text = item.textContent.toLowerCase();
            
            if (text.includes(query)) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
    }

    if(searchInput) {
        searchInput.addEventListener('keyup', filterItems);
        searchBtn.addEventListener('click', filterItems);
    }
});
</script>


