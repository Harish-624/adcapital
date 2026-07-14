<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  /* ── PAGE HERO (Removed inline styles, now using global .page-hero-curved) ── */

  /* ── Section & Ambient Background ─────────────────────────────── */
  .faq-section {
    position: relative;
    padding: 80px 0;
    background-color: #fafbfc;
    background-image: radial-gradient(#d1d5db 1px, transparent 1px);
    background-size: 24px 24px;
  }

  /* ── Content Cards ─────────────────────────────── */
  .mv-card {
    background: #fff;
    border-radius: 20px;
    border: 1px solid rgba(0, 152, 153, 0.1);
    box-shadow: 0 10px 30px rgba(0,0,0,0.04);
    padding: 40px;
  }

  /* ── Premium Accordion ─────────────────────────────── */
  .accordion-item {
    border: none;
    border-bottom: 1px solid #f0f0f0;
    margin-bottom: 10px;
    border-radius: 12px !important;
    overflow: hidden;
    box-shadow: 0 2px 15px rgba(0,0,0,0.02);
  }
  .accordion-button {
    background-color: #fff;
    color: #1a1f2e;
    font-weight: 600;
    font-size: 1.1rem;
    padding: 20px 24px;
    border-radius: 12px !important;
    box-shadow: none !important;
  }
  .accordion-button:not(.collapsed) {
    color: #009899;
    background-color: rgba(0, 152, 153, 0.05);
    box-shadow: none !important;
  }
  .accordion-button::after {
    filter: grayscale(100%);
    opacity: 0.5;
  }
  .accordion-button:not(.collapsed)::after {
    filter: invert(36%) sepia(87%) saturate(588%) hue-rotate(139deg) brightness(89%) contrast(101%);
    opacity: 1;
  }
  .accordion-body {
    padding: 0 24px 24px 24px;
    color: #4b5563;
    line-height: 1.8;
    background-color: rgba(0, 152, 153, 0.05);
  }

  /* ── Submit Form ─────────────────────────────── */
  .submit-card {
    background: linear-gradient(135deg, #1a1f2e 0%, #2a3143 100%);
    border-radius: 20px;
    padding: 50px;
    color: #fff;
    margin-top: 60px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.15);
  }
  .submit-card input, .submit-card textarea {
    background: rgba(255,255,255,0.1);
    border: 1px solid rgba(255,255,255,0.2);
    color: #fff;
    border-radius: 8px;
    padding: 15px 20px;
    margin-bottom: 20px;
  }
  .submit-card input::placeholder, .submit-card textarea::placeholder {
    color: rgba(255,255,255,0.6);
  }
  .submit-card input:focus, .submit-card textarea:focus {
    background: rgba(255,255,255,0.15);
    border-color: #009899;
    box-shadow: none;
    color: #fff;
  }
  .submit-btn {
    background: #009899;
    color: #fff;
    font-weight: 600;
    padding: 15px 30px;
    border-radius: 8px;
    border: none;
    transition: all 0.3s ease;
    width: 100%;
  }
  .submit-btn:hover {
    background: #0085A1;
    transform: translateY(-2px);
  }
</style>

<div class="page-hero-curved">
  <div class="container text-center position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Knowledge Centre</li>
      </ol>
    </nav>
    <div class="text-center">
      <span class="category-label">Resources</span>
      <h1 class="mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Knowledge Centre</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<section class="faq-section">
  <div class="container">
    <div class="text-center mb-5 sr-reveal">
      <h2 style="color: #1a1f2e; font-weight: 700; margin-bottom: 15px;">Frequently Asked Questions</h2>
      <p style="color: #4b5563; font-size: 16px; max-width: 600px; margin: 0 auto; margin-bottom: 30px;">Discover your answer from underneath or present your inquiry from the submit box.</p>
      
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="input-group shadow-sm" style="border-radius: 12px; overflow: hidden;">
            <input type="text" class="form-control border-0 p-3" placeholder="Search Your Answer" aria-label="Search" style="box-shadow: none;">
            <button class="btn btn-primary px-4" type="button" style="background: #009899; border: none;"><i class="lnr lnr-magnifier" style="color: #fff; font-size: 20px;"></i></button>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <!-- Left Column -->
      <div class="col-lg-6 mb-4 mb-lg-0 sr-child" data-sr-reveal-delay="0.1s">
        <div class="mv-card h-100">
          <div class="accordion" id="accordionExampleLeft">
            <c:forEach items="${list}" var="data" varStatus="status">
              <c:if test="${status.count % 2 != 0}">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="heading-${status.index}">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${status.index}" aria-expanded="false" aria-controls="collapse-${status.index}">
                      ${data.title}
                    </button>
                  </h2>
                  <div id="collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="heading-${status.index}" data-bs-parent="#accordionExampleLeft">
                    <div class="accordion-body mt-3">
                      <c:out value="${data.content}" escapeXml="false"></c:out>
                    </div>
                  </div>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </div>
      
      <!-- Right Column -->
      <div class="col-lg-6 sr-child" data-sr-reveal-delay="0.2s">
        <div class="mv-card h-100">
          <div class="accordion" id="accordionExampleRight">
            <c:forEach items="${list}" var="data" varStatus="status">
              <c:if test="${status.count % 2 == 0}">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="heading-${status.index}">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${status.index}" aria-expanded="false" aria-controls="collapse-${status.index}">
                      ${data.title}
                    </button>
                  </h2>
                  <div id="collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="heading-${status.index}" data-bs-parent="#accordionExampleRight">
                    <div class="accordion-body mt-3">
                      <c:out value="${data.content}" escapeXml="false"></c:out>
                    </div>
                  </div>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>

    <!-- Submit Question Area -->
    <div class="row justify-content-center sr-reveal" data-sr-reveal-delay="0.3s">
      <div class="col-lg-8">
        <div class="submit-card text-center">
          <h2 style="font-weight: 700; margin-bottom: 30px;">Didn’t find your answer? Submit your question</h2>
          <form action="#" method="post" id="contactForm" novalidate="novalidate">
            <div class="row">
              <div class="col-md-6">
                <input type="email" class="form-control" id="email" name="email" placeholder="Email Address*">
              </div>
              <div class="col-md-6">
                <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject*">
              </div>
              <div class="col-12">
                <textarea class="form-control" name="message" id="message" rows="4" placeholder="Your Question*"></textarea>
              </div>
              <div class="col-md-6 mx-auto">
                <button type="submit" class="submit-btn">Submit Now</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

  </div>
</section>
