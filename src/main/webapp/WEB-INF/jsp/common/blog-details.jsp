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
    font-size: 3.5rem;
    font-weight: 700;
    line-height: 1.2;
    letter-spacing: -0.02em;
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
  .detail-meta .avatar {
    width: 32px;
    height: 32px;
    background: rgba(255,255,255,0.2);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    font-weight: 700;
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
  .detail-featured-image {
    width: 100%;
    height: 450px;
    object-fit: cover;
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
  .detail-body a {
    color: #009899;
    text-decoration: none;
    font-weight: 500;
  }
  .detail-body a:hover {
    text-decoration: underline;
  }
  .detail-body blockquote {
    border-left: 4px solid #009899;
    padding: 20px 30px;
    background: rgba(0,152,153,0.04);
    border-radius: 0 12px 12px 0;
    margin: 30px 0;
    font-style: italic;
    color: #1a1f2e;
    font-size: 1.2rem;
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
    .detail-featured-image { height: 250px; }
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
          <a href="/blog">Blog</a><span class="separator">/</span>
          <span>Article</span>
        </div>
        <h1><c:out value="${blogs.title}"/></h1>
        <div class="detail-meta">
          <span><div class="avatar">AD</div> A D Capital</span>
          <span style="opacity:0.5;">|</span>
          <span><i class="far fa-calendar-alt"></i> ${blogs.createdDate != null ? blogs.createdDate : 'Published Recently'}</span>
          <span style="opacity:0.5;">|</span>
          <span><i class="far fa-clock"></i> 5 min read</span>
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
          <c:if test="${not empty blogs.image}">
            <img src="<c:url value="${blogs.image}" loading="lazy"/>" alt="${blogs.title}" class="detail-featured-image">
          </c:if>
          
          <div class="detail-body">
            <article>
              <c:out value="${blogs.content}" escapeXml="false"></c:out>
            </article>

            <div class="share-section">
              <span>Share this article:</span>
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