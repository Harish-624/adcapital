<!doctype html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
   <head>
        <!-- GTM moved to body end for performance -->
        <meta charset="utf-8">
        <link href="/images/fav.png" rel="icon">
        <%-- Canonical URL (production domain + current path, no query string) --%>
        <% String canonicalPath = (String) request.getAttribute("javax.servlet.forward.request_uri");
           if (canonicalPath == null || canonicalPath.isEmpty()) canonicalPath = request.getRequestURI();
           if (canonicalPath == null || canonicalPath.isEmpty()) canonicalPath = "/";
           String canonicalUrl = "https://www.adcapitalinvestment.com" + canonicalPath;
        %>
        <link rel="canonical" href="<%= canonicalUrl %>" />
        <title>A D Capital</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts — preconnect for faster DNS + non-blocking load -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="preconnect" href="https://cdnjs.cloudflare.com">
        <link rel="preconnect" href="https://cdn.jsdelivr.net">
        <link rel="preload" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap" rel="stylesheet"></noscript>

        <!-- Icon Font Stylesheets — non-blocking (still loads fully, just after first paint) -->
        <link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"></noscript>
        <link rel="preload" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"></noscript>
        
        <!-- Libraries Stylesheet -->
        <link href="/lib/animate/animate.min.css" rel="stylesheet">
        <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        
     
        <!-- Customized Bootstrap Stylesheet -->
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Vendor CSS — non-blocking (not needed for first paint) -->
        <link rel="preload" href="/vendors/rangeslider/css/ion.rangeSlider.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link rel="stylesheet" href="/vendors/rangeslider/css/ion.rangeSlider.css"/></noscript>
        <link rel="preload" href="/vendors/rangeslider/css/ion.rangeSlider.skinModern.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link rel="stylesheet" href="/vendors/rangeslider/css/ion.rangeSlider.skinModern.css"/></noscript>
        <link rel="preload" href="/vendors/sweetalert/sweetalert.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link rel="stylesheet" href="/vendors/sweetalert/sweetalert.css"></noscript>
        <link rel="preload" href="/vendors/datatables/jquery.dataTables.min.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link href="/vendors/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/></noscript>
        <link rel="preload" href="/vendors/bootstrap-slider/slider.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link rel="stylesheet" href="/vendors/bootstrap-slider/slider.css"></noscript>
        <link rel="preload" href="/css/bootstrap-datepicker.min.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link rel="stylesheet" href="/css/bootstrap-datepicker.min.css"></noscript>
        
        <!-- Template Stylesheet (v2.0 — cache busted) -->
        <link href="/css/style.css?v=2.0" rel="stylesheet">
        <link href="/css/custom.css?v=2.0" rel="stylesheet">
        <link href="/css/animations.css?v=2.0" rel="stylesheet">
        <script src="/js/jquery.min.js"></script>
        <script src="/vendors/moment/moment.min.js"></script>


	<!-- <script src="/resources/static/js/bootstrap-datepicker.js"/></script> -->
	
	

<!-- Font Awesome for icons -->

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

        <%-- WebSite Schema (JSON-LD) --%>
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

        <%-- Dynamic WebPage + BreadcrumbList Schema (JSON-LD) --%>
        <%
          String wpPath = (String) request.getAttribute("javax.servlet.forward.request_uri");
          if (wpPath == null || wpPath.isEmpty()) wpPath = request.getRequestURI();
          if (wpPath == null || wpPath.isEmpty()) wpPath = "/";
          String wpUrl = "https://www.adcapitalinvestment.com" + wpPath;

          // Build a human-readable page name from the URI path
          String wpName = "A D Capital Investment";
          if (!wpPath.equals("/")) {
            String slug = wpPath.startsWith("/") ? wpPath.substring(1) : wpPath;
            if (slug.endsWith("/")) slug = slug.substring(0, slug.length() - 1);
            // Take last segment for the page name
            String[] segments = slug.split("/");
            String lastSeg = segments[segments.length - 1];
            // Convert kebab-case to Title Case
            String[] words = lastSeg.split("-");
            StringBuilder sb = new StringBuilder();
            for (String w : words) {
              if (w.length() > 0) {
                sb.append(Character.toUpperCase(w.charAt(0)));
                if (w.length() > 1) sb.append(w.substring(1));
                sb.append(' ');
              }
            }
            wpName = sb.toString().trim() + " | A D Capital Investment";
          }

          // Build breadcrumb JSON items
          StringBuilder bcItems = new StringBuilder();
          bcItems.append("{\"@type\":\"ListItem\",\"position\":1,\"name\":\"Home\",\"item\":\"https://www.adcapitalinvestment.com/\"}");
          if (!wpPath.equals("/")) {
            String[] pathSegs = (wpPath.startsWith("/") ? wpPath.substring(1) : wpPath).split("/");
            StringBuilder cumPath = new StringBuilder();
            for (int i = 0; i < pathSegs.length; i++) {
              cumPath.append("/").append(pathSegs[i]);
              String[] segWords = pathSegs[i].split("-");
              StringBuilder segName = new StringBuilder();
              for (String w : segWords) {
                if (w.length() > 0) {
                  segName.append(Character.toUpperCase(w.charAt(0)));
                  if (w.length() > 1) segName.append(w.substring(1));
                  segName.append(' ');
                }
              }
              bcItems.append(",{\"@type\":\"ListItem\",\"position\":")
                     .append(i + 2)
                     .append(",\"name\":\"")
                     .append(segName.toString().trim())
                     .append("\",\"item\":\"https://www.adcapitalinvestment.com")
                     .append(cumPath.toString())
                     .append("\"}");
            }
          }
        %>
        <script type="application/ld+json">
        {
          "@context": "https://schema.org",
          "@type": "WebPage",
          "name": "<%= wpName %>",
          "url": "<%= wpUrl %>",
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
            "itemListElement": [<%= bcItems.toString() %>]
          }
        }
        </script>

    </head>
   <body>
     <!-- Scroll progress bar (2.5px teal line at top) -->
     <div id="scroll-progress"></div>
     <!-- Page-exit overlay -->
     <div id="page-transition-overlay"></div>
     <div class="wrapper">
	      <jsp:include page="header.jsp"></jsp:include>
	      <c:choose>
	         <c:when test="${not empty jsp}">
	            <jsp:include page="${jsp}"></jsp:include>
	         </c:when>
	         <c:otherwise>
	          <!--   <jsp:include page="error.jsp"></jsp:include>-->
	         </c:otherwise>
	      </c:choose>
	      <jsp:include page="footer.jsp"></jsp:include>
      </div>
	  
	  <a href="#" class="btn  btn-square rounded-circle back-to-top"><i class="fa fa-arrow-up text-white"></i></a>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
      <!-- sr-reveal.js replaced by CSS IntersectionObserver (animations.css) -->
      <script src="/lib/easing/easing.min.js"></script>
      <script src="/lib/waypoints/waypoints.min.js"></script>
      <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
      <script src="/vendors/rangeslider/js/ion.rangeSlider.min.js"/></script> 
	   <script src="/vendors/sweetalert/sweetalert.min.js"></script>
	   <script src="/vendors/bootstrap-slider/bootstrap-slider.min.js"></script>
	   <script src="/js/highstock.js"></script>
	  
		<script src="/js/bootstrap3-typeahead.min.js"></script>
	   	<script src="/js/highcharts.js"></script>
	   	<script src="/vendors/datatables/jquery.dataTables.min.js"></script>
		<!-- <script src="/js/bootstrap-datepicker.js"></script> -->
		
		<script src="/js/bootstrap-datepicker.js"></script>


      <!-- Template Javascript -->
      <script src="/js/main.js?v=2.0"></script>

      <!-- Sitewide Scroll Reveal (sr-section / sr-child system) -->
      <script src="/js/scroll-reveal.js?v=1.0"></script>

      <!-- v2: Scroll-reveal IntersectionObserver -->
      <script>
        (function() {
          var revealObserver = new IntersectionObserver(function(entries) {
            entries.forEach(function(entry) {
              if (entry.isIntersecting) {
                entry.target.classList.add('visible');
              }
            });
          }, { threshold: 0.12 });
          document.querySelectorAll('.reveal, .reveal-zoom').forEach(function(el) {
            revealObserver.observe(el);
          });
        })();

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

          // Step 1: Direct nav links (Home, About Us, Contacts, Links, …)
          document.querySelectorAll('.navbar .navbar-nav > .nav-link').forEach(function(link) {
            var href = link.getAttribute('href');
            if (href && (path === href || path.startsWith(href + '/') || path.startsWith(href + '?'))) {
              link.classList.add('active-page');
            }
          });

          // Step 2: Dropdown items — if a sub-page matches, highlight the parent toggle
          // e.g. visiting /services/mutual-fund highlights the “Services” dropdown toggle
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

        // Page-exit overlay: very subtle flash on navigation
        var overlay = document.getElementById('page-transition-overlay');
        if (overlay) {
          document.querySelectorAll('a[href]').forEach(function(link) {
            var href = link.getAttribute('href');
            // Only internal non-anchor, non-external, non-download links
            if (href && !href.startsWith('#') && !href.startsWith('http') &&
                !href.startsWith('mailto') && !href.startsWith('tel') &&
                !link.hasAttribute('download') && !link.hasAttribute('target')) {
              link.addEventListener('click', function(e) {
                overlay.classList.add('active');
                // Let browser navigate naturally after a tiny frame
                setTimeout(function() { overlay.classList.remove('active'); }, 300);
              });
            }
          });
        }
      </script>
      
      <!-- Google tag (gtag.js) — loaded at body end so it never blocks rendering -->
      <script async src="https://www.googletagmanager.com/gtag/js?id=G-C49Q8CY0KF"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-C49Q8CY0KF');
      </script>
   </body>
</html>