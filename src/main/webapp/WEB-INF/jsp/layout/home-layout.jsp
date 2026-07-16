<!doctype html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
   <head>
        <!-- Google tag (gtag.js) -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-C49Q8CY0KF"></script>
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
        
          gtag('config', 'G-C49Q8CY0KF');
        </script>
        <meta charset="utf-8">
        <title>A D Capital Investment</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link href="/images/fav.png" rel="icon">
        <%-- Canonical URL (production domain + current path, no query string) --%>
        <% String canonicalPath = (String) request.getAttribute("javax.servlet.forward.request_uri");
           if (canonicalPath == null || canonicalPath.isEmpty()) canonicalPath = request.getRequestURI();
           if (canonicalPath == null || canonicalPath.isEmpty()) canonicalPath = "/";
           String canonicalUrl = "https://www.adcapitalinvestment.com" + canonicalPath;
        %>
        <link rel="canonical" href="<%= canonicalUrl %>" />
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        
        <link rel="stylesheet" href="/vendors/rangeslider/css/ion.rangeSlider.css"/>
	  	<link rel="stylesheet" href="/vendors/rangeslider/css/ion.rangeSlider.skinModern.css"/> 
	  	<link rel="stylesheet" href="/vendors/sweetalert/sweetalert.css">

        <!-- Libraries Stylesheet -->
        <link href="/lib/animate/animate.min.css" rel="stylesheet">
        <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/css/style.css" rel="stylesheet">
        <link href="/css/custom.css" rel="stylesheet">
        <link href="/css/animations.css?v=2.0" rel="stylesheet">
        <link href="/css/home.css" rel="stylesheet">
        
        <script src="/js/jquery.min.js"></script>

        <%-- Organization Schema (JSON-LD) for SEO & LLM identity --%>
        <script type="application/ld+json">
        {
          "@context": "https://schema.org",
          "@type": "Organization",
          "name": "A D Capital Investment",
          "alternateName": "AD Capital",
          "url": "https://www.adcapitalinvestment.com",
          "logo": "https://www.adcapitalinvestment.com/images/logo/logo1.png",
          "image": "https://www.adcapitalinvestment.com/images/logo/logo1.png",
          "description": "A D Capital Investment is an AMFI-certified mutual fund distributor offering mutual fund investments, financial planning, insurance, wealth management, and NRI investment services across India and Saudi Arabia.",
          "foundingDate": "2024",
          "email": "connect@adcapitalinvestment.com",
          "telephone": ["+91-74025-15544", "+91-86678-47016", "+966-541180621"],
          "address": {
            "@type": "PostalAddress",
            "streetAddress": "1/95, Post Office Road, Vettaikaraniruppu",
            "addressLocality": "Nagapattinam",
            "addressRegion": "Tamil Nadu",
            "postalCode": "611112",
            "addressCountry": "IN"
          },
          "sameAs": [
            "https://www.instagram.com/aravind__elangovan",
            "https://youtube.com/shorts/rWfT_5NitG4?feature=shared"
          ],
          "contactPoint": [
            {
              "@type": "ContactPoint",
              "telephone": "+91-74025-15544",
              "contactType": "customer service",
              "areaServed": "IN",
              "availableLanguage": ["English", "Tamil"]
            },
            {
              "@type": "ContactPoint",
              "telephone": "+966-541180621",
              "contactType": "customer service",
              "areaServed": "SA",
              "availableLanguage": ["English"]
            }
          ],
          "hasCredential": {
            "@type": "EducationalOccupationalCredential",
            "credentialCategory": "AMFI Certification",
            "recognizedBy": {
              "@type": "Organization",
              "name": "Association of Mutual Funds in India (AMFI)"
            }
          },
          "knowsAbout": [
            "Mutual Funds",
            "Financial Planning",
            "Wealth Management",
            "Insurance",
            "NRI Investments",
            "SIP Calculator",
            "Goal Planning",
            "Retirement Planning"
          ]
        }
        </script>

        <%-- WebSite Schema (JSON-LD) — enables sitelinks search box in Google --%>
        <script type="application/ld+json">
        {
          "@context": "https://schema.org",
          "@type": "WebSite",
          "name": "A D Capital Investment",
          "url": "https://www.adcapitalinvestment.com",
          "publisher": {
            "@type": "Organization",
            "name": "A D Capital Investment",
            "logo": {
              "@type": "ImageObject",
              "url": "https://www.adcapitalinvestment.com/images/logo/logo1.png"
            }
          },
          "potentialAction": {
            "@type": "SearchAction",
            "target": "https://www.adcapitalinvestment.com/mutual-funds-research?q={search_term_string}",
            "query-input": "required name=search_term_string"
          }
        }
        </script>

        <%-- WebPage Schema (JSON-LD) for the Home Page --%>
        <script type="application/ld+json">
        {
          "@context": "https://schema.org",
          "@type": "WebPage",
          "name": "A D Capital Investment — Mutual Fund Distributor & Financial Planning",
          "description": "A D Capital Investment is an AMFI-certified mutual fund distributor offering mutual fund investments, financial planning, insurance, wealth management, and NRI investment services.",
          "url": "https://www.adcapitalinvestment.com/",
          "isPartOf": {
            "@type": "WebSite",
            "name": "A D Capital Investment",
            "url": "https://www.adcapitalinvestment.com"
          },
          "about": {
            "@type": "Organization",
            "name": "A D Capital Investment"
          },
          "breadcrumb": {
            "@type": "BreadcrumbList",
            "itemListElement": [
              {
                "@type": "ListItem",
                "position": 1,
                "name": "Home",
                "item": "https://www.adcapitalinvestment.com/"
              }
            ]
          }
        }
        </script>
        
    </head>
   <body>
     <div id="scroll-progress"></div>
     <div class="wrapper">
	      <jsp:include page="header.jsp"></jsp:include>
	      <c:choose>
	         <c:when test="${not empty jsp}">
	            <jsp:include page="${jsp}"></jsp:include>
	         </c:when>
	         <c:otherwise>
	           
	         </c:otherwise>
	      </c:choose>
	      <jsp:include page="footer.jsp"></jsp:include>
      </div>
	  
	  <!-- Back to Top Button -->
	  <a href="#" class="btn btn-square rounded-circle back-to-top" aria-label="Back to top">
        <i class="fa fa-arrow-up text-white"></i>
      </a>

	  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
      <script src="/lib/easing/easing.min.js"></script>
      <script src="/lib/waypoints/waypoints.min.js"></script>
      <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
      <script src="/vendors/rangeslider/js/ion.rangeSlider.min.js"></script>
	  <script src="/vendors/sweetalert/sweetalert.min.js"></script>
		<script>
$(function () {
    $('.slide_vertical').infiniteslide({
        direction: 'up',
        pauseonhover: false
    });
});
</script>
      <!-- Template Javascript -->
      <script src="/js/main.js"></script>
      <!-- Sitewide Scroll Reveal (sr-section / sr-child) — needed for footer animation -->
      <script src="/js/scroll-reveal.js?v=1.0"></script>
      
      <script>
        // Scroll progress bar
        var scrollProgress = document.getElementById('scroll-progress');

        // Optimized scroll listener (passive — no blocking)
        var navbar = document.querySelector('.navbar');
        var backToTop = document.querySelector('.back-to-top');
        var isScrolled = false;

        window.addEventListener('scroll', function() {
          // Progress bar
          if (scrollProgress) {
            var docEl = document.documentElement;
            var scrollTop = window.scrollY || docEl.scrollTop;
            var scrollHeight = docEl.scrollHeight - docEl.clientHeight;
            var pct = scrollHeight > 0 ? (scrollTop / scrollHeight) * 100 : 0;
            scrollProgress.style.width = pct + '%';
          }
          // Navbar shadow + back-to-top
          if (navbar) {
            if (window.scrollY > 30 && !isScrolled) {
              navbar.classList.add('scrolled');
              if (backToTop) backToTop.classList.add('show');
              isScrolled = true;
            } else if (window.scrollY <= 30 && isScrolled) {
              navbar.classList.remove('scrolled');
              if (backToTop) backToTop.classList.remove('show');
              isScrolled = false;
            }
          }
        }, { passive: true });
        
        // Mark active nav link with .active-page for CSS underline animation
        (function() {
          var path = window.location.pathname;

          // Step 1: Direct nav links
          document.querySelectorAll('.navbar .navbar-nav > .nav-link').forEach(function(link) {
            var href = link.getAttribute('href');
            if (href && (path === href || path.startsWith(href + '/') || path.startsWith(href + '?'))) {
              link.classList.add('active-page');
            }
          });

          // Step 2: Dropdown items — mark parent toggle active when sub-page matches
          document.querySelectorAll('.navbar .dropdown-item').forEach(function(item) {
            var href = item.getAttribute('href');
            if (!href) return;
            if (path === href || path.startsWith(href + '/') || path.startsWith(href + '?')) {
              var dropdown = item.closest('.nav-item.dropdown');
              if (dropdown) {
                var toggle = dropdown.querySelector('.nav-link.dropdown-toggle');
                if (toggle) toggle.classList.add('active-page');
              }
            }
          });
        })();
      </script>
   </body>
</html>