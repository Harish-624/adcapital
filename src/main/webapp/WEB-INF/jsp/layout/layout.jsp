<!doctype html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
   <head>
        <meta charset="utf-8">
        <link href="/images/fav.png" rel="icon">
        <title>A D Capital</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        
        <!-- Libraries Stylesheet -->
        <link href="/lib/animate/animate.min.css" rel="stylesheet">
        <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        
     
        <!-- Customized Bootstrap Stylesheet -->
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        
        <link rel="stylesheet" href="/vendors/rangeslider/css/ion.rangeSlider.css"/>
	  	<link rel="stylesheet" href="/vendors/rangeslider/css/ion.rangeSlider.skinModern.css"/> 
	  	<link rel="stylesheet" href="/vendors/sweetalert/sweetalert.css">
	  	<link  href="/vendors/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
	  	<link rel="stylesheet" href="/vendors/bootstrap-slider/slider.css">
		<!-- <link rel="stylesheet" href="/css/bootstrap-datepicker.standalone.css"/> -->
		
		<link rel="stylesheet" href="/css/bootstrap-datepicker.min.css">
		
        <!-- Template Stylesheet (v2.0 — cache busted) -->
        <link href="/css/style.css?v=2.0" rel="stylesheet">
        <link href="/css/custom.css?v=2.0" rel="stylesheet">
        <link href="/css/animations.css?v=2.0" rel="stylesheet">
        <script src="/js/jquery.min.js"></script>
        <script src="/vendors/moment/moment.min.js"></script>


	<!-- <script src="/resources/static/js/bootstrap-datepicker.js"/></script> -->
	
	

<!-- Font Awesome for icons -->


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
      
      
      
   </body>
</html>