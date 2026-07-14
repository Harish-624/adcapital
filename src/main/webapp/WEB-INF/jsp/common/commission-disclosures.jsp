<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  .legal-hero {
    background: linear-gradient(135deg, #f8f9fa 0%, #eef1f6 100%);
    padding: 160px 0 80px;
    position: relative;
    overflow: hidden;
    border-bottom: 1px solid rgba(0,152,153,0.05);
  }
  .legal-hero::before {
    content: '';
    position: absolute;
    top: -50%; right: -20%;
    width: 700px; height: 700px;
    background: radial-gradient(circle, rgba(0,152,153,0.04) 0%, transparent 60%);
    border-radius: 50%;
  }
  .legal-hero .hero-label {
    display: inline-block;
    font-size: 12px; font-weight: 700;
    letter-spacing: 0.15em; text-transform: uppercase;
    color: #009899; margin-bottom: 20px;
  }
  .legal-hero h1 {
    color: #1a1f2e; font-size: 2.8rem;
    font-weight: 700; letter-spacing: -0.02em;
    margin-bottom: 15px;
  }
  .legal-hero .meta {
    color: #9ca3af; font-size: 14px;
    display: flex; align-items: center; gap: 20px; justify-content: center;
  }
  .legal-section {
    padding: 80px 0 60px;
    background: #fff;
  }
  .disclosure-card {
    background: #fff;
    border-radius: 24px;
    border: 1px solid #f3f4f6;
    box-shadow: 0 10px 40px rgba(0,0,0,0.03);
    padding: 50px;
  }
  .disclosure-note {
    background: rgba(0,152,153,0.05);
    border-left: 3px solid #009899;
    border-radius: 8px;
    padding: 16px 20px;
    color: #4b5563;
    font-size: 14px;
    line-height: 1.7;
    margin-bottom: 35px;
  }
  /* Premium Table */
  .premium-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    font-size: 14px;
  }
  .premium-table thead tr:first-child th {
    background: #1a1f2e;
    color: #fff;
    font-weight: 600;
    padding: 14px 16px;
    text-align: center;
  }
  .premium-table thead tr:first-child th:first-child {
    border-radius: 12px 0 0 0;
  }
  .premium-table thead tr:first-child th:last-child {
    border-radius: 0 12px 0 0;
  }
  .premium-table thead tr:nth-child(2) th {
    background: rgba(0,152,153,0.08);
    color: #009899;
    font-weight: 600;
    padding: 10px 14px;
    text-align: center;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }
  .premium-table tbody tr {
    transition: background 0.2s;
  }
  .premium-table tbody tr:hover {
    background: #fafbfc;
  }
  .premium-table tbody td {
    padding: 14px 16px;
    color: #4b5563;
    text-align: center;
    border-bottom: 1px solid #f3f4f6;
  }
  .premium-table tbody td:first-child {
    text-align: left;
    font-weight: 600;
    color: #1a1f2e;
  }
  .premium-table tbody tr:last-child td {
    border-bottom: none;
  }
  .premium-table tbody tr:last-child td:first-child {
    border-radius: 0 0 0 12px;
  }
  .premium-table tbody tr:last-child td:last-child {
    border-radius: 0 0 12px 0;
  }
  .table-wrapper {
    border-radius: 12px;
    overflow: hidden;
    border: 1px solid #f3f4f6;
    box-shadow: 0 4px 15px rgba(0,0,0,0.02);
  }
  @media (max-width: 768px) {
    .legal-hero h1 { font-size: 2rem; }
    .disclosure-card { padding: 25px 15px; }
    .premium-table { font-size: 12px; }
    .premium-table thead tr:first-child th,
    .premium-table tbody td { padding: 10px 8px; }
  }
</style>

<section class="legal-hero text-center">
  <div class="container">
    <div class="hero-label">Regulatory</div>
    <h1>Commission Disclosure</h1>
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
      <div class="col-lg-11">
        <div class="disclosure-card sr-reveal">

          <div class="disclosure-note">
            <strong>Regulatory Note:</strong> In compliance with SEBI guidelines, A D Capital Investment is required to disclose the commission received from Asset Management Companies (AMCs). The figures below represent the commission range (Min–Max) received as a percentage of Assets Under Management (AUM) per annum.
          </div>

          <div class="table-wrapper">
            <div class="table-responsive">
              <table class="premium-table" id="tbl_scheme_returns">
                <thead>
                  <tr>
                    <th>AMC Name</th>
                    <th colspan="2">Equity</th>
                    <th colspan="2">Hybrid</th>
                    <th colspan="2">Liquid</th>
                    <th colspan="2">Debt Funds</th>
                  </tr>
                  <tr>
                    <th>Category</th>
                    <th>Min %</th><th>Max %</th>
                    <th>Min %</th><th>Max %</th>
                    <th>Min %</th><th>Max %</th>
                    <th>Min %</th><th>Max %</th>
                  </tr>
                </thead>
                <tbody>
                  <tr><td>Aditya Birla</td><td>0.75</td><td>1.10</td><td>0.40</td><td>0.75</td><td>0.07</td><td>0.08</td><td>0.35</td><td>0.40</td></tr>
                  <tr><td>Axis</td><td>0.70</td><td>1.15</td><td>0.40</td><td>0.50</td><td>0.02</td><td>0.02</td><td>0.40</td><td>0.55</td></tr>
                  <tr><td>Bandhan</td><td>0.90</td><td>1.35</td><td>0.60</td><td>1.35</td><td>0.08</td><td>0.08</td><td>0.30</td><td>0.30</td></tr>
                  <tr><td>Canara Robeco</td><td>0.90</td><td>1.45</td><td>1.20</td><td>1.20</td><td>0.09</td><td>0.09</td><td>0.70</td><td>0.75</td></tr>
                  <tr><td>DSP</td><td>0.65</td><td>1.20</td><td>0.70</td><td>1.15</td><td>0.20</td><td>0.25</td><td>0.10</td><td>0.20</td></tr>
                  <tr><td>Edelweiss</td><td>0.90</td><td>1.00</td><td>0.60</td><td>1.00</td><td>0.05</td><td>0.10</td><td>0.20</td><td>0.50</td></tr>
                  <tr><td>Franklin Templeton</td><td>0.20</td><td>0.95</td><td>0.55</td><td>1.10</td><td>0.05</td><td>0.05</td><td>0.45</td><td>0.50</td></tr>
                  <tr><td>HDFC</td><td>0.72</td><td>1.30</td><td>0.50</td><td>1.00</td><td>0.10</td><td>0.10</td><td>0.45</td><td>0.75</td></tr>
                  <tr><td>ICICI</td><td>0.40</td><td>0.80</td><td>0.30</td><td>0.55</td><td>0.05</td><td>0.05</td><td>0.45</td><td>0.50</td></tr>
                  <tr><td>Kotak</td><td>1.15</td><td>1.50</td><td>0.95</td><td>1.15</td><td>0.03</td><td>0.03</td><td>0.75</td><td>1.05</td></tr>
                  <tr><td>Mirae</td><td>0.80</td><td>1.25</td><td>0.75</td><td>1.35</td><td>0.10</td><td>0.10</td><td>0.35</td><td>0.40</td></tr>
                  <tr><td>Motilal Oswal</td><td>1.00</td><td>1.15</td><td>1.15</td><td>1.15</td><td>0.15</td><td>0.15</td><td>0.07</td><td>0.07</td></tr>
                  <tr><td>Nippon</td><td>0.95</td><td>1.35</td><td>0.35</td><td>1.30</td><td>0.05</td><td>0.05</td><td>0.25</td><td>1.10</td></tr>
                  <tr><td>Parag Parikh</td><td>0.75</td><td>1.10</td><td>0.30</td><td>0.30</td><td>0.10</td><td>0.10</td><td>N.A</td><td>N.A</td></tr>
                  <tr><td>SBI</td><td>0.88</td><td>1.33</td><td>0.81</td><td>0.95</td><td>0.10</td><td>0.10</td><td>0.37</td><td>0.52</td></tr>
                  <tr><td>Sundaram</td><td>1.20</td><td>1.30</td><td>1.20</td><td>1.20</td><td>0.25</td><td>0.25</td><td>0.90</td><td>0.90</td></tr>
                  <tr><td>Tata</td><td>0.50</td><td>1.30</td><td>0.50</td><td>0.95</td><td>0.05</td><td>0.20</td><td>0.40</td><td>0.65</td></tr>
                  <tr><td>UTI</td><td>0.90</td><td>1.45</td><td>0.45</td><td>1.30</td><td>0.05</td><td>0.05</td><td>0.50</td><td>0.90</td></tr>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</section>
