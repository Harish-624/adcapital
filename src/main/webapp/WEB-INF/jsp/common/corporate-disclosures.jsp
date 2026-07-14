<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  .legal-hero {
    background: linear-gradient(135deg, #f8f9fa 0%, #eef1f6 100%);
    padding: 160px 0 80px; position: relative; overflow: hidden;
    border-bottom: 1px solid rgba(0,152,153,0.05);
  }
  .legal-hero::before {
    content: ''; position: absolute; top: -50%; right: -20%;
    width: 700px; height: 700px;
    background: radial-gradient(circle, rgba(0,152,153,0.04) 0%, transparent 60%);
    border-radius: 50%;
  }
  .legal-hero .hero-label {
    display: inline-block; font-size: 12px; font-weight: 700;
    letter-spacing: 0.15em; text-transform: uppercase;
    color: #009899; margin-bottom: 20px;
  }
  .legal-hero h1 {
    color: #1a1f2e; font-size: 2.8rem; font-weight: 700;
    letter-spacing: -0.02em; margin-bottom: 15px;
  }
  .legal-hero .meta {
    color: #9ca3af; font-size: 14px;
    display: flex; align-items: center; gap: 20px; justify-content: center;
  }
  .legal-section { padding: 80px 0 60px; background: #fff; }
  .disclosure-card {
    background: #fff; border-radius: 24px;
    border: 1px solid #f3f4f6; box-shadow: 0 10px 40px rgba(0,0,0,0.03);
    padding: 50px;
  }
  .disclosure-note {
    background: rgba(0,152,153,0.05); border-left: 3px solid #009899;
    border-radius: 8px; padding: 16px 20px; color: #4b5563;
    font-size: 14px; line-height: 1.7; margin-bottom: 35px;
  }
  .premium-table { width: 100%; border-collapse: separate; border-spacing: 0; font-size: 14px; }
  .premium-table thead tr th {
    background: #1a1f2e; color: #fff; font-weight: 600;
    padding: 14px 16px; text-align: left;
  }
  .premium-table thead tr th:first-child { border-radius: 12px 0 0 0; width: 8%; text-align: center; }
  .premium-table thead tr th:last-child { border-radius: 0 12px 0 0; }
  .premium-table tbody tr { transition: background 0.2s; }
  .premium-table tbody tr:hover { background: #fafbfc; }
  .premium-table tbody td {
    padding: 14px 16px; color: #4b5563;
    border-bottom: 1px solid #f3f4f6;
  }
  .premium-table tbody td:first-child { text-align: center; font-weight: 600; color: #9ca3af; }
  .premium-table tbody td:nth-child(2) { font-weight: 600; color: #1a1f2e; }
  .premium-table tbody td a {
    color: #009899; text-decoration: none; font-weight: 600;
    transition: color 0.2s;
  }
  .premium-table tbody td a:hover { color: #0085A1; text-decoration: underline; }
  .premium-table tbody tr:last-child td { border-bottom: none; }
  .table-wrapper {
    border-radius: 12px; overflow: hidden;
    border: 1px solid #f3f4f6; box-shadow: 0 4px 15px rgba(0,0,0,0.02);
  }
  @media (max-width: 768px) {
    .legal-hero h1 { font-size: 2rem; }
    .disclosure-card { padding: 25px 15px; }
    .premium-table { font-size: 12px; }
    .premium-table thead tr th, .premium-table tbody td { padding: 10px 8px; }
  }
</style>

<section class="legal-hero text-center">
  <div class="container">
    <div class="hero-label">Regulatory</div>
    <h1>Mandatory Disclosure</h1>
    <div class="meta">
      <span>SEBI Mandated Disclosure</span>
      <span>|</span>
      <span>A D Capital Investment</span>
    </div>
  </div>
</section>

<section class="legal-section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-10">
        <div class="disclosure-card sr-reveal">
          <div class="disclosure-note">
            <strong>Regulatory Note:</strong> As mandated by SEBI, A D Capital Investment is required to provide links to statutory disclosures of all associated Asset Management Companies (AMCs). Please click the respective links below to access each AMC's mandatory disclosures including SID, KIM, SAI, and addendums.
          </div>
          <div class="table-wrapper">
            <div class="table-responsive">
              <table class="premium-table" id="tbl_scheme_returns">
                <thead>
                  <tr>
                    <th>S.No</th>
                    <th>AMC Name</th>
                    <th>Disclosure Link</th>
                  </tr>
                </thead>
                <tbody>
                  <tr><td>1</td><td>360 ONE Mutual Fund</td><td><a href="https://www.360.one/asset-management/mutualfund/downloads/disclosures/" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>2</td><td>Aditya Birla Mutual Fund</td><td><a href="https://mutualfund.adityabirlacapital.com/forms-and-downloads/disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>3</td><td>Axis Mutual Fund</td><td><a href="https://www.axismf.com/statutory-disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>4</td><td>Bajaj Finserv Mutual Fund</td><td><a href="https://www.bajajamc.com/downloads?statutory-disclosures=" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>5</td><td>Bandhan Mutual Fund</td><td><a href="https://www.bandhanmutual.com/invest-in-mutual-funds/downloads-statutory-disclosure" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>6</td><td>Bank of India Mutual Fund</td><td><a href="https://www.boimf.in/statutory-disclosures.php" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>7</td><td>Baroda BNP Paribas Mutual Fund</td><td><a href="https://www.barodabnpparibasmf.in/investor_relations" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>8</td><td>Canara Robeco Mutual Fund</td><td><a href="https://www.canararobeco.com/forms-downloads/notice-addendum/notice-cum-addendum" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>9</td><td>DSP Mutual Fund</td><td><a href="https://www.dspim.com/mandatory-disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>10</td><td>Edelweiss Mutual Fund</td><td><a href="https://www.edelweissmf.com/downloads/sai-&-amendments" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>11</td><td>Franklin Templeton Mutual Fund</td><td><a href="https://www.franklintempletonindia.com/downloads/fund-documents" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>12</td><td>Groww Mutual Fund</td><td><a href="https://www.growwmf.in/downloads/kim" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>13</td><td>HDFC Mutual Fund</td><td><a href="https://www.hdfcfund.com/statutory-disclosure" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>14</td><td>Helios Capital Mutual Fund</td><td><a href="https://www.heliosmf.in/downloads/" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>15</td><td>HSBC Mutual Fund</td><td><a href="https://www.assetmanagement.hsbc.co.in/en/mutual-funds/investor-resources" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>16</td><td>ICICI Prudential Mutual Fund</td><td><a href="https://www.archive.icicipruamc.com/downloads/forms/application-forms" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>17</td><td>Invesco Mutual Fund</td><td><a href="https://www.invescomutualfund.com/literature-and-form?tab=Factsheets" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>18</td><td>ITI Mutual Fund</td><td><a href="https://www.itiamc.com/downloads" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>19</td><td>JM Financial Mutual Fund</td><td><a href="http://jmfinancialmf.com/downloads/Statutory-Disclosure" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>20</td><td>Kotak Mahindra Mutual Fund</td><td><a href="https://www.kotak.com/en/personal-banking/investments/mutual-funds/fact-sheet-offer-document.html" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>21</td><td>LIC Mutual Fund</td><td><a href="https://www.licmf.com/sid-kim-sai" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>22</td><td>Mahindra Manulife Mutual Fund</td><td><a href="https://www.mahindramanulife.com/downloads" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>23</td><td>Mirae Mutual Fund</td><td><a href="https://www.miraeassetmf.co.in/downloads/statutory-disclosure/addendum" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>24</td><td>Motilal Oswal Mutual Fund</td><td><a href="https://www.motilaloswalmf.com/download/addendums" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>25</td><td>Navi Mutual Fund</td><td><a href="https://navi.com/mutual-fund/downloads/statutory-disclosure" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>26</td><td>Nippon Life Mutual Fund</td><td><a href="https://mf.nipponindiaim.com/investorservices/factsheetsdocuments/fundamentals-may-2021/Innerpage/Disclaimers.html" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>27</td><td>NJ Mutual Fund</td><td><a href="https://downloads.njmutualfund.com/downloads.php" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>28</td><td>Old Bridge Mutual Fund</td><td><a href="https://www.oldbridgemf.com/statutory-disclosures.html" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>29</td><td>PGIM India Mutual Fund</td><td><a href="https://www.pgimindiamf.com/statutory-disclosure" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>30</td><td>PPFAS Mutual Fund</td><td><a href="https://amc.ppfas.com/statutory-disclosures/" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>31</td><td>Quant Money Managers</td><td><a href="https://quantmutual.com/statutory-disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>32</td><td>Quantum Mutual Fund</td><td><a href="https://www.quantumamc.com/regulatory-document" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>33</td><td>Samco Mutual Fund</td><td><a href="https://www.samcomf.com/downloads" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>34</td><td>SBI Mutual Fund</td><td><a href="https://www.sbimf.com/disclosure" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>35</td><td>Shriram Mutual Fund</td><td><a href="https://www.shriramamc.in/investor-statutory-disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>36</td><td>Sundaram Mutual Fund</td><td><a href="https://sundarammutual.com/Statutory-Disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>37</td><td>Tata Mutual Fund</td><td><a href="https://www.tatamutualfund.com/statutory-disclosures/other-statutory-disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>38</td><td>Taurus Mutual Fund</td><td><a href="https://www.taurusmutualfund.com" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>39</td><td>Trust Mutual Fund</td><td><a href="https://www.trustmf.com/disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>40</td><td>Union Mutual Fund</td><td><a href="https://www.unionmf.com/about-us/downloads" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>41</td><td>UTI Mutual Fund</td><td><a href="https://www.utimf.com/statutory-disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>42</td><td>WhiteOak Mutual Fund</td><td><a href="https://mf.whiteoakamc.com/regulatory-disclosures" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>43</td><td>Zerodha Mutual Fund</td><td><a href="https://www.zerodhafundhouse.com/resources/disclosures/" target="_blank">View Disclosure ↗</a></td></tr>
                  <tr><td>44</td><td>AMFI Press Release</td><td><a href="https://www.amfiindia.com/press_release" target="_blank">View Disclosure ↗</a></td></tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
