<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  /* ── Premium Hero Section ─────────────────────────────── */
  .premium-news-hero {
    background: linear-gradient(135deg, #f8f9fa 0%, #eef1f6 100%);
    padding: 160px 0 80px;
    position: relative;
    overflow: hidden;
    border-bottom: 1px solid rgba(0, 152, 153, 0.05);
  }
  .premium-news-hero::before {
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
  .premium-news-hero h1 {
    color: #1a1f2e;
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 20px;
    letter-spacing: -0.02em;
  }
  .premium-news-hero p {
    color: #4b5563;
    font-size: 1.1rem;
    line-height: 1.7;
    max-width: 600px;
    margin: 0 auto;
  }

  /* ── Search Bar ─────────────────────────────── */
  .news-search-wrapper {
    margin-top: -35px;
    position: relative;
    z-index: 10;
    margin-bottom: 50px;
  }
  .news-search-box {
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
  .news-search-box:focus-within {
    box-shadow: 0 20px 45px rgba(0, 152, 153, 0.08);
    border-color: rgba(0, 152, 153, 0.2);
  }
  .news-search-box i {
    color: #9ca3af;
    font-size: 20px;
  }
  .news-search-box input {
    border: none;
    box-shadow: none;
    font-size: 1.05rem;
    color: #1a1f2e;
    padding: 15px 20px;
    width: 100%;
  }
  .news-search-box input:focus {
    outline: none;
  }
  .news-search-box input::placeholder {
    color: #9ca3af;
  }
  .news-search-btn {
    background: #009899;
    color: #fff;
    border: none;
    border-radius: 40px;
    padding: 12px 30px;
    font-weight: 600;
    transition: all 0.3s ease;
  }
  .news-search-btn:hover {
    background: #0085A1;
    transform: translateY(-1px);
  }

  /* ── Premium News Cards ─────────────────────────────── */
  .premium-news-card {
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
  .premium-news-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0,0,0,0.08);
    border-color: rgba(0,152,153,0.15);
  }
  .news-card-content {
    padding: 35px 30px;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
  }
  .news-meta {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 20px;
    font-size: 13px;
    color: #009899;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }
  .news-meta span {
    display: flex;
    align-items: center;
    gap: 6px;
  }
  .news-title {
    color: #1a1f2e;
    font-size: 1.35rem;
    font-weight: 700;
    line-height: 1.4;
    margin-bottom: 15px;
    transition: color 0.2s;
  }
  .premium-news-card:hover .news-title {
    color: #009899;
  }
  .news-excerpt {
    color: #4b5563;
    font-size: 0.95rem;
    line-height: 1.6;
    margin-bottom: 25px;
    flex-grow: 1;
  }
  .news-read-more {
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
  .news-read-more i {
    transition: transform 0.2s;
  }
  .premium-news-card:hover .news-read-more i {
    transform: translateX(4px);
  }
  
  /* Pagination */
  .premium-pagination .page-item .page-link {
    border: none;
    color: #4b5563;
    font-weight: 600;
    margin: 0 5px;
    border-radius: 8px;
    padding: 10px 16px;
    transition: all 0.2s;
  }
  .premium-pagination .page-item.active .page-link,
  .premium-pagination .page-item .page-link:hover {
    background-color: #009899;
    color: #fff;
    box-shadow: 0 4px 10px rgba(0,152,153,0.3);
  }

  @media (max-width: 768px) {
    .premium-news-hero h1 { font-size: 2.2rem; }
    .news-search-box { padding: 6px 8px 6px 20px; }
    .news-search-box input { font-size: 1rem; padding: 12px 10px; }
    .news-search-btn { padding: 10px 20px; }
  }
</style>

<section class="premium-news-hero text-center">
  <div class="container">
    <div class="hero-label">Media &amp; Press</div>
    <h1>Latest News</h1>
    <p>Stay informed with the most recent updates, announcements, and coverage from A D Capital Investment.</p>
  </div>
</section>

<div class="container mb-5">
  <div class="news-search-wrapper sr-reveal">
    <div class="news-search-box">
      <i class="fa fa-search"></i>
      <input type="text" placeholder="Search news...">
      <button class="news-search-btn">Search</button>
    </div>
  </div>

<c:choose>
<c:when test="${not empty newslist}">
  <div class="row g-4 mb-5 sr-section">
      <c:forEach items="${newslist}" var="news" varStatus="theCount">
        <div class="col-lg-4 col-md-6 sr-child" data-sr-reveal-delay="0.2s">
          <a href="/news/<c:out value="${fn:replace(fn:trim(news.category),' ','-')}"/>/<c:out value="${fn:replace(fn:trim(news.title),' ','-')}"/>" style="text-decoration: none;">
            <div class="premium-news-card">
              <div class="news-card-content">
                <div class="news-meta">
                  <span><i class="far fa-newspaper"></i> <c:out value="${not empty news.category ? news.category : 'News Update'}" /></span>
                </div>
                <h3 class="news-title"><c:out value="${fn:substring(news.title,0,50)}" />...</h3>
                <p class="news-excerpt"><c:out value="${fn:substring(news.small_content,0,120)}" />...</p>
                <div class="news-read-more">Read Full Story <i class="fa fa-arrow-right"></i></div>
              </div>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>

    <!-- Pagination -->
    <div class="row sr-reveal" data-sr-reveal-delay="0.3s">
      <div class="col-md-12">
        <c:if test="${newsPageCount > 1}">
          <ul class="pagination premium-pagination justify-content-center">
            <c:choose>
              <c:when test="${pageid eq 1}">
                <li class="page-item"><a href="#" aria-label="Previous" class="page-link"><i class="fa fa-angle-left"></i></a></li>
              </c:when>
              <c:otherwise>
                <li class="page-item"><a class="page-link" href="<c:url value="?pageid=${pageid - 1}"/>" aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>
              </c:otherwise>
            </c:choose>
            
            <c:forEach begin="${beginPaginatorId}" end="${endPaginatorId}" step="1" varStatus="loop">
              <c:choose>
                <c:when test="${loop.index == pageid}">
                  <li class="page-item active"><a class="page-link" href="<c:url value="?pageid=${loop.index}"/>"><c:out value="${loop.index}"/></a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item"><a class="page-link" href="<c:url value="?pageid=${loop.index}"/>"><c:out value="${loop.index}"/></a></li>
                </c:otherwise>
              </c:choose>
            </c:forEach>
            
            <c:choose>
              <c:when test="${pageid eq blogsPageCount}">
                <li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"><i class="fa fa-angle-right"></i></a></li>
              </c:when>
              <c:otherwise>
                <li class="page-item"><a class="page-link" href="<c:url value="?pageid=${pageid + 1}"/>" aria-label="Next"><i class="fa fa-angle-right"></i></a></li>
              </c:otherwise>
            </c:choose>
          </ul>
        </c:if>
      </div>
    </div>
  </div>
</c:when>
<c:otherwise>
    <div class="row">
      <div class="col-md-12 text-center">
        <div class="card border-0 bg-light" style="border-radius: 20px; padding: 60px;">
          <div class="card-body">
            <i class="far fa-newspaper" style="font-size: 4rem; color: #d1d5db; margin-bottom: 20px;"></i>
            <h2 style="color:#1a1f2e; font-weight: 700;">No News Found</h2>
            <p style="color:#6b7280;">Check back later for the latest updates.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:otherwise>
</c:choose>
<!-- Filtering Logic -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.news-search-box input');
    const searchBtn = document.querySelector('.news-search-btn');
    const cards = document.querySelectorAll('.col-lg-4, .col-md-6');

    function filterCards() {
        if(!searchInput) return;
        const query = searchInput.value.toLowerCase();
        
        cards.forEach(card => {
            if(!card.querySelector('.premium-news-card')) return;
            const title = card.querySelector('.news-title').textContent.toLowerCase();
            const excerpt = card.querySelector('.news-excerpt').textContent.toLowerCase();
            
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
