<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  /* ── Premium Detail Hero ─────────────────────────────── */
  .premium-detail-hero {
    background: linear-gradient(135deg, #009899 0%, #007677 100%);
    padding: 120px 0 160px;
    position: relative;
    overflow: hidden;
  }
  .premium-detail-hero::before {
    content: '';
    position: absolute;
    top: -50%; right: -20%;
    width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 60%);
    border-radius: 50%;
  }
  .detail-breadcrumb {
    margin-bottom: 25px;
    position: relative;
    z-index: 2;
  }
  .detail-breadcrumb a, .detail-breadcrumb span {
    color: rgba(255,255,255,0.7);
    font-size: 14px;
    text-decoration: none;
    font-weight: 500;
  }
  .detail-breadcrumb a:hover {
    color: #fff;
  }
  .detail-breadcrumb .separator {
    margin: 0 10px;
    color: rgba(255,255,255,0.4);
  }
  .premium-detail-hero h1 {
    color: #fff;
    font-size: 3.2rem;
    font-weight: 700;
    line-height: 1.25;
    letter-spacing: -0.01em;
    margin-bottom: 25px;
    position: relative;
    z-index: 2;
  }
  .detail-meta {
    color: rgba(255,255,255,0.9);
    font-size: 15px;
    display: flex;
    align-items: center;
    gap: 20px;
    position: relative;
    z-index: 2;
  }
  .detail-meta span {
    display: flex;
    align-items: center;
    gap: 8px;
  }
  .detail-meta .news-tag {
    background: rgba(255,255,255,0.15);
    padding: 4px 12px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  /* ── Content Container ─────────────────────────────── */
  .detail-content-wrapper {
    background: #fafbfc;
    padding-bottom: 80px;
    position: relative;
  }
  .detail-main-card {
    background: #fff;
    border-radius: 24px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.06);
    padding: 0;
    margin-top: -100px;
    position: relative;
    z-index: 10;
    border: 1px solid #f3f4f6;
    overflow: hidden;
  }
  .detail-body {
    padding: 60px 80px;
    color: #4b5563;
    font-size: 1.1rem;
    line-height: 1.9;
  }
  .detail-body h1, .detail-body h2, .detail-body h3, .detail-body h4 {
    color: #1a1f2e;
    font-weight: 700;
    margin-top: 40px;
    margin-bottom: 20px;
  }
  .detail-body img {
    max-width: 100%;
    border-radius: 16px;
    margin: 30px 0;
  }
  .detail-body p[align="justify"] {
    text-align: left !important;
  }
  .detail-body a {
    color: #009899;
    text-decoration: none;
    font-weight: 500;
  }
  .detail-body a:hover {
    text-decoration: underline;
  }
  .share-section {
    margin-top: 60px;
    padding-top: 30px;
    border-top: 1px solid #f3f4f6;
    display: flex;
    align-items: center;
    gap: 15px;
  }
  .share-section span {
    font-weight: 600;
    color: #1a1f2e;
  }
  .share-btn {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: #f3f4f6;
    color: #4b5563;
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    transition: all 0.2s;
  }
  .share-btn:hover {
    background: #009899;
    color: #fff;
    transform: translateY(-2px);
  }

  @media (max-width: 992px) {
    .detail-body { padding: 40px; }
  }
  @media (max-width: 768px) {
    .premium-detail-hero { padding: 80px 0 120px; }
    .premium-detail-hero h1 { font-size: 2.2rem; }
    .detail-body { padding: 30px 20px; font-size: 1rem; }
    .detail-meta { flex-wrap: wrap; gap: 10px; }
  }
</style>

<section class="premium-detail-hero">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-10">
        <div class="detail-breadcrumb">
          <a href="/">Home</a><span class="separator">/</span>
          <a href="/news">News</a><span class="separator">/</span>
          <span>Article</span>
        </div>
        <h1><c:out value="${news.title}"/></h1>
        <div class="detail-meta">
          <span class="news-tag"><c:out value="${not empty news.category ? news.category : 'News Update'}" /></span>
          <span style="opacity:0.5;">|</span>
          <span><i class="far fa-calendar-alt"></i> ${news.created_on != null ? news.created_on : 'Recent News'}</span>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="detail-content-wrapper">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-10">
        <div class="detail-main-card sr-reveal">
          
          <div class="detail-body">
            <article>
              <c:out value="${fn:replace(news.full_content,'<p>', '<p>')}" escapeXml="false" />
            </article>

            <div class="share-section">
              <span>Share this news:</span>
              <a href="#" class="share-btn"><i class="fab fa-linkedin-in"></i></a>
              <a href="#" class="share-btn"><i class="fab fa-twitter"></i></a>
              <a href="#" class="share-btn"><i class="fab fa-facebook-f"></i></a>
              <a href="#" class="share-btn"><i class="fas fa-link"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>