<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
@media (max-width: 768px) {
    .carousel-item img {
        min-height: 700px !important;
        object-fit: cover;
    }
    .carousel-item {
        min-height: 700px !important;
    }
}
.datepicker-dropdown.datepicker-orient-top{
    top:30% !important;
}
@media only screen and (max-width: 991px) {
 .datepicker-dropdown.datepicker-orient-top{
    top:70% !important;
}
}

/* Main Footer */
.footer-main { background: #111827 !important; color: #d1d5db; }
.footer-heading {
  color: #0d9997 !important;
  font-weight: 700;
  margin-bottom: 1.5rem;
  font-size: 1.1rem;
}
.footer-link {
  color: #d1d5db !important;
  text-decoration: none;
  transition: all 0.3s ease;
  display: block;
}
.footer-link:hover {
  color: #ffffff !important;
  transform: translateX(5px);
}
.social-icon-wrapper {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px; height: 40px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.05);
  transition: all 0.3s ease;
  border: 1px solid transparent;
}
.social-icon-wrapper:hover {
  border-color: #0d9997;
  box-shadow: 0 0 15px rgba(13, 153, 151, 0.3);
}

/* Bottom Disclaimer */
.footer-bottom { background: #020617 !important; color: #6b7280; font-size: 0.875rem; }
.footer-bottom-divider { border-top: 1px solid #333; width: 100%; margin-top: 1.5rem; padding-top: 1rem; }
.advisorkhoj-link { color: #0d9997; text-decoration: none; }
.advisorkhoj-link:hover { color: #0b8785; }
</style>

<footer>
    <div class="footer-main py-5">
        <div class="container">
            <div class="row justify-content-between sr-section no-reverse">
                <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0 sr-child">
                    <a href="/" class="mb-3 d-block">
                        <img src="/images/logo/footer_logo.png" style="width: 210px;" alt="Logo">
                    </a>
                    <div class="d-flex flex-column gap-3 mt-4 pe-lg-4">
                        <div class="d-flex align-items-start gap-2">
                            <i class="fas fa-map-marker-alt" style="color: #0d9997; margin-top: 4px;"></i>
                            <span>1/95, Post Office Road, Vettaikaraniruppu, Nagapattinam, Tamilnadu - 611112</span>
                        </div>
                        <div class="d-flex align-items-start gap-2">
                            <i class="fas fa-phone-alt" style="color: #0d9997; margin-top: 4px;"></i>
                            <div class="d-flex flex-column gap-1">
                                <a href="tel:+917402515544" class="text-decoration-none" style="color: #d1d5db;">+91-74025 15544 (India)</a> 
                                <a href="tel:+918667847016" class="text-decoration-none" style="color: #d1d5db;">+91-86678 47016 (India)</a>
                                <a href="tel:+966541180621" class="text-decoration-none" style="color: #d1d5db;">+966 541180621 (Saudi Arabia)</a>
                            </div>
                        </div>
                        <div class="d-flex align-items-start gap-2">
                            <i class="fas fa-envelope" style="color: #0d9997; margin-top: 4px;"></i>
                            <a href="mailto:connect@adcapitalinvestment.com" class="text-decoration-none" style="color: #d1d5db;">connect@adcapitalinvestment.com</a>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-2 mb-4 mb-lg-0 sr-child">
                    <h5 class="footer-heading">Quick Link</h5>
                    <div class="d-flex flex-column gap-2">
                        <a href="/aboutus" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>About us</a>
                        <a href="/contactus" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>Contact us</a>
                        <a href="/services/mutual-fund" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>Our Services</a>
                        <a href="/tools-and-calculators/become-a-crorepati" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>Calculators</a>
                        <a href="/mutual-funds-research/top-performing-mutual-funds" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>MF Research</a>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0 sr-child">
                    <h5 class="footer-heading">Help Link</h5>
                    <div class="d-flex flex-column gap-2">
                        <a href="/faq/mutual-funds" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>Mutual Fund FAQ's</a>
                        <a href="/faq/nri-corner" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>NRI Corner FAQ's</a>
                        <a href="/faq/financial-planning" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>Financial Planning FAQ's</a>
                        <a href="/privacy-policy" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>Privacy Policy</a>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-2 sr-child">
                    <h5 class="footer-heading">Articles</h5>
                    <div class="d-flex flex-column gap-2 mb-4">
                        <a href="/blog" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>Blog</a>
                        <a href="/news" class="footer-link"><i class="fas fa-chevron-right me-2" style="font-size: 10px; color: #0d9997;"></i>News</a>
                    </div>
                    <h5 class="footer-heading mb-3">Social Media</h5>
                    <div class="d-flex gap-2">
                        <a class="social-icon-wrapper" target="_blank" href="https://api.whatsapp.com/send?phone=8667847016"><img src="/images/logo/whatsappwhite.png" width="20px"></a>
                        <a class="social-icon-wrapper" target="_blank" href="https://youtube.com/shorts/rWfT_5NitG4?feature=shared"><img src="/images/logo/youtube-original.png" width="20px"></a>
                        <a class="social-icon-wrapper" target="_blank" href="https://www.instagram.com/aravind__elangovan?igsh=MWRqcTQxamFtYjg4eQ%3D%3D&utm_source=qr"><img src="/images/logo/instagram-original.png" width="20px"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-bottom py-4">
        <div class="container d-flex flex-column align-items-center text-center">
            <div class="d-flex align-items-center justify-content-center gap-3 mb-3">
                <img src="/images/amfi_footer.jpg" alt="AMFI Logo" style="width: 50px;" loading="lazy">
                <div class="text-start">
                    <span style="color: #9ca3af;">AMFI (Association of Mutual Funds in India) Certified Mutual Fund Distributor. ARN No. 314520.</span><br>
                    <span style="color: #9ca3af;">Initial Registration on - 25.Nov.2024 | Valid till - 24.Nov.2027</span>
                </div>
            </div>
            <p class="mb-2" style="color: #9ca3af;">Mutual Fund investments are subject to market risks, read all scheme related documents carefully before investing.</p>
            <div class="d-flex align-items-center justify-content-center gap-4 mt-3 mb-2">
                <img src="/images/yes.png" alt="YES Logo" style="height: 55px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));" loading="lazy">
                <img src="/images/rotary.png" alt="Rotary Logo" style="height: 55px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));" loading="lazy">
                <img src="/images/proud-bni.png" alt="BNI Logo" style="height: 55px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));" loading="lazy">
            </div>
            
            <div class="footer-bottom-divider">
                <div class="d-flex justify-content-between w-100 flex-column flex-md-row">
                    <span>&copy; 2024 A D Capital. All right reserved.</span>
                    <span>Designed & Developed By <a href="https://www.advisorkhoj.com/" class="advisorkhoj-link">Advisorkhoj.com</a></span>
                </div>
            </div>
        </div>
    </div>
</footer>