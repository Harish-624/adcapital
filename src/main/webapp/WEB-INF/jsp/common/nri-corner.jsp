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
    <h1>NRI Corner FAQ</h1>
    <p>Find answers to common queries for Non-Resident Indians regarding investments and mutual funds.</p>
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
      <div class="accordion premium-accordion sr-reveal" data-sr-reveal-delay="0.2s" id="accordionExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingOne">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					        Who is an NRI?
					      </button>
					    </h2>
					    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>A person who does NOT satisfy the following conditions is an NRI </p>
					        <p>a) He/she is in India for 182 days or more during the financial year OR</p>
					        <p>b)	If he/she is in India for at least 365 days during the 4 years preceding that year AND at least 60 days in that year.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					        Who is a person of Indian origin (PIO)?
					      </button>
					    </h2>
					    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify">A Person of Indian Origin (PIO) means a foreign citizen (except a national of Pakistan, Afghanistan Bangladesh, China, Iran, Bhutan, Sri Lanka and Nepal) who at any time held an Indian passport.</p>
					        <p class="text-justify">OR who or either of their parents/ grand parents/ great grand parents was born and was permanently resident in India as defined in Government of India Act, 1935 and other territories that became part of India thereafter provided neither was at any time a citizen of any of the aforesaid countries (as referred above);</p>
					        <p class="text-justify">OR Who is a spouse of a citizen of India or a PIO.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					        What are the different types of rupee accounts that are permitted and can be maintained by NRIs?
					      </button>
					    </h2>
					    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify">A NRI can maintain three types of rupee accounts in India as mentioned below -</p>
					        <ol class="text-justify">
					        	<li>NRE: Non-Resident (External) Rupee Account</li>
					        	<li>NRO: Non-Resident (Ordinary) Rupee Account</li>
					        	<li>FCNR- B: Foreign Currency (Non -Resident)</li>
				        	</ol>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFour">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					        What are NRE and NRO accounts?
					      </button>
					    </h2>
					    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify">Non-Resident (External) Rupee (NRE) Account - NRE is a rupee bank account from which funds are freely repatriable. It can be opened with either funds remitted from abroad or local funds maintained in NRE/ FCNR accounts, which can be remitted abroad. The deposits can be used for all legitimate purposes. The balance in the account is freely repatriable.</p>
					        <p class="text-justify">Interest credited to the NRE accounts is exempt from tax in the hands of the NRI.</p>
					        <p class="text-justify">Non-Resident Ordinary Rupee (NRO) Account - NRO is a Rupee (INR) bank account and can be opened with funds either remitted from abroad or generated in India. The amounts in such an account generally cannot be repatriable. However, funds in NRO accounts can be remitted abroad subject to/as per various directives in force at the time of repatriation.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFive">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
					         What is the distinction between NRE and NRO accounts?
					      </button>
					    </h2>
					    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>Balances held in NRE accounts can be repatriated abroad freely, while funds in NRO accounts cannot be remitted abroad but have to be used only for local payments in rupees. Funds due to the non-resident accountholder which do not qualify, under the Exchange Control regulations, for remittance outside India are required to be credited to NRO accounts.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSix">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
					        Which Mutual Fund houses (AMCs) accept investments from NRIs or PIOs?
					      </button>
					    </h2>
					    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify">All the Asset Management Companies (AMCs) in India don't allow NRIs especially from US and Canada because of the cumbersome compliance requirements under Foreign Account Tax Compliance Act (FATCA) in these countries. However, following fund houses do accept investments from NRIs from US and Canada. From the following list of asset management companies, some of them may ask for physical declaration from the investors when they invest in their schemes -</p>
					        <ol>
					        	<li>1. Aditya Birla Sun Life Mutual Fund</li>
					        	<li>2. Axis Mutual Fund</li>
					        	<li>3. Bajaj Finserv Mutual Fund</li>
					        	<li>4. Bandhan Mutual Fund</li>
					        	<li>5. DSP Investment Managers</li>
					        	<li>6. Edelweiss Asset Management</li>
					        	<li>7. Groww Mutual Fund</li>
					        	<li>8. HDFC Mutual Fund</li>
					        	<li>9. ICICI Prudential Mutual Fund</li>
					        	<li>10. IIFL Asset Management</li>
					        	<li>11. ITI Mutual Fund</li>
					        	<li>12. Kotak Mahindra Mutual Fund</li>
					        	<li>13. Motilal Oswal Mutual Fund</li>
					        	<li>14. Nippon India Mutual Fund</li>
					        	<li>15. PPFAS Mutual Fund</li>
					        	<li>16. Quant Mutual Fund</li>
					        	<li>17. SBI Mutual Fund</li>
					        	<li>18. Sundaram Mutual Fund</li>
					        	<li>19. Samco Asset Management</li>
					        	<li>20. UTI Mutual Fund</li>
					        	<li>21. Whiteoak Mutual Fund</li>
				        	</ol>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSeven">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
					        Can NRIs from rest of the world (except from US and Canada) invest in Indian Mutual Funds?
					      </button>
					    </h2>
					    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>NRIs from other countries can invest in almost all schemes of all asset management companies in India. They are allowed to invest in mutual funds in India on a repatriable or non-repatriable basis subject to regulations prescribed under the Foreign Exchange Management Act (FEMA). For NRIs (not from USA and Canada) the process of investing in Indian mutual funds is same as that of resident individuals.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingEight">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
					        How the dividends and redemption proceeds are paid to NRIs?
					      </button>
					    </h2>
					    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>Normally, dividends and redemptions are paid through direct credit to the designated bank account provided by the NRI in the scheme.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingNine">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
					        Is the indexation benefit allowed to NRIs?
					      </button>
					    </h2>
					    <div id="collapseNine" class="accordion-collapse collapse" aria-labelledby="headingNine" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>Yes, the indexation benefit is allowed to NRIs. Generally indexation benefit is required to be taken into account after 3 years of holding the units in Mutual Funds, while calculating long term capital gains taxes for specified mutual funds which have 35% - 65% of the portfolio in Equity</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
					        What is the taxation of mutual funds for NRIs?
					      </button>
					    </h2>
					    <div id="collapseTen" class="accordion-collapse collapse" aria-labelledby="headingTen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify"><b>Equity or Equity oriented Mutual Funds:</b> Short term capital gains (holding period &lt; 1 year) are taxed at 15%. Apart from this tax, the applicable Surcharge and Cess is also payable on the capital gains tax. However, long term capital gains (investments held for more than 1 year) are completely tax free, if the capital gains in a year is less then/ up to Rs 1 Lakh in a financial year. Capital gains exceeding Rs 1 Lakh in a financial year are taxed at 10% + applicable Surcharge and Cess is levied on it. </p>
					        <p class="text-justify"><b>Debt Funds:</b> Short term capital gains (holding period &lt; 3 years) are taxed as per income tax slab of the NRI investor, plus the applicable Surcharge and Cess is also payable. This is applicable for investments made till 31st March 2023. Long term capital gains (holding period &gt; 3 years) are taxed (provided the funds are listed) at 20% after indexation, plus applicable Surcharge and Cess is also payable. This is applicable for investments made till 31st March 2023.</p>
					        <p class="text-justify">However, following the Amendment to Finance Bill 2023, the indexation benefit on debt mutual funds has been withdrawn. Debt funds will now be taxed at the investor's tax slab rate. These changes bring taxation of debt and debt oriented mutual funds at par with fixed deposits for investments made from 1st April 2023 onwards</p>
					        <p><b>The surcharge rates vary as per income as shown below -</b></p>
					        <img src="/images/nritax.webp" class="img-fluid" alt="">
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingEleven">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
					        How and when Tax is deducted (TDS) at source in case of NRIs?
					      </button>
					    </h2>
					    <div id="collapseEleven" class="accordion-collapse collapse" aria-labelledby="headingEleven" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify">NRIs are subject to Tax Deducted at Source (TDS) at applicable rates on capital gains at the time of redemptions of mutual fund units, irrespective of any threshold value. The rate of TDS depends on the type of mutual fund and the duration of the investment.</p>
					        <p class="text-justify">For Equity oriented mutual funds, the TDS rate is 10% for long term capital gains (LTCG) and 15% for short term capital gains (STCG).</p>
					        <p class="text-justify">For non-equity-oriented funds, the TDS rate is 20% with indexation for LTCG for listed schemes and 10% without indexation for unlisted schemes. TDS on short term capital gains is as per the income tax slab rate of 30% assuming that the investor falls under the highest tax slab. Surcharge and Cess is payable, wherever applicable.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwelve">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
					        What are Growth and Dividend Options in a Mutual Fund Scheme?
					      </button>
					    </h2>
					    <div id="collapseTwelve" class="accordion-collapse collapse" aria-labelledby="headingTwelve" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>Growth and Dividend are essentially options of how investors want cash-flows. During the course of a year, a mutual fund scheme may make profits through dividends from shares ownership or interests from bonds owned by the scheme and also through portfolio churn (profit booking by buying and selling shares and bonds). In a growth option the profit is re-invested to generate more returns whereas in dividend option (Known as IDCW - Income distribution cum withdrawal) the profits are distributed to the investors on a regular basis (annual, semi-annual, quarterly, monthly etc.). Dividends are declared on a per unit basis. Capital appreciation is much higher in growth option because investors benefit from compounding over a long investment horizon; NAV in growth options grows much more than dividend option where the NAVs get re-adjusted whenever the scheme declares dividends. However, some investors may need income during the tenure of the investment and dividend option is suitable for such investors.</p>
					        <p>Dividend re-investment is another option available to investors. In this option for the dividends instead of being distributed to investors, get re-invested to buy units of the scheme. A dividend re-investment option works very much like a growth option. The major difference between growth and dividend re-investment option is that, in growth option investor gets capital appreciation through growth in NAV, whereas in dividend re-investment option the investor gets capital appreciation through incremental units (the NAVs of dividend and dividend re-investment options are the same). Tax consequences of growth and dividend re-investment option are different.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingThirteen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
					        Is mutual fund dividends tax free for NRIs?
					      </button>
					    </h2>
					    <div id="collapseThirteen" class="accordion-collapse collapse" aria-labelledby="headingThirteen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>Dividends received from mutual funds are taxable in the hands of the investors. It is added to the income of the investor while filing IT returns.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFourteen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">
					        When certificate of TDS is issued to NRIs?
					      </button>
					    </h2>
					    <div id="collapseFourteen" class="accordion-collapse collapse" aria-labelledby="headingFourteen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify">Like resident individuals, TDS certificates (Form 16A) are issued on a quarterly basis to NRIs and emailed to their registered email ID with the AMC or sent through post. The same can also be viewed online after registering with TRACES (TDS reconciliation Analysis and Correction Enabling System) <a href="https://contents.tdscpc.gov.in/">https://contents.tdscpc.gov.in/</a><p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFifteen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFifteen" aria-expanded="false" aria-controls="collapseFifteen">
					        What are the KYC and FATCA requirements in case of NRIs?
					      </button>
					    </h2>
					    <div id="collapseFifteen" class="accordion-collapse collapse" aria-labelledby="headingFifteen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify">NRIs will need to submit following documents to the AMC (mutual fund house) or the RTA (Registrar and Transfer Agent) for fulfilling the mutual funds KYC requirements -</p>
					        <ol>
					        	<li>Self-attested copy of PAN</li>
					        	<li>Self-attested copy of Passport/ PIO Card</li>
					        	<li>Address proof (both Indian and Overseas)</li>
					        	<li>Passport size photograph</li>
					        	<li>Duly filled in KYC Form along with color passport size photograph</li>
					        	<li>Additional information required for FATCA (Foreign Account Tax Compliance Act) - Tax number of country of residency (Other than India).</li>
					        	<li>Income Slab</li>
					        	<li>Occupation</li>
					        	<li>Total net worth</li>
					        	<li>Declaration, if you are politically exposed or not</li>
				        	</ol>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSixteen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSixteen" aria-expanded="false" aria-controls="collapseSixteen">
					        How to get KYC and FATCA requirements fulfilled in India?
					      </button>
					    </h2>
					    <div id="collapseSixteen" class="accordion-collapse collapse" aria-labelledby="headingSixteen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>NRIs on a visit to India can simply contact a mutual fund distributor or visit any mutual fund registrar officer with the aforesaid documents and complete the KYC and FATCA process.</p>
					        <p>Documents verification and IPV will be done at the same time and you are good to start investing in mutual funds. IPV or In-person verification is a process wherein an authorized official confirms your presence and verifies the copies of aforesaid documents with the originals in your presence.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSeventeen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeventeen" aria-expanded="false" aria-controls="collapseSeventeen">
					        How to get In-person verification (IPV) done if the NRI is not in India?
					      </button>
					    </h2>
					    <div id="collapseSeventeen" class="accordion-collapse collapse" aria-labelledby="headingSeventeen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p class="text-justify">NRIs on a visit to India can simply contact a mutual fund distributor or visit any mutual fund registrar officer with the aforesaid documents and complete the KYC and FATCA process.</p>
					        <p>Once IPV and mandatory document verification is completed, you can send the KYC form along with the aforementioned documents to their mutual fund distributor or the fund house (AMC) or the mutual fund R&amp;T agents (CAMS or K-Fintech). On submission, the KYC information will be updated in the system in a few weeks.</p>
					        <p>Another way of doing this is to contact AMCs office or a distributor sitting in their respective countries which can initiate IPV of the documents and then those KYC forms and docs can be submitted via AMC houses or R&amp;T Agents.</p>
					        <p>The KYC details can be viewed by entering the PAN number here - <a href="https://www.cvlkra.com/">https://www.cvlkra.com/</a> and then clicking on 'KYC Inquiry' tab.</p>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingEightteen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEightteen" aria-expanded="false" aria-controls="collapseEightteen">
					        Can a NRI make a nomination in his investments?
					      </button>
					    </h2>
					    <div id="collapseEightteen" class="accordion-collapse collapse" aria-labelledby="headingEightteen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>An NRI can make a resident Indian or NRI/PIO his nominee in the mutual fund schemes in which he has invested. An NRI can also be the nominee for investments made by a local resident Indian individual. Fund houses also allow an NRI to have a joint holding with a resident Indian or another NRI / PIO in a scheme.</p>
					      </div>
					    </div>
				  	</div>
				  	<div class="accordion-item">
					    <h2 class="accordion-header" id="headingNineteen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNineteen" aria-expanded="false" aria-controls="collapseNineteen">
					      	Can a NRI invest in Mutual Fund Tax Savings Schemes?
					      </button>
					    </h2>
					    <div id="collapseNineteen" class="accordion-collapse collapse" aria-labelledby="headingNineteen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <p>Yes, an NRI/PIO can invest in ELSS (Equity Linked Savings Schemes) of Mutual Funds if he or she is willing to avail tax rebate under Section 80C of The Income Tax Act 1961. Currently the investment limit is Rs. 150,000 (Rupees One Lac Fifty Thousand only) in a financial year.</p>
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
