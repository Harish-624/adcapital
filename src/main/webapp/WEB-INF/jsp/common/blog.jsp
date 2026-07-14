<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  /* ── Premium Hero Section ─────────────────────────────── */
  .premium-blog-hero {
    background: linear-gradient(135deg, #f8f9fa 0%, #eef1f6 100%);
    padding: 160px 0 80px;
    position: relative;
    overflow: hidden;
    border-bottom: 1px solid rgba(0, 152, 153, 0.05);
  }
  .premium-blog-hero::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -20%;
    width: 800px;
    height: 800px;
    background: radial-gradient(circle, rgba(0, 152, 153, 0.04) 0%, transparent 60%);
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
  .premium-blog-hero h1 {
    color: #1a1f2e;
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 20px;
    letter-spacing: -0.02em;
  }
  .premium-blog-hero p {
    color: #4b5563;
    font-size: 1.1rem;
    line-height: 1.7;
    max-width: 600px;
    margin: 0 auto;
  }

  /* ── Search Bar ─────────────────────────────── */
  .blog-search-wrapper {
    margin-top: -35px;
    position: relative;
    z-index: 10;
    margin-bottom: 50px;
  }
  .blog-search-box {
    background: #fff;
    border-radius: 50px;
    padding: 8px 12px 8px 30px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.04), 0 5px 15px rgba(0,0,0,0.02);
    display: flex;
    align-items: center;
    max-width: 650px;
    margin: 0 auto;
    border: 1px solid rgba(0,0,0,0.03);
    transition: all 0.3s ease;
  }
  .blog-search-box:focus-within {
    box-shadow: 0 20px 45px rgba(0, 152, 153, 0.08);
    border-color: rgba(0, 152, 153, 0.2);
  }
  .blog-search-box i {
    color: #9ca3af;
    font-size: 20px;
  }
  .blog-search-box input {
    border: none;
    box-shadow: none;
    font-size: 1.05rem;
    color: #1a1f2e;
    padding: 15px 20px;
    width: 100%;
  }
  .blog-search-box input:focus {
    outline: none;
  }
  .blog-search-box input::placeholder {
    color: #9ca3af;
  }
  .blog-search-btn {
    background: #009899;
    color: #fff;
    border: none;
    border-radius: 40px;
    padding: 12px 30px;
    font-weight: 600;
    transition: all 0.3s ease;
  }
  .blog-search-btn:hover {
    background: #0085A1;
    transform: translateY(-1px);
  }

  /* ── Premium Blog Cards ─────────────────────────────── */
  .premium-blog-card {
    background: #fff;
    border-radius: 20px;
    border: 1px solid #f3f4f6;
    overflow: hidden;
    transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
    box-shadow: 0 10px 30px rgba(0,0,0,0.03);
    height: 100%;
    display: flex;
    flex-direction: column;
  }
  .premium-blog-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0,0,0,0.08);
    border-color: rgba(0,152,153,0.15);
  }
  .blog-img-wrapper {
    position: relative;
    overflow: hidden;
    padding-top: 60%; /* Aspect ratio 5:3 */
  }
  .blog-img-wrapper img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.6s cubic-bezier(0.165, 0.84, 0.44, 1);
  }
  .premium-blog-card:hover .blog-img-wrapper img {
    transform: scale(1.05);
  }
  .blog-card-content {
    padding: 30px;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
  }
  .blog-meta {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 15px;
    font-size: 13px;
    color: #6b7280;
    font-weight: 500;
  }
  .blog-meta span {
    display: flex;
    align-items: center;
    gap: 6px;
  }
  .blog-title {
    color: #1a1f2e;
    font-size: 1.25rem;
    font-weight: 700;
    line-height: 1.4;
    margin-bottom: 15px;
    transition: color 0.2s;
  }
  .premium-blog-card:hover .blog-title {
    color: #009899;
  }
  .blog-excerpt {
    color: #4b5563;
    font-size: 0.95rem;
    line-height: 1.6;
    margin-bottom: 25px;
    flex-grow: 1;
  }
  .blog-read-more {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #009899;
    font-weight: 600;
    font-size: 14px;
    text-decoration: none;
    transition: all 0.2s;
    margin-top: auto;
  }
  .blog-read-more i {
    transition: transform 0.2s;
  }
  .premium-blog-card:hover .blog-read-more i {
    transform: translateX(4px);
  }

  @media (max-width: 768px) {
    .premium-blog-hero h1 { font-size: 2.2rem; }
    .blog-search-box { padding: 6px 8px 6px 20px; }
    .blog-search-box input { font-size: 1rem; padding: 12px 10px; }
    .blog-search-btn { padding: 10px 20px; }
  }
</style>

<section class="premium-blog-hero text-center">
  <div class="container">
    <div class="hero-label">Insights &amp; Updates</div>
    <h1>Our Blog</h1>
    <p>Discover the latest financial trends, investment strategies, and expert advice from A D Capital Investment.</p>
  </div>
</section>

<div class="container mb-5">
  <div class="blog-search-wrapper sr-reveal">
    <div class="blog-search-box">
      <i class="fa fa-search"></i>
      <input type="text" placeholder="Search articles...">
      <button class="blog-search-btn">Search</button>
    </div>
  </div>

  <div class="row g-4 sr-section">
    <c:forEach items="${blogsList}" var="blogs">
      <div class="col-lg-4 col-md-6 sr-child" data-sr-reveal-delay="0.2s">
        <a href="/blog/${blogs.id}" style="text-decoration: none;">
          <div class="premium-blog-card">
            <div class="blog-img-wrapper">
              <img src="${blogs.image}" alt="<c:out value="${blogs.title}"/>">
            </div>
            <div class="blog-card-content">
              <div class="blog-meta">
                <span><i class="far fa-calendar-alt"></i> ${blogs.createdDate != null ? blogs.createdDate : 'Recent'}</span>
              </div>
              <h3 class="blog-title"><c:out value="${fn:substring(blogs.title,0,50)}" />...</h3>
              <p class="blog-excerpt"><c:out value="${fn:substring(blogs.shortContent,0,100)}" />...</p>
              <div class="blog-read-more">Read Article <i class="fa fa-arrow-right"></i></div>
            </div>
          </div>
        </a>
      </div>
    </c:forEach>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.blog-search-box input');
    const searchBtn = document.querySelector('.blog-search-btn');
    const cards = document.querySelectorAll('.col-lg-4, .col-md-6');

    function filterCards() {
        if(!searchInput) return;
        const query = searchInput.value.toLowerCase();
        
        cards.forEach(card => {
            if(!card.querySelector('.premium-blog-card')) return;
            const title = card.querySelector('.blog-title').textContent.toLowerCase();
            const excerpt = card.querySelector('.blog-excerpt').textContent.toLowerCase();
            
            if (title.includes(query) || excerpt.includes(query)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    if(searchInput) {
        searchInput.addEventListener('keyup', filterCards);
        searchBtn.addEventListener('click', filterCards);
    }
});
</script>
