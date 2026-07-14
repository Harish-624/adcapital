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
  .legal-card {
    background: #fff;
    border-radius: 24px;
    border: 1px solid #f3f4f6;
    box-shadow: 0 10px 40px rgba(0,0,0,0.03);
    padding: 60px;
  }
  .legal-card p {
    color: #4b5563;
    line-height: 1.9;
    font-size: 1.05rem;
    margin-bottom: 24px;
  }
  .legal-card h3 {
    color: #1a1f2e;
    font-size: 1.3rem;
    font-weight: 700;
    margin-top: 40px;
    margin-bottom: 16px;
    padding-bottom: 12px;
    border-bottom: 2px solid #f3f4f6;
  }
  .legal-card ol, .legal-card ul {
    color: #4b5563;
    line-height: 1.9;
    font-size: 1.05rem;
    padding-left: 30px;
  }
  .legal-card li { margin-bottom: 10px; }
  .legal-sidebar {
    position: sticky;
    top: 100px;
  }
  .legal-toc {
    background: #fafbfc;
    border-radius: 16px;
    border: 1px solid #f3f4f6;
    padding: 30px;
  }
  .legal-toc h5 {
    color: #1a1f2e; font-weight: 700;
    margin-bottom: 20px; font-size: 14px;
    text-transform: uppercase; letter-spacing: 0.1em;
  }
  .legal-toc a {
    display: block;
    color: #6b7280; font-size: 14px;
    text-decoration: none;
    padding: 8px 0;
    border-bottom: 1px solid #f3f4f6;
    transition: color 0.2s;
  }
  .legal-toc a:hover { color: #009899; }
  .legal-toc a:last-child { border-bottom: none; }
  @media (max-width: 768px) {
    .legal-hero h1 { font-size: 2rem; }
    .legal-card { padding: 30px 20px; }
  }
</style>

<section class="legal-hero text-center">
  <div class="container">
    <div class="hero-label">Legal</div>
    <h1>Terms &amp; Conditions</h1>
    <div class="meta">
      <span>Last updated: January 2025</span>
      <span>|</span>
      <span>A D Capital Investment</span>
    </div>
  </div>
</section>

<section class="legal-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 d-none d-lg-block">
        <div class="legal-sidebar">
          <div class="legal-toc">
            <h5>On This Page</h5>
            <a href="#acceptance">Acceptance</a>
            <a href="#services">Services</a>
            <a href="#intellectual-property">Intellectual Property</a>
            <a href="#liability">Liability</a>
            <a href="#governing-law">Governing Law</a>
          </div>
        </div>
      </div>
      <div class="col-lg-9">
        <div class="legal-card sr-reveal">
          <h3 id="acceptance">Acceptance of Terms</h3>
          <p>By accessing and using the A D Capital Investment website, you accept and agree to be bound by the terms and provisions of this agreement. In addition, when using these particular services, you shall be subject to any posted guidelines or rules applicable to such services. Any participation in this service will constitute acceptance of this agreement. If you do not agree to abide by the above, please do not use this service.</p>

          <h3 id="services">Services Offered</h3>
          <p>A D Capital Investment provides financial planning, investment advisory, and mutual fund distribution services. The information provided on this website is for general informational purposes only and does not constitute investment advice. All investment decisions should be made based on your own independent evaluation and after consulting with a qualified financial advisor.</p>
          <p>Past performance is not indicative of future results. Mutual fund investments are subject to market risks. Please read all scheme related documents carefully before investing.</p>

          <h3 id="intellectual-property">Intellectual Property</h3>
          <p>The content, layout, design, data, databases and graphics on this website are protected by Indian and international intellectual property laws. All rights including copyright are owned by or licensed to A D Capital Investment. You may view the content of this website on screen and print one copy of any content for your personal, non-commercial use only. Any other use, including reproduction, modification, distribution, transmission, republication, display or performance, of the content on this website is strictly prohibited.</p>

          <h3 id="liability">Limitation of Liability</h3>
          <p>A D Capital Investment shall not be liable for any special, incidental, indirect or consequential damages of any kind in connection with this agreement, even if A D Capital has been informed in advance of the possibility of such damages. All information provided through our website is believed to be from reliable sources. However, A D Capital Investment makes no warranty as to the accuracy or completeness of such information.</p>

          <h3 id="governing-law">Governing Law</h3>
          <p>This agreement shall be governed by and construed in accordance with the laws of India. Any dispute arising under this agreement shall be subject to the exclusive jurisdiction of the courts located in India. A D Capital Investment reserves the right to update and change these Terms &amp; Conditions from time to time without notice. Continued use of the website after any such changes shall constitute your consent to such changes.</p>
        </div>
      </div>
    </div>
  </div>
</section>
