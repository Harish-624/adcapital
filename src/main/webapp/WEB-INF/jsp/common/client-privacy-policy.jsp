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
    <h1>Privacy Policy</h1>
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
            <a href="#privacy-overview">Overview</a>
            <a href="#data-sharing">Data Sharing</a>
            <a href="#cookies">Cookies</a>
            <a href="#user-rights">User Rights</a>
            <a href="#updates">Policy Updates</a>
          </div>
        </div>
      </div>
      <div class="col-lg-9">
        <div class="legal-card sr-reveal">
          <p id="privacy-overview">The User's right to privacy is of paramount importance to A D Capital Investment. Any information provided by the users will not be shared with any third party. A D Capital Investment reserves the right to use the information to provide the User a more personalized online experience. In general, you can visit without telling us who you are and without revealing any information about yourself. At times, however, we may need more information from you.</p>

          <h3 id="data-sharing">Data Sharing Policy</h3>
          <p>A D Capital Investment does not rent, sell, or share personal information about you with other people or non-affiliated companies except to provide products or services you've requested, when we have your permission, or under the following circumstances: We provide the information to trusted partners who work on behalf of or with A D Capital Investment under extremely strict confidentiality agreements. These companies may use your personal information to help A D Capital Investment communicate with you about product &amp; service offerings from A D Capital Investment and our marketing partners. However, these companies do not have any independent right to share this information.</p>

          <h3 id="cookies">Cookies</h3>
          <p>A D Capital Investment may use browser based cookies primarily for the purpose of identifying you on subsequent visits to our website. At times, information from cookies may also be used to customize the services for you. Please note that should you disable your browser from accepting cookies, some information or services may not be accessible to you.</p>

          <h3 id="user-rights">User Rights &amp; Age Policy</h3>
          <p>Unless required by court of law we do not reveal any information pertaining to the user or your usage data. We do not block access to users of any age as we expect that financial literacy has to be an integral part of one's life. We believe that users under 15 years of age would have permission from their parents/guardian before using any information published on this website. Also the users need to check up local country laws and regulation on accessing financial awareness / literacy websites before accessing A D Capital Investment. Registered users are the one who willfully provide us their user details like name, contact no., email id's and other demographics etc.</p>

          <h3 id="updates">Policy Updates</h3>
          <p>We would normally be communicating with registered users of the site through email, telephone and mailers etc. but from time to time we may have to communicate with the other users as well. Any incorrect data may be reported to us for correction. A D Capital Investment does not take any responsibility for correctness and safety of the user data. But we would take due care to maintain the safety and integrity of data. We update our privacy policy from time to time as we keep on adding more products, services &amp; features to our website. Please visit this page regularly to view the latest details on privacy policy.</p>
        </div>
      </div>
    </div>
  </div>
</section>
