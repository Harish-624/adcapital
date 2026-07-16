<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


            <script>
                // Testimonial Hover/Click Handler
                $(document).ready(function () {
                    // Check if text is truncated to conditionally show "Hover to read more"
                    setTimeout(function() {
                        $('.testimonial-item .border-top p').each(function() {
                            if (this.scrollHeight > this.clientHeight) {
                                $(this).addClass('has-more-text');
                            }
                        });
                    }, 500);

                    // Make the entire card clickable
                    $('.testimonial-item').on('click', function () {
                        $(this).find('.border-top p').toggleClass('expanded');
                        // Tell owl carousel to recalculate its track height based on the new content size
                        $('.testimonial-carousel').trigger('refresh.owl.carousel');
                    });

                    // Trigger carousel height recalculation on hover
                    $('.testimonial-item').hover(
                        function () { $('.testimonial-carousel').trigger('refresh.owl.carousel'); },
                        function () { $('.testimonial-carousel').trigger('refresh.owl.carousel'); }
                    );
                });
            </script>


            <script src="/js/infiniteslidev2.js"></script>
            <script>
                $(document).ready(function () {
                    rangeSliderValue();

                    $('.testimonial-carousel').owlCarousel({
                        loop: true,
                        margin: 24,
                        nav: false,
                        autoplay: true,
                        autoplayTimeout: 4000,
                        autoplayHoverPause: true,
                        autoHeight: false,
                        responsive: {
                            0: { items: 1 },
                            768: { items: 2 },
                            1200: { items: 3 }
                        }
                    });

                    var PARTNER_OPTS = {
                        loop: true,
                        margin: 16,
                        nav: false,
                        autoplay: true,
                        autoplayTimeout: 3000,
                        autoplaySpeed: 600,
                        smartSpeed: 600,
                        autoplayHoverPause: false,
                        responsive: {
                            0: { items: 2 },
                            600: { items: 3 },
                            1000: { items: 5 }
                        }
                    };

                    function groupForMobile(selector) {
                        if ($(window).width() < 768) {
                            var items = $(selector).children('.item');
                            for (var i = 0; i < items.length; i += 2) {
                                items.slice(i, i + 2).wrapAll('<div class="item-group d-flex flex-column gap-3"></div>');
                            }
                        }
                    }

                    groupForMobile('.amc-carousel');
                    groupForMobile('.insurance-carousel');

                    $('.amc-carousel').owlCarousel(PARTNER_OPTS);
                    $('.insurance-carousel').owlCarousel(PARTNER_OPTS);

                    $("#txt_home_range_slider").ionRangeSlider(
                        {
                            min: 1000,
                            max: 100000,
                            from: 5000,
                            step: 1000,
                            grid: false,
                            hide_min_max: true,
                            hide_from_to: true,
                            skin: "round",
                            onChange: function (data) {
                                $("#sip_amount").html("");
                                $("#sip_amount").html(
                                    "&#x20B9; "
                                    + numbersWithComma(data.from) + "/-");
                                rangeSliderValue();
                            }
                        });
                });

                function rangeSliderValue() {
                    var slider_value = $("#txt_home_range_slider").val();
                    //alert("slider_value---------->"+slider_value);

                    var sipMonth = 300;
                    var sipAmount = parseInt(slider_value);

                    //Scheme Amount
                    var interestRate = 15;
                    var value1 = (interestRate / 100) / 12;
                    var value3 = 1 + value1;
                    var value4 = Math.pow((value3), (sipMonth + 1));
                    var amount1 = (value4 - 1);
                    var amount2 = amount1 / value1;
                    var scheme_amount = (sipAmount * amount2) - sipAmount;
                    if (scheme_amount > 10000000) {
                        var crores = (scheme_amount / 10000000);
                        $("#txt_home_slider_scheme").html(numbersWithComma(crores.toFixed(2)) + "Cr");
                    } else {
                        var lakhs = (scheme_amount / 100000);
                        $("#txt_home_slider_scheme").html(numbersWithComma(lakhs.toFixed(2)) + "L");
                    }

                    //Sensex Amount
                    var interestRate = 11;
                    var value1 = (interestRate / 100) / 12;
                    var value3 = 1 + value1;
                    var value4 = Math.pow((value3), (sipMonth + 1));
                    var amount1 = (value4 - 1);
                    var amount2 = amount1 / value1;
                    var sensex_amount = (sipAmount * amount2) - sipAmount;
                    if (sensex_amount > 10000000) {
                        var crores = (sensex_amount / 10000000);
                        $("#txt_home_slider_sensex").html(numbersWithComma(crores.toFixed(2)) + "Cr");
                    } else {
                        var lakhs = (sensex_amount / 100000);
                        $("#txt_home_slider_sensex").html(numbersWithComma(lakhs.toFixed(2)) + "L");
                    }

                    //Gold Amount   	
                    var interestRate = 9;
                    var value1 = (interestRate / 100) / 12;
                    var value3 = 1 + value1;
                    var value4 = Math.pow((value3), (sipMonth + 1));
                    var amount1 = (value4 - 1);
                    var amount2 = amount1 / value1;
                    var gold_amount = (sipAmount * amount2) - sipAmount;
                    if (gold_amount > 10000000) {
                        var crores = (gold_amount / 10000000);
                        $("#txt_home_slider_gold").html(numbersWithComma(crores.toFixed(2)) + "Cr");
                    } else {
                        var lakhs = (gold_amount / 100000);
                        $("#txt_home_slider_gold").html(numbersWithComma(lakhs.toFixed(2)) + "L");
                    }

                    //FD Amount   	   	
                    var interestRate = 6;
                    var value1 = (interestRate / 100) / 12;
                    var value3 = 1 + value1;
                    var value4 = Math.pow((value3), (sipMonth + 1));
                    var amount1 = (value4 - 1);
                    var amount2 = amount1 / value1;
                    var fd_amount = (sipAmount * amount2) - sipAmount;
                    if (fd_amount > 10000000) {
                        var crores = (fd_amount / 10000000);
                        $("#txt_home_slider_fd").html(numbersWithComma(crores.toFixed(2)) + "Cr");
                    } else {
                        var lakhs = (fd_amount / 100000);
                        $("#txt_home_slider_fd").html(numbersWithComma(lakhs.toFixed(2)) + "L");
                    }

                    //Savings Bank Amount      	
                    var interestRate = 3;
                    var value1 = (interestRate / 100) / 12;
                    var value3 = 1 + value1;
                    var value4 = Math.pow((value3), (sipMonth + 1));
                    var amount1 = (value4 - 1);
                    var amount2 = amount1 / value1;
                    var savings_bank_amount = (sipAmount * amount2) - sipAmount;
                    if (savings_bank_amount > 10000000) {
                        var crores = (savings_bank_amount / 10000000);
                        $("#txt_home_slider_bank").html(numbersWithComma(crores.toFixed(2)) + "Cr");
                    } else {
                        var lakhs = (savings_bank_amount / 100000);
                        $("#txt_home_slider_bank").html(numbersWithComma(lakhs.toFixed(2)) + "L");
                    }
                }

                function numbersWithComma(x) {
                    x = x.toString();
                    var afterPoint = '';
                    if (x.indexOf('.') > 0)
                        afterPoint = x.substring(x.indexOf('.'), x.length);
                    x = Math.floor(x);
                    x = x.toString();
                    var lastThree = x.substring(x.length - 3);
                    var otherNumbers = x.substring(0, x.length - 3);
                    if (otherNumbers != '')
                        lastThree = ',' + lastThree;
                    var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
                    return res;
                }
            </script>
            <script>
                function contactUs() {
                    var name = $("#name").val();
                    var email = $("#email").val();
                    var mobile = $("#mobile").val();
                    var message = $("#message").val();
                    var subject = $("#subject").val();
                    var country = $("#country").val();

                    if (name == "") {
                        swal({ title: "", text: "Please enter your name" });
                        return false;
                    }
                    if (email == "") {
                        swal({ title: "", text: "Please enter your email" });
                        return false;
                    }
                    if (!validateEmail(email)) {
                        swal({ title: "", text: "Please enter valid email" });
                        return false;
                    }
                    if (mobile == "") {
                        swal({ title: "", text: "Please enter phone number" });
                        return false;
                    }
                    if (message == "") {
                        swal({ title: "", text: "Please enter your message" });
                        return false;
                    }
                    if (subject == "") {
                        swal({ title: "", text: "Please enter your subject" });
                        return false;
                    }

                    if (country == "") {
                        swal({ title: "", text: "Please enter your country" });
                        return false;
                    }

                    //$.LoadingOverlay("show");

                    $.ajaxSetup({ async: true });
                    $.post("/saveContactUs", { name: "" + name + "", email: "" + email + "", mobile: "" + mobile + "", subject: "" + subject + "", message: "" + message + "", country: "" + country + "" }, function (data) {
                        //$.LoadingOverlay("hide");

                        var result = $.trim(data);
                        var obj = jQuery.parseJSON(result);
                        if (obj.status == "200") {
                            $("#name").val();
                            $("#email").val();
                            $("#mobile").val();
                            $("#message").val();
                            $("#subject").val();
                            $("#country").val();

                            swal({ title: "", text: "Thanks for contacting us. Soon we will get in touch with you!" });

                        }
                        else {
                            swal({ title: "", text: obj.msg });
                        }

                    }, 'text');
                }
                function validateEmail(email) {
                    var re = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    if (re.test(email)) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }

            </script>

            <!-- ══════ HERO — Premium Cinematic Carousel ══════ -->
            <section class="premium-hero" id="premiumHero">

                <!-- ── SLIDE 1: Mutual Fund ── -->
                <div class="hero-slide" id="hSlide0">
                    <img src="/images/home/banner/wealth-management.jpg" alt="Mutual Fund Solutions">
                    <div class="hero-veil"></div>
                    <div class="hero-content">
                        <div class="container">
                            <div class="hero-text">
                                <div class="hero-eyebrow">
                                    <span class="hero-eyebrow-line"></span>
                                    <span>Wealth Management</span>
                                </div>
                                <h1 class="hero-headline">We help you to select the Best Mutual Fund Schemes.</h1>
                                <p class="hero-sub">We proudly serve a strong and growing client base of over 400+
                                    individuals across India and worldwide.</p>
                                <p class="hero-desc">"Mutual funds offer investment solution for both short term and
                                    long-term goals. We recommend schemes on your specific investment needs and
                                    objectives"</p>
                                <div class="hero-actions">
                                    <a href="/services/mutual-fund" class="hero-btn-primary">Read More <i
                                            class="fa fa-arrow-right"></i></a>
                                    <a href="/contactus" class="hero-btn-ghost">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ── SLIDE 2: GIFT City ── -->
                <div class="hero-slide" id="hSlide1">
                    <img src="/images/home/banner/gift-city-hero.jpg" alt="GIFT City Investments">
                    <div class="hero-veil"></div>
                    <div class="hero-content">
                        <div class="container">
                            <div class="hero-text">
                                <div class="hero-eyebrow">
                                    <span class="hero-eyebrow-line"></span>
                                    <span>GIFT City</span>
                                </div>
                                <h2 class="hero-headline">Global Investment<br><span style="color: #0d9997;">Opportunities</span></h2>
                                <p class="hero-sub">Through India's GIFT City</p>
                                <p class="hero-desc">Access world-class financial products with tax-efficient solutions, global diversification, and seamless investment opportunities.</p>
                                <div class="hero-actions">
                                    <a href="/services/gift-city" class="hero-btn-primary">Read More <i class="fa fa-arrow-right"></i></a>
                                    <a href="/contactus" class="hero-btn-ghost">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ── SLIDE 3: Health Insurance ── -->
                <div class="hero-slide" id="hSlide2">
                    <img src="/images/home/banner/health-protection.jpg" alt="Health Insurance">
                    <div class="hero-veil"></div>
                    <div class="hero-content">
                        <div class="container">
                            <div class="hero-text">
                                <div class="hero-eyebrow">
                                    <span class="hero-eyebrow-line"></span>
                                    <span>Health Protection</span>
                                </div>
                                <h2 class="hero-headline">Protect Your Wellness,<br><span style="color: #0d9997;">Secure
                                        Your Future.</span></h2>
                                <p class="hero-sub">We have secured health insurance coverage worth over <span
                                        style="color: #0d9997; font-weight: 700;">&nbsp;&#8377;100+ crores&nbsp;</span>
                                    for clients across India and globally.</p>
                                <p class="hero-desc">Secure your family's future with comprehensive health insurance
                                    coverage. Protect what matters most.</p>
                                <div class="hero-actions">
                                    <a href="/services/health-insurance" class="hero-btn-primary">Read More <i
                                            class="fa fa-arrow-right"></i></a>
                                    <a href="/contactus" class="hero-btn-ghost">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ── SLIDE 4: Life Insurance ── -->
                <div class="hero-slide" id="hSlide3">
                    <img src="/images/home/banner/life-security.jpg" alt="Life Insurance">
                    <div class="hero-veil"></div>
                    <div class="hero-content">
                        <div class="container">
                            <div class="hero-text">
                                <div class="hero-eyebrow">
                                    <span class="hero-eyebrow-line"></span>
                                    <span>Life Security</span>
                                </div>
                                <h2 class="hero-headline">Do you have enough Life Insurance Cover?</h2>
                                <p class="hero-sub">
                                    We have secured Life insurance coverage worth over
                                    <span style="color:#0d9997;font-weight:700;">&#8377;100+ crores</span>
                                    for clients across India and globally.
                                </p>
                                <p class="hero-desc">You should have Life Cover of around 20 times of your Annual Income
                                    so that your Family is Totally Protected in your absence.</p>
                                <div class="hero-actions">
                                    <a href="/services/life-insurance" class="hero-btn-primary">Read More <i
                                            class="fa fa-arrow-right"></i></a>
                                    <a href="/contactus" class="hero-btn-ghost">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ── Floating arrow controls ── -->
                <button class="hero-arrow hero-arrow-prev" id="heroPrev" aria-label="Previous slide">
                    <i class="fa fa-chevron-left"></i>
                </button>
                <button class="hero-arrow hero-arrow-next" id="heroNext" aria-label="Next slide">
                    <i class="fa fa-chevron-right"></i>
                </button>

                <!-- ── Progress pill indicators ── -->
                <div class="hero-indicators">
                    <div class="hero-pip" data-slide="0"></div>
                    <div class="hero-pip" data-slide="1"></div>
                    <div class="hero-pip" data-slide="2"></div>
                    <div class="hero-pip" data-slide="3"></div>
                </div>

            </section>
            <!-- ══════ HERO END ══════ -->

            <script>
                (function () {
                    var slides = document.querySelectorAll('.hero-slide');
                    var pips = document.querySelectorAll('.hero-pip');
                    var prevBtn = document.getElementById('heroPrev');
                    var nextBtn = document.getElementById('heroNext');
                    var current = 0;
                    var total = slides.length;
                    var autoTimer = null;
                    var AUTO_MS = 5500;
                    var isAnimating = false;

                    function goTo(idx) {
                        if (isAnimating) return;
                        if (idx === current) return;
                        isAnimating = true;

                        var outgoing = slides[current];
                        pips[current].classList.remove('active');
                        current = (idx + total) % total;

                        // Step 1: mark outgoing as leaving (fades out, stays on top)
                        outgoing.classList.remove('active');
                        outgoing.classList.add('leaving');

                        // Step 2: immediately make incoming active (fades in underneath)
                        slides[current].classList.add('active');
                        pips[current].classList.add('active');

                        // Step 3: once the outgoing fade-out transition ends, clean up
                        function onTransitionEnd(e) {
                            if (e.propertyName !== 'opacity') return;
                            outgoing.classList.remove('leaving');
                            outgoing.removeEventListener('transitionend', onTransitionEnd);
                            isAnimating = false;
                        }
                        outgoing.addEventListener('transitionend', onTransitionEnd);

                        // Safety fallback in case transitionend doesn't fire
                        setTimeout(function () {
                            outgoing.classList.remove('leaving');
                            isAnimating = false;
                        }, 1600);
                    }

                    function startAuto() {
                        clearInterval(autoTimer);
                        autoTimer = setInterval(function () { goTo(current + 1); }, AUTO_MS);
                    }

                    // ── Page-load entrance: let the browser paint one frame with
                    //    the slide hidden (opacity:0, translateY), THEN add .active
                    //    so the CSS transitions fire and text slides in smoothly.
                    requestAnimationFrame(function () {
                        requestAnimationFrame(function () {
                            slides[0].classList.add('active');
                            pips[0].classList.add('active');
                        });
                    });

                    prevBtn.addEventListener('click', function () { goTo(current - 1); startAuto(); });
                    nextBtn.addEventListener('click', function () { goTo(current + 1); startAuto(); });
                    pips.forEach(function (pip) {
                        pip.addEventListener('click', function () {
                            goTo(parseInt(pip.dataset.slide));
                            startAuto();
                        });
                    });

                    startAuto();
                })();
            </script>


            <!-- Fact Start -->
            <section>
                <div class="container-fluid services-bg pt-2 pb-2 position-relative">
                    <div class="services-bg-dots"></div>
                    <div class="container py-0 py-lg-1 position-relative z-index-1">
                        <!-- <div class="row justify-content-center">
	            <div class="col-lg-4 sr-reveal fadeIn" data-sr-reveal-delay=".1s" >
	                <div class="d-flex counter">
	                    <h2 class="me-3 text-theme-light counter-value">4000 </h2>
	                    <h5 class="text-dark mt-1"> + Success in getting happy customer</h5>
	                </div>
	            </div>
	            <div class="col-lg-4 sr-reveal fadeIn" data-sr-reveal-delay=".3s">
	                <div class="d-flex counter">
	                    <h2 class="me-4 text-theme-light counter-value">750 </h2>
	                    <h5 class="text-dark mt-1"> + Family investers</h5>
	                </div>
	            </div>
	            <div class="col-lg-4 sr-reveal fadeIn" data-sr-reveal-delay=".5s">
	                <div class="d-flex counter">
	                    <h2 class="me-4 text-theme-light counter-value">15</h2>
	                    <h5 class="text-dark mt-1">Years of Experience</h5>
	                </div>
	            </div>
	            <div class="col-lg-3 sr-reveal fadeIn" data-sr-reveal-delay=".7s">
	                <div class="d-flex counter">
	                    <h2 class="me-3 text-theme-light counter-value">5</h2>
	                    <h5 class="text-white mt-1">Stars reviews given by satisfied clients</h5>
	                </div>
	            </div>
	        </div> -->
                        <div class="row mb-4 sr-section">
                            <div class="col-md-12 text-center sr-child">
                                <span class="home-label mb-3" style="margin: 0 auto;">WHAT WE DO</span>
                                <h2 class="mb-4 font-weight-bold" style="color: #0a1f44; font-size: 46px;">Our <span
                                        style="color: #009899;">Premium</span> Services</h2>
                                <div class="d-flex justify-content-center align-items-center mb-4">
                                    <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                    <div
                                        style="width: 4px; height: 4px; border-radius: 50%; background: #009899; margin: 0 8px;">
                                    </div>
                                    <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                </div>
                                <p class="mx-auto mb-3"
                                    style="max-width: 600px; font-size: 16px; line-height: 1.6; color: #6c757d;">Smart
                                    solutions designed to help you grow, protect, and secure your wealth with
                                    confidence.</p>
                            </div>
                        </div>
                        <div class="row justify-content-center sr-section">
                            <div class="col-md-4 mb-4 sr-child">
                                <a href="/services/mutual-fund">
                                    <div class="card service-card border-0 text-center">
                                        <div class="card-body px-4 py-4">
                                            <div class="icon-glow-wrapper">
                                                <div class="icon-glow"></div>
                                                <img src="/images/home/mutual-fund-3d.png" width="155px"
                                                    class="floating-icon">
                                            </div>
                                            <h5 class="mb-3">Mutual Fund <br>Advisory</h5>
                                            <p class="mb-1 text-dark">Mutual funds are investment vehicles that pool money... <span style="color: #009899; font-weight: 500;">Read more</span></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4 mb-4 sr-child">
                                <a href="/services/goal-planning">
                                    <div class="card service-card border-0 text-center">
                                        <div class="card-body px-4 py-4">
                                            <div class="icon-glow-wrapper">
                                                <div class="icon-glow"></div>
                                                <img src="/images/home/Goal_Planning_3d.png" width="155px"
                                                    class="floating-icon">
                                            </div>
                                            <h5 class="mb-3">Goal-Oriented <br>Financial Planning</h5>
                                            <p class="mb-1 text-dark">Have you ever wondered where you want to be in five years?... <span style="color: #009899; font-weight: 500;">Read more</span></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4 mb-4 sr-child">
                                <a href="/services/retirement-planning">
                                    <div class="card service-card border-0 text-center">
                                        <div class="card-body px-4 py-4">
                                            <div class="icon-glow-wrapper">
                                                <div class="icon-glow"></div>
                                                <img src="/images/home/retirement-3d.png" width="155px"
                                                    class="floating-icon">
                                            </div>
                                            <h5 class="mb-3">Retirement Planning for a <br>Secured Future</h5>
                                            <p class="mb-1 text-dark">The plan and action of accumulating a specific amount of money... <span style="color: #009899; font-weight: 500;">Read more</span></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4 mb-4 sr-child">
                                <a href="/services/health-insurance">
                                    <div class="card service-card border-0 text-center">
                                        <div class="card-body px-4 py-4">
                                            <div class="icon-glow-wrapper">
                                                <div class="icon-glow"></div>
                                                <img src="/images/home/health-3d.png" width="155px"
                                                    class="floating-icon">
                                            </div>
                                            <h5 class="mb-3">Life Insurance and Health Insurance</h5>
                                            <p class="mb-1 text-dark">Tailor made insurance selection on need and want basis... <span style="color: #009899; font-weight: 500;">Read more</span></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- Gift City -->
                            <div class="col-md-4 mb-4 sr-child">
                                <a href="/services/gift-city">
                                    <div class="card service-card border-0 text-center">
                                        <div class="card-body px-4 py-4">
                                            <div class="icon-glow-wrapper">
                                                <div class="icon-glow"></div>
                                                <img src="/images/home/gift-city-3d.png" width="155px"
                                                    class="floating-icon">
                                            </div>
                                            <h5 class="mb-3">Gift City</h5>
                                            <p class="mb-1 text-dark">Explore global financial investment opportunities through GIFT City... <span style="color: #009899; font-weight: 500;">Read more</span></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Fact End -->



            <section class="pb-5 pt-0 pt-lg-5 mt-lg-5">
                <div class="container py-0 py-lg-3">
                    <div class="row align-items-center sr-section no-reverse gx-5">
                        
                        <!-- Mobile-only label (displays before image) -->
                        <div class="col-12 d-md-none text-center mb-3 order-1">
                            <span class="home-label sr-child">WHO WE ARE</span>
                        </div>

                        <div class="col-md-6 order-2 d-flex align-items-center justify-content-center mb-4 mb-md-0">
                            <div class="home-about-image-wrapper sr-child">
                                <div class="home-about-image-backing-teal"></div>
                                <div class="home-about-image-backing"></div>
                                <img src="/images/home/home-about-new.png" alt="About A D Capital Investment">
                            </div>
                        </div>
                        <div class="col-md-6 order-3">
                            <!-- Desktop-only label (displays before heading in the right column) -->
                            <span class="home-label sr-child d-none d-md-inline-block mb-2">WHO WE ARE</span>
                            <h2 class="mb-4 sr-child">Empowering your <span style="color: #009899;">investments</span> with expert guidance.</h2>
                            <div class="d-flex justify-content-start align-items-center mb-4 sr-child">
                                <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                <div style="width: 4px; height: 4px; border-radius: 50%; background: #009899; margin: 0 8px;"></div>
                                <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                            </div>
                            <p class="text-muted fs-5 mb-5 lh-base sr-child">Welcome to A D Capital Investment, where your financial growth
                                is our
                                priority. With over a decade of experience in the financial sector, we specialize in
                                providing expertly managed mutual fund solutions tailored to meet the unique needs of
                                individuals, businesses, and Non-Resident Indian (NRI) / Overseas Citizen of India (OCI)
                                clients.</p>
                            <a href="/aboutus"
                                class="btn btn-theme-light rounded-pill px-4 py-2 text-white sr-child">Know
                                More</a>
                        </div>
                    </div>
                </div>
            </section>


            <!-- SIP Comparison Section -->
            <section class="py-5 sip-calc-bg mt-lg-5"
                style="background-image:url('/images/home/home-slider.png'); background-size: cover; background-position: center;">
                <div class="container py-4 sr-section">

                    <!-- Section Header -->
                    <div class="text-center mb-4 sr-child">
                        <p class="sip-section-label mb-2" style="font-weight: 700; color: #ffffff !important; letter-spacing: 1px;">PERFORMANCE COMPARISON</p>
                        <h2 class="text-white fw-bold" style="font-size:clamp(1.4rem,3vw,2rem); letter-spacing:-0.5px;">
                            How <span style="color:var(--brand-primary,#0E9A9A);">A D Capital</span> Works In Your Best
                            Interest
                        </h2>
                    </div>

                    <!-- Slider Control -->
                    <div class="col-md-8 mx-auto mb-5 sr-child">
                        <div class="sip-slider-pill">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-white" style="font-size:13px; font-weight:500; opacity:0.8;">Monthly
                                    Investment</span>
                                <span class="sip-amount-badge" id="sip_amount">&#8377; 5000 /-</span>
                            </div>
                            <input id="txt_home_range_slider" type="text" value="5000" min="1000" max="100000"
                                step="1000" onchange="rangeSliderValue()">
                            <div class="d-flex justify-content-between mt-2"
                                style="font-size:11px; color:rgba(255,255,255,0.35); font-weight:500;">
                                <span>&#8377;1,000</span>
                                <span>&#8377;1,00,000</span>
                            </div>
                        </div>
                        <div class="d-flex align-items-center gap-2 gap-md-3 mt-4 mb-2">
                            <div style="flex:1; height:1px; background:rgba(255,255,255,0.25);"></div>
                            <span
                                style="font-size:13px; font-weight:800; letter-spacing:1px; text-transform:uppercase; color:#ffffff; white-space:nowrap; text-shadow: 0 1px 4px rgba(0,0,0,0.5);">After
                                25 Years, Accumulated To</span>
                            <div style="flex:1; height:1px; background:rgba(255,255,255,0.25);"></div>
                        </div>
                    </div>

                    <!-- Comparison Cards -->
                    <div class="row justify-content-center g-3 pb-4">
                        <div class="col-6 col-md sr-child">
                            <div class="invest-card text-center h-100">
                                <p class="card-label">Savings Account</p>
                                <div class="card-amount">&#8377;<span id="txt_home_slider_bank">22.36L</span></div>
                                <span class="card-return-badge">@3% Return</span>
                            </div>
                        </div>
                        <div class="col-6 col-md sr-child">
                            <div class="invest-card text-center h-100">
                                <p class="card-label">Fixed Deposit</p>
                                <div class="card-amount">&#8377;<span id="txt_home_slider_fd">22.36L</span></div>
                                <span class="card-return-badge">@6% Return</span>
                            </div>
                        </div>
                        <div class="col-6 col-md sr-child">
                            <div class="invest-card text-center h-100">
                                <p class="card-label">Gold</p>
                                <div class="card-amount">&#8377;<span id="txt_home_slider_gold">22.36L</span></div>
                                <span class="card-return-badge">@9% Return</span>
                            </div>
                        </div>
                        <div class="col-6 col-md sr-child">
                            <div class="invest-card text-center h-100">
                                <p class="card-label">Sensex</p>
                                <div class="card-amount">&#8377;<span id="txt_home_slider_sensex">22.36L</span></div>
                                <span class="card-return-badge">@11% Return</span>
                            </div>
                        </div>
                        <div class="col-12 col-md sr-child">
                            <div class="invest-card mf-star text-center h-100" style="padding-top:28px;">
                                <p class="card-label">Mutual Fund</p>
                                <div class="card-amount">&#8377;<span id="txt_home_slider_scheme">22.36L</span></div>
                                <span class="card-return-badge">@15% Return</span>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <!-- SIP Comparison Section End -->



            <section class="pt-5 pb-0 app-bg position-relative">
                <div class="container py-4">
                    <div class="row align-items-center g-5">

                        <div class="col-lg-6 text-center position-relative order-2 order-lg-1">
                            <div class="pm-scene">

                                <!-- ══ Premium Background Stage ══════════════════════════════ -->
                                <div class="pm-radial-glow"></div>

                                <div class="pm-ext-card card-goal">
                                    <div class="pm-ext-card-icon">
                                        <svg width="38" height="38" viewBox="0 0 40 40">
                                            <circle cx="20" cy="20" r="16" fill="none" stroke="#e0f2f1"
                                                stroke-width="6" />
                                            <circle cx="20" cy="20" r="16" fill="none" stroke="#009899" stroke-width="6"
                                                stroke-dasharray="68 100" stroke-linecap="round"
                                                transform="rotate(-90 20 20)" />
                                            <circle cx="20" cy="20" r="4" fill="#1a1b26" />
                                        </svg>
                                    </div>
                                    <div class="pm-ext-card-text">
                                        <h6>Child Education Plan</h6>
                                        <p>68% on track</p>
                                    </div>
                                </div>

                                <div class="pm-ext-card card-gain">
                                    <div class="pm-ext-card-icon" style="background:#f0fdfc; border-radius:8px;">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#009899"
                                            stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline>
                                            <polyline points="17 6 23 6 23 12"></polyline>
                                        </svg>
                                    </div>
                                    <div class="pm-ext-card-text">
                                        <h6>Mutual Fund Returns</h6>
                                        <p>@15% Return</p><span class="sub">Expected</span>
                                    </div>
                                </div>

                                <!-- Hitboxes for reliable hover detection -->
                                <div class="pm-hitbox pm-hitbox-back"></div>
                                <div class="pm-hitbox pm-hitbox-front"></div>

                                <div class="pm-device pm-phone-back">
                                    <div class="pm-btn-power"></div>
                                    <div class="pm-btn-vol-up"></div>
                                    <div class="pm-btn-vol-down"></div>
                                    <div class="pm-notch">
                                        <div class="pm-lens"></div>
                                    </div>

                                    <div class="pm-screen">
                                        <div class="pm-glare"></div>

                                        <div class="ui-dash"
                                            style="background: linear-gradient(180deg, #f0fdfc 0%, #ffffff 100%); padding-top: 45px;">
                                            <div class="ui-header-text"
                                                style="text-align: center; margin-bottom: 25px;">
                                                <h4 style="justify-content: center; font-size: 18px;">Wealth Calculators
                                                </h4>
                                                <p style="font-size: 10px;">Plan your financial future</p>
                                            </div>

                                            <div class="ui-chart" style="margin-bottom: 5px;">
                                                <svg width="100%" height="100%" viewBox="0 0 200 60"
                                                    preserveAspectRatio="none">
                                                    <path
                                                        d="M0,60 L0,50 C40,40 60,30 100,25 C140,20 160,10 200,5 L200,60 Z"
                                                        fill="rgba(0,152,153,0.15)" />
                                                    <path d="M0,50 C40,40 60,30 100,25 C140,20 160,10 200,5" fill="none"
                                                        stroke="#009899" stroke-width="2.5" />
                                                </svg>
                                            </div>

                                            <div class="ui-card"
                                                style="background: #009899; color: white; border: none; margin-top: 15px;">
                                                <div class="ui-card-icon"
                                                    style="background: rgba(255,255,255,0.2); color: white;">
                                                    <i class="fas fa-bullseye"></i>
                                                </div>
                                                <div class="ui-card-text">
                                                    <h6 style="color: white;">Become a Crorepati</h6>
                                                    <p style="color: #e0f2f1;">Goal Planning Tool</p>
                                                </div>
                                                <i class="fas fa-arrow-right"
                                                    style="margin-left: auto; color: white; font-size: 10px;"></i>
                                            </div>

                                            <div class="ui-list-item">
                                                <div class="ui-list-left">
                                                    <div class="ui-list-icon"
                                                        style="background:#e0f2f1; color: #009899;"><i
                                                            class="fas fa-graduation-cap"></i></div>
                                                    <div class="ui-list-text">
                                                        <h6>Education Planner</h6>
                                                        <p>Child Future Planning</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ui-list-item">
                                                <div class="ui-list-left">
                                                    <div class="ui-list-icon"
                                                        style="background:#e0f2f1; color: #009899;"><i
                                                            class="fas fa-chart-line"></i></div>
                                                    <div class="ui-list-text">
                                                        <h6>Target Amount SIP</h6>
                                                        <p>Systematic Investment</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ui-list-item">
                                                <div class="ui-list-left">
                                                    <div class="ui-list-icon"
                                                        style="background:#e0f2f1; color: #009899;"><i
                                                            class="fas fa-umbrella"></i></div>
                                                    <div class="ui-list-text">
                                                        <h6>Human Life Value</h6>
                                                        <p>Insurance Calculator</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="pm-device pm-phone-front">
                                    <div class="pm-btn-power"></div>
                                    <div class="pm-btn-vol-up"></div>
                                    <div class="pm-btn-vol-down"></div>
                                    <div class="pm-notch">
                                        <div class="pm-lens"></div>
                                    </div>

                                    <div class="pm-screen">
                                        <div class="pm-glare"></div>

                                        <div class="ui-dash">

                                            <div class="ui-header">
                                                <div class="ui-header-text">
                                                    <p>Welcome,</p>
                                                    <h4>Investor <i class="fas fa-check-circle"
                                                            style="font-size:11px; margin-left:4px; color: #009899;"></i>
                                                    </h4>
                                                </div>
                                                <div class="ui-avatar">
                                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                                                        <path
                                                            d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
                                                    </svg>
                                                </div>
                                            </div>

                                            <div class="ui-portfolio">
                                                <p>Total Portfolio Value</p>
                                                <h2>&#8377;22,36,000</h2>
                                                <div class="ui-badges">
                                                    <span class="ui-badge-green">▲ 15.0% YTD</span>
                                                    <span class="ui-text-green">Mutual Fund Growth</span>
                                                </div>
                                            </div>

                                            <div class="ui-chart">
                                                <svg width="100%" height="100%" viewBox="0 0 200 60"
                                                    preserveAspectRatio="none">
                                                    <path
                                                        d="M0,60 L0,30 C40,40 60,10 100,25 C140,40 160,5 200,10 L200,60 Z"
                                                        fill="rgba(0,152,153,0.15)" />
                                                    <path d="M0,30 C40,40 60,10 100,25 C140,40 160,5 200,10" fill="none"
                                                        stroke="#009899" stroke-width="2" />
                                                </svg>
                                            </div>

                                            <div class="ui-stats">
                                                <div class="ui-stat">
                                                    <h5 class="ui-text-green">+15.0%</h5>
                                                    <p>Fund Return</p>
                                                </div>
                                                <div class="ui-stat">
                                                    <h5>&#8377;15,000</h5>
                                                    <p>Monthly SIP</p>
                                                </div>
                                                <div class="ui-stat">
                                                    <h5>12</h5>
                                                    <p>Active Funds</p>
                                                </div>
                                            </div>

                                            <div class="ui-section-title">Quick Services</div>
                                            <div class="ui-list-item">
                                                <div class="ui-list-left">
                                                    <div class="ui-list-icon" style="background:#009899;"><i
                                                            class="fas fa-chart-pie"></i></div>
                                                    <div class="ui-list-text">
                                                        <h6>Mutual Funds</h6>
                                                        <p>Portfolio Management</p>
                                                    </div>
                                                </div>
                                                <div class="ui-list-right">
                                                    <i class="fas fa-chevron-right text-muted"
                                                        style="font-size:10px;"></i>
                                                </div>
                                            </div>
                                            <div class="ui-list-item">
                                                <div class="ui-list-left">
                                                    <div class="ui-list-icon" style="background:#2a2a35;"><i
                                                            class="fas fa-heartbeat"></i></div>
                                                    <div class="ui-list-text">
                                                        <h6>Life Insurance</h6>
                                                        <p>Secure Your Future</p>
                                                    </div>
                                                </div>
                                                <div class="ui-list-right">
                                                    <i class="fas fa-chevron-right text-muted"
                                                        style="font-size:10px;"></i>
                                                </div>
                                            </div>
                                            <div class="ui-list-item">
                                                <div class="ui-list-left">
                                                    <div class="ui-list-icon" style="background:#1B4990;"><i
                                                            class="fas fa-file-invoice"></i></div>
                                                    <div class="ui-list-text">
                                                        <h6>Tax Filing</h6>
                                                        <p>Income Tax Returns</p>
                                                    </div>
                                                </div>
                                                <div class="ui-list-right">
                                                    <i class="fas fa-chevron-right text-muted"
                                                        style="font-size:10px;"></i>
                                                </div>
                                            </div>

                                            <div class="ui-bottom-nav">
                                                <div class="ui-nav-item active">
                                                    <svg viewBox="0 0 24 24">
                                                        <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" />
                                                    </svg>
                                                    <span>Home</span>
                                                </div>
                                                <div class="ui-nav-item">
                                                    <svg viewBox="0 0 24 24">
                                                        <path
                                                            d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V5h14v14zM7 10h2v7H7zm4-3h2v10h-2zm4 6h2v4h-2z" />
                                                    </svg>
                                                    <span>Portfolio</span>
                                                </div>
                                                <div class="ui-nav-item">
                                                    <svg viewBox="0 0 24 24">
                                                        <path
                                                            d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z" />
                                                    </svg>
                                                    <span>Invest</span>
                                                </div>
                                                <div class="ui-nav-item">
                                                    <svg viewBox="0 0 24 24">
                                                        <path
                                                            d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
                                                    </svg>
                                                    <span>Profile</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="pm-ext-card card-sip">
                                    <div class="pm-ext-card-icon"
                                        style="background: #009899; color: white; border-radius: 50%;">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="3" stroke-linecap="round"
                                            stroke-linejoin="round">
                                            <polyline points="20 6 9 17 4 12"></polyline>
                                        </svg>
                                    </div>
                                    <div class="pm-ext-card-text">
                                        <h6>Target SIP Active</h6>
                                        <p>&#8377;15,000 <span
                                                style="font-size: 10px; color: #777; font-weight: 500; margin-left: 4px;">Monthly</span>
                                        </p>
                                    </div>
                                </div>

                                <div class="pm-ext-card card-growth">
                                    <div class="pm-ext-card-icon">
                                        <svg width="38" height="38" viewBox="0 0 40 40">
                                            <circle cx="20" cy="20" r="16" fill="#009899" />
                                            <path d="M20,20 L20,4 A16,16 0 0,1 36,20 Z" fill="#b2dfdb" />
                                        </svg>
                                    </div>
                                    <div class="pm-ext-card-text">
                                        <h6>Asset Allocation</h6>
                                        <p style="color: #009899;">Equity/Gold <span
                                                style="font-size: 10px; color: #777; font-weight: 500; margin-left: 4px;">Optimized</span>
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-6 order-1 order-lg-2">
                            <div class="ps-lg-4 sr-section no-reverse text-center text-lg-start">
                                <span class="home-label mb-3 sr-child">MOBILE APP</span>
                                <h2 class="display-5 fw-bold text-dark mb-4 lh-sm sr-child">
                                    Do More With <br>
                                    <span style="color: #009899;">AD Capital Investment</span>
                                </h2>
                                <div class="d-flex justify-content-center justify-content-lg-start align-items-center mb-4 sr-child">
                                    <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                    <div style="width: 4px; height: 4px; border-radius: 50%; background: #009899; margin: 0 8px;"></div>
                                    <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                </div>
                                <p class="text-muted fs-5 mb-5 lh-base sr-child">
                                    The financial landscape is evolving rapidly. We introduce the AD Capital app to help
                                    you stay ahead of the game by harnessing the full potential of your investments,
                                    right from your pocket.
                                </p>
                                <div class="d-flex flex-wrap gap-3 justify-content-center justify-content-lg-start sr-child">
                                    <a href="https://play.google.com/store/apps/details?id=in.mymfbox" target="_blank"
                                        class="d-inline-block app-store-link">
                                        <img src="/images/playstore.png" class="app-store-badge shadow-sm rounded-3"
                                            alt="Get it on Google Play" style="height: 54px; width: auto;">
                                    </a>
                                    <a href="https://apps.apple.com/sg/app/themfbox/id1594370380?platform=iphone"
                                        target="_blank" class="d-inline-block app-store-link">
                                        <img src="/images/appstore.png" class="app-store-badge shadow-sm rounded-3"
                                            alt="Download on the App Store" style="height: 54px; width: auto;">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- <section class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h6 class="addhead font-weight-normal">Get In Touch</h6>
	        		<h2 class="mb-5">Contact For Any Query</h2>
			</div>
		</div>
		
				<div class="row">
        						<div class="col-md-6 mb-3">
        							<label class="text-dark mb-1">Name</label>
        							<input type="text" class="form-control border-0" placeholder="Your Name" id="name" name="name" required>
        						</div>
        						<div class="col-md-6 mb-3">
        							<label class="text-dark mb-1">Email</label>
        							<input type="email" class="form-control border-0" placeholder="Your Email" id="email" name="contact-email" required>
        						</div>
        						<div class="col-md-6 mb-3">
        							<label class="text-dark mb-1">Whatsapp Mobile Number</label>
        							<input type="Number" class="form-control border-0" placeholder="Your Phone" id="mobile" name="contact-phone" required>
        						</div>
        						<div class="col-md-6 mb-3">
        							<label class="text-dark mb-1">Country</label>
        							<input type="text" class="form-control border-0" placeholder="Your Country" id="country" name="contact-country" required>
        						</div>
        						<div class="col-md-12 mb-3">
        							
        							
        							<label class="text-dark mb-1">Subject</label>
								        <select class="form-control border-0" id="subject" name="contact-subject" required>
								            <option value="">Select a Subject</option>
								            <option value="One to One Meeting">One to One Meeting</option>
								            <option value="Mutual Fund">Mutual Fund</option>
								            <option value="Health Insurance">Health Insurance</option>
								            <option value="Life Insurance">Life Insurance</option>
								            <option value="General Insurance">General Insurance</option>
								            <option value="Others">Others</option>
								        </select>
        						</div>
        						<div class="col-md-12 mb-3">
        							<label class="text-dark mb-1">Message</label>
        							<textarea class="w-100 form-control border-0" rows="6" cols="10" placeholder="Message" id="message" name="contact-message"></textarea>
        						</div>
        						<div class="col-md-12 mb-3 mt-4 text-center">
        							<button class="btn btn-theme-light btn-block text-white" style="padding:10px 40px" type="button" onclick="contactUs()">Send Message</button>
        						</div>
        					</div>
			</div>
	
</section>
 -->

            <!-- Testimonial Start -->
            <div class="container-fluid testimonial pt-2 pb-0 sr-section">
                <div class="container">
                    <div class="text-center mx-auto pb-5 sr-child" style="max-width: 600px;">
                        <span class="home-label mb-3" style="margin: 0 auto;">OUR TESTIMONIAL</span>
                        <h2 class="mb-4">Our <span style="color: #009899;">Client</span> Saying!</h2>
                        <div class="d-flex justify-content-center align-items-center mb-4">
                            <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                            <div style="width: 4px; height: 4px; border-radius: 50%; background: #009899; margin: 0 8px;"></div>
                            <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                        </div>
                    </div>
                    <div class="owl-carousel testimonial-carousel">
                        <div class="testimonial-item border p-4 sr-child">
                            <div class="d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/jayakumar.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Jaya Kumar</h4>
                                    <p class="m-0">Singapore</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">Possess strong knowledge in Personal finance. The session was very
                                    useful towards my financial planning. Touched upon all available asset classes in
                                    finance and explained to the best understanding. The session was an Eye opener.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/vignesh.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Vignesh</h4>
                                    <p class="m-0">Saudi Arabia</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">Financial literacy is paramount to one's personal life. Engaging with A
                                    D Capital investment is recommended to all for his in-depth subject knowledge &
                                    expertise in taking proper guidance, financial advice & decision making.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Manikandan.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Manikandan </h4>
                                    <p class="m-0">U.A.E</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">A D Capital Investment's guidance was very insightful. They told about
                                    the different investing options I need to evaluate and plan for a diversified
                                    portfolio which can provide downside protection to the corpus during market falls. I
                                    strongly recommend during the investing journey to get a guidance from A D Capital
                                    Investment. Thanks a lot.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/ramcharan.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Ramachandran</h4>
                                    <p class="m-0">Saudi Arabia</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">Thanks to your guidance, I have become stronger and more confident about
                                    investments. Thank you for being an amazing consultant. Their session helped me to
                                    improve my investment abilities and become a more effective investor. Thank you once
                                    again.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/thilagavathy.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Dr. Thilagavathy </h4>
                                    <p class="m-0">Bangalore, India</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">Thank you for giving me clear advice of how we can plan our personal
                                    finance and how to invest in stock market and what are the parameters to choose best
                                    mutual funds, you are doing a great work and thank you for guiding us the real facts
                                    about stock market and all the best for your future success.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/yatendrakumar.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Yatendra Sharma </h4>
                                    <p class="m-0">Saudi Arabia</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">I want to thank you for the excellent session I had with you on my
                                    financial goals. Their explanations and practical advice have given me a clearer
                                    path forward. Their expertise and dedication have been invaluable, providing me with
                                    the knowledge and confidence to make financial decisions. Their positive impact on
                                    the financial well-being is truly appreciated and I feel much more confident in my
                                    financial goals and decisions now. I appreciate their efforts to do such wonderful
                                    job to aware and guide the people about their financial needs & goals. Thank you!
                                </p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/vijaymohan.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Vijayamohan </h4>
                                    <p class="m-0">Saudi Arabia</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">A D Capital Investment provided excellent insights on personal finance,
                                    especially health and term insurance, mutual funds, and gold & equity investments.
                                    Their guidance helped me start my investment journey. I highly recommend their
                                    session and mentoring for anyone struggling with personal finance</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/natarajan.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Natarajan Dashinamoorthy </h4>
                                    <p class="m-0">Saudi Arabia</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">Its a fantastic session and an eye opener. Made me rethink my personal
                                    finance and money management. Thanks for sharing the knowledge.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Jayaprakash.jpg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Jayaprakash </h4>
                                    <p class="m-0">Saudi Arabia</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">A D Capital Investment has been an incredible source of guidance in
                                    personal finance, helping me grasp the concepts of short and long-term financial
                                    goals as well as the intricacies of the stock market. Their explanations and
                                    practical advice have empowered me to make informed decisions about my finances and
                                    investments. A D Cap's insights have shed light on budgeting, saving, and investing,
                                    enabling me topset achievable short-term goals while planning for long-term
                                    financial security. Their expertise in the stock market has demystified investment
                                    principles, risk management, and the importance of diversification, equipping me
                                    with the knowledge to navigate the market confidently. In summary, their support and
                                    detailed explanations have been invaluable in enhancing my financial literacy and
                                    decision-making. 1 am grateful for his unwavering guidance and the impact he has had
                                    on my financial understanding and planning.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/loganathan.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Loganathan </h4>
                                    <p class="m-0">Saudi Arabia</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">It was great session, They guided and helped to learn what is personal
                                    finance. Gained more knowledge on diversification of investments, long term
                                    financial goals and insurance. Their patient and practical explanations helped me a
                                    lot to build more confidence. Their depth knowledge in personal finance is
                                    invaluable. </p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/sivaganesh.png" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Sivaganesh Krishnamoorthy </h4>
                                    <p class="m-0">Saudi Arabia</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">The session was very instructive and eye-opening. I'm truly grateful for
                                    their advice and guidance. Their knowledge and expertise in tailored financial
                                    strategies have helped me to make clear and confident decisions in financial
                                    planning.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Arun.jpg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark"> Arun Madhavan</h4>
                                    <p class="m-0">Italy</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">A D Capital investment provided invaluable insights on investment and
                                    financial planning, showcasing their thorough knowledge and expertise.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Hariprasanth.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark"> Hariprasanth</h4>
                                    <p class="m-0">Salem,India</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">I have been travelling with A D Capital investment for the past few
                                    months, and their guidance has been invaluable. Initially, I started with health
                                    insurance, and their ample knowledge on financial planning made the process seamless
                                    and stress-free. Their expertise and dedication have given me confidence in my
                                    financial decisions, and I highly recommend their services to anyone seeking
                                    comprehensive financial advice.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Arunprasanth.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark"> Arunprasanth</h4>
                                    <p class="m-0">Nagapattinam, India</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">A D Capital Investment has been a game-changer in my financial journey.
                                    Their personalized approach to goal planning and investments made complex financial
                                    decisions simple and stress-free. With their expert guidance, I feel confident about
                                    securing my future and achieving financial freedom. Highly recommended!</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Vijayakumar.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark"> Dr. Vijayakumar</h4>
                                    <p class="m-0">Nagapattinam, India</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">A D Capital Investment provided exceptional clarity and guidance for my
                                    personal finances. Their expert advice on goal planning and investments was tailored
                                    to my needs, making me feel confident and secure about my financial future. Their
                                    professionalism and dedication are truly commendable!</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Karthiga.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark"> Karthiga</h4>
                                    <p class="m-0">Nagapattinam, India</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">I have been working with A D Capital Investment for several months, and
                                    the experience has been exceptional. Their deep understanding of the stock market
                                    and personalized approach to my financial goals have helped me make well-informed
                                    decisions with confidence. What sets A D Capital Investment apart is their ability
                                    to explain complex market trends in a way that's easy to understand, while always
                                    keeping my long-term goals in mind. Thanks to their guidance, I have seen
                                    significant growth in my investments and feel more secure about my financial future.
                                    I highly recommend A D Capital Investment to anyone looking for a knowledgeable and
                                    trustworthy financial advisor.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Servinkumar.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Dr. Servinkumar</h4>
                                    <p class="m-0">Chennai, India </p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">A D Capital Investment has been invaluable in guiding me through the
                                    intricacies of personal finance and investment planning. Their expert advice on
                                    mutual funds, goal planning, and insurance has given me the confidence to make
                                    informed financial decisions</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Saravanan.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark">Saravanan Mani</h4>
                                    <p class="m-0"> USA</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">I recently attended a financial session, and it was truly an eye-opening
                                    experience! The session provided invaluable insights into making smart financial
                                    decisions, planning for the future, and achieving financial security. They explained
                                    complex financial concepts in a simple and engaging way, making it easy to
                                    understand and apply to real-life situations. I walked away with a clearer vision of
                                    how to manage my finances wisely and build a more secure financial future. I highly
                                    recommend this session to anyone looking to take control of their financial
                                    well-being!</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Ajeeth.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark"> Ajeeth kumar</h4>
                                    <p class="m-0"> UK</p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">I want to express my gratitude to A D Capital investment for helping me
                                    to establish a solid financial foundation for my life. After I began consulting
                                    them, I felt really happy and secure.Their extensive understanding of the stock market and life insurance
                                    amazes me, and I wish them to assist many others like me to build more financially
                                    fulfilling lives.</p>
                            </div>
                        </div>
                        <div class="testimonial-item border p-4 sr-child">
                            <div class=" d-flex align-items-center">
                                <div class="">
                                    <img src="images/testmonial/Rajkumar.jpeg" alt="">
                                </div>
                                <div class="ms-4">
                                    <h4 class="text-theme-dark"> Akash Rajkumar</h4>
                                    <p class="m-0">Ireland </p>
                                </div>
                            </div>
                            <div class="border-top mt-4 pt-3">
                                <p class="mb-0">I wasn't sure about the stock market. I received fantastic counsel and
                                    assistance, I developed a better grasp of how the market operates, and I am now more
                                    confident in my financial selections. You took the time to analyse my risk tolerance
                                    and long-term and provided excellent guidance. Thank you for the advice. I
                                    definitely suggest their services to anybody who wants to take charge of their
                                    financial destiny.</p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Testimonial End -->



            <!-- Blog Start -->
            <div class="container-fluid blog pt-0 pb-5 mb-5 sr-section">
                <div class="container pt-0 mt-2">
                    <div class="pb-5 sr-child">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <span class="home-label mb-3">BLOG</span>
                                <h2 class="mb-4">Our Latest <span
                                        style="color: #009899;">Blog</span></h2>
                                <div class="d-flex justify-content-start align-items-center mb-4">
                                    <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                    <div style="width: 4px; height: 4px; border-radius: 50%; background: #009899; margin: 0 8px;"></div>
                                    <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                </div>
                            </div>
                            <div class="col-md-6 text-end">
                                <a href="/blog" class="btn btn-theme-light rounded-pill px-4 py-2 text-white">All
                                    Blogs</a>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5 justify-content-center">
                        <c:forEach items="${blogsList}" var="blogs">
                            <div class="col-lg-6 col-xl-4 sr-child">
                                <div class="blog-item blog-card position-relative bg-white border">
                                    <div class="blog-card-img-wrapper"><img src="${blogs.image}"
                                            class="img-fluid w-100 rounded-top" alt=""></div>
                                    <div class="blog-content position-relative px-3 mt-4">
                                        <h5 class="">
                                            <c:out value="${fn:substring(blogs.title,0,40)}" />...
                                        </h5>
                                        <p class="pt-2">
                                            <c:out value="${fn:substring(blogs.shortContent,0,100)}" />..
                                        </p>
                                        <a href="/blog/${blogs.id}" class=""><small>Read More <i
                                                    class="fa fa-arrow-right mb-3 ms-2"></i></small></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- Blog End -->




            <!-- News Start -->
            <div class="container-fluid blog py-5 sr-section">
                <div class="container ">
                    <div class="pb-5 sr-child">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <span class="home-label mb-3">NEWS</span>
                                <h2 class="mb-4">Our Latest <span
                                        style="color: #009899;">News</span></h2>
                                <div class="d-flex justify-content-start align-items-center mb-4">
                                    <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                    <div style="width: 4px; height: 4px; border-radius: 50%; background: #009899; margin: 0 8px;"></div>
                                    <div style="height: 1px; width: 30px; background: rgba(0, 152, 153, 0.3);"></div>
                                </div>
                            </div>
                            <div class="col-md-6 text-end">
                                <a href="/news" class="btn btn-theme-light rounded-pill px-4 py-2 text-white">All
                                    News</a>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5 justify-content-center">
                        <c:forEach items="${newslist}" var="news" varStatus="theCount">
                            <div class="col-lg-6 col-xl-4 sr-child">
                                <div class="blog-item blog-card position-relative border bg-white px-3">
                                    <div class="blog-content position-relative">
                                        <h5 class="pt-4">
                                            <c:out value="${fn:substring(news.title,0,50)}" />...
                                        </h5>
                                        <p class="py-2 mb-0">
                                            <c:out value="${fn:substring(news.small_content,0,130)}" />...
                                        </p>
                                        <a href="/news/<c:out value=" ${fn:replace(fn:trim(news.category),' ','
                                            -')}" />/
                                        <c:out value="${fn:replace(fn:trim(news.title),' ','-')}" />"
                                        class=""><small>Read More <i
                                                class="fa fa-arrow-right ms-2 mb-3"></i></small></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- News End -->


            <!-- <section>
<div class="container-fluid blog py-5 ">
	<div class="container">
		<div class="row text-center ">
			<div class="col-md-12 pb-5">
				<h5 class="addhead">Partners</h5>
      			<h2>Our AMC Partners</h2>
			</div>
			<div class="col-md-12">
				<div class="slide_vertical_wrap " style="height:400px;">
					<div class="infiniteslide_wrap">
						<div class="infiniteslide_wrap" style="overflow: hidden;height: 300px;"><ul class="slide_vertical mb-10" data-style="infiniteslide16775885016091e8c" style="display: flex; flex-flow: column nowrap; align-items: center; animation: 36.0683s linear 0s infinite normal none running infiniteslide16775885016091e8c;">
							<picture style="flex: 0 0 auto; display: block;">
								<img src="/images/client_logos.png" class="img-fluid" alt="a cute kitten">
							</picture>
							</ul>
						</div>
					</div>
			   </div>
			</div>
		</div>
	</div>
	</div>	
</section> -->

            <section class="amc-bg" id="homeResearchSection">
                <div class="container py-0 py-lg-3">
                    <div class="sr-section">
                        <div class="row text-center pb-5">
                            <h2 class="text-dark mb-30 sr-child"><span class="text-theme-colored2">Our <span
                                style="color: #009899;">AMC</span> Partners</span></h2>
                        </div>
                        <div class="owl-carousel owl-theme amc-carousel">
                            <div class="item client-logo-slide sr-child"><img
                                    src="/images/home/amc-company/360one.png" height="90" width="200" alt=""></div>
                            <div class="item client-logo-slide sr-child"><img
                                    src="/images/home/amc-company/aditya.png" height="90" width="200" alt=""></div>
                            <div class="item client-logo-slide sr-child"><img
                                    src="/images/home/amc-company/axis.png" height="90" width="200" alt=""></div>
                            <div class="item client-logo-slide sr-child"><img
                                    src="/images/home/amc-company/bajaj.png" height="90" width="200" alt=""></div>
                            <div class="item client-logo-slide sr-child"><img
                                    src="/images/home/amc-company/bandhan.png" height="90" width="200" alt=""></div>
                            <div class="item client-logo-slide sr-child"><img
                                    src="/images/home/amc-company/bank-of-india.png" height="90" width="200" alt="">
                            </div>
                            <div class="item client-logo-slide sr-child"><img
                                    src="/images/home/amc-company/bnp-paribas.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/canara.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/dsp.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/edelweiss.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/franklin.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/groww.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/hdfc.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/Helios.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/hsbc.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/icici.png" height="90" width="200" alt="" />
                            </div>
                            <!-- <div class="item client-logo-slide sr-child">
								<img src="/images/home/amc-company/idbi.png" height="90" width="200" alt="" />
							</div> -->
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/invesco.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/iti.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/jmfinance.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/kotak.png" height="90" width="200" alt="" />
                            </div>
                            <!-- <div class="item client-logo-slide sr-child">
								<img src="/images/home/amc-company/lnt.png" height="90" width="200" alt="" />
							</div> -->
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/lic.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/mahindra.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/mirae.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/motilal-oswal.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/navi.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/nippon.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/nj-mf.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/oldbridge.jpg" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/pgim.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/ppfas.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/quant.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/quantum.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/samco.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/sbi.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/sriram.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/sundaram.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/tata.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/taurus.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/trust.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/union.png" height="90" width="200" alt="" />
                            </div>
                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/uti.png" height="90" width="200" alt="" />
                            </div>

                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/whiteoak.png" height="90" width="200" alt="" />
                            </div>

                            <div class="item client-logo-slide sr-child">
                                <img src="/images/home/amc-company/Zerodha.png" height="90" width="200" alt="" />
                            </div>
                            <!-- Add more item client-logo-slides as needed -->
                        </div>

                        <div class="sr-section">
                            <div class="row text-center py-3">
                                <h2 class="text-dark mb-30 sr-child"><span class="text-theme-colored2">Our
                                        <span style="color: #009899;">Insurance</span> Partners</span></h2>
                            </div>
                            <div class="owl-carousel owl-theme insurance-carousel">

                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/aditya-life.jpg" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/Care_health_insurance_logo.png" height="90"
                                        width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/cigna-health-insurance.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/galaxy.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/narayana.jpg" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/niva.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/star-health-insurance.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/aditya-life.jpg" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/Care_health_insurance_logo.png" height="90"
                                        width="200">
                                </div>
                                <!-- <div class="item client-logo-slide sr-child">
								<img src="/images/home/amc-company/idbi.png" height="90" width="200" alt="" />
							</div> -->
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/cigna-health-insurance.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/galaxy.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/narayana.jpg" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/niva.png" height="90" width="200">
                                </div>
                                <!-- <div class="item client-logo-slide sr-child">
								<img src="/images/home/amc-company/lnt.png" height="90" width="200" alt="" />
							</div> -->
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/healthlogo/star-health-insurance.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/acko.jpg" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/aditya.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/Aviva-Logo.wine.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/bajaj-allianz.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/bandhan.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/Canara_HSBC_Life_Insurance.jpg" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/CreditAccess.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/digit-insurance.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/Future_Generali.jpg" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/hdfc.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/icici.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/india.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/LIC.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/max.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/pnblife.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/pramerica.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/sbi-life-insurance.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/shara.png" height="90" width="200">
                                    <img src="/images/lifelogo/shriramlife.png" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/star-union.jpg" height="90" width="200">
                                </div>
                                <div class="item client-logo-slide sr-child">
                                    <img src="/images/lifelogo/tataaig.png" height="90" width="200">
                                </div>

                            </div>
                        </div>

                    </div>
            </section>

<!-- ─── OUR PROCESS MODAL OVERLAY ──────────────────────────────── -->
<style>
/* === Backdrop === */
#processModal {
  position: fixed;
  inset: 0;
  z-index: 10000;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 16px;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.45s cubic-bezier(0.22,1,0.36,1);
}
#processModal.pm-visible {
  opacity: 1;
  pointer-events: all;
}
.pm-backdrop {
  position: absolute;
  inset: 0;
  background: rgba(10, 25, 47, 0.75);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  cursor: pointer;
}

/* === Dialog === */
.pm-dialog {
  position: relative;
  background: #ffffff;
  border-radius: 20px;
  width: 100%;
  max-width: 900px;
  max-height: 90vh;
  overflow: hidden;
  box-shadow: 0 40px 100px rgba(0,0,0,.32), 0 8px 32px rgba(0,0,0,.12);
  display: flex;
  flex-direction: column;
  transform: translateY(32px) scale(0.97);
  transition: transform 0.45s cubic-bezier(0.22,1,0.36,1);
  font-family: 'Inter', sans-serif;
}
#processModal.pm-visible .pm-dialog {
  transform: translateY(0) scale(1);
}

/* === Close button === */
.pm-close {
  position: absolute;
  top: 16px;
  right: 16px;
  z-index: 10;
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: #f1f5f9;
  border: 1px solid #e2e8f0;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.2s ease;
  color: #64748b;
}
.pm-close:hover {
  background: #e2e8f0;
  color: #0f172a;
}
.pm-close svg { width: 16px; height: 16px; }

/* === Body === */
.pm-body {
  display: flex;
  flex: 1;
  overflow: hidden;
  background: #ffffff;
}

/* LEFT column */
.pm-left {
  width: 45%;
  padding: 40px;
  display: flex;
  flex-direction: column;
  border-right: 1px solid #f1f5f9;
}

.pm-eyebrow {
  font-size: 10px;
  font-weight: 700;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: #009899;
  margin-bottom: 12px;
}
.pm-eyebrow::after {
  content: '';
  display: block;
  width: 40px;
  height: 2px;
  background: #009899;
  margin-top: 4px;
}

.pm-title {
  font-size: 2.2rem;
  font-weight: 800;
  color: #1e293b;
  line-height: 1.1;
  margin-bottom: 16px;
}
.pm-title span { color: #009899; }

.pm-subtitle {
  font-size: 13px;
  color: #64748b;
  line-height: 1.6;
  margin-bottom: 24px;
  max-width: 90%;
}

.pm-illustration {
  width: 100%;
  margin-top: auto;
  object-fit: contain;
  mix-blend-mode: multiply;
}

/* RIGHT column (Steps) */
.pm-right {
  flex: 1;
  overflow-y: auto;
  padding: 40px;
  position: relative;
}

/* Scrollbar styling for right pane */
.pm-right::-webkit-scrollbar { width: 6px; }
.pm-right::-webkit-scrollbar-track { background: transparent; }
.pm-right::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 4px; }
.pm-right::-webkit-scrollbar-thumb:hover { background: #94a3b8; }

.pm-timeline {
  position: relative;
  padding-left: 10px;
}

.pm-step {
  display: flex;
  align-items: flex-start;
  margin-bottom: 24px;
  position: relative;
}

.pm-step:last-child {
  margin-bottom: 0;
}

/* Timeline Line */
.pm-step:not(:last-child)::before {
  content: '';
  position: absolute;
  left: 23px; /* Center of icon */
  top: 48px;
  bottom: -24px;
  width: 2px;
  background-image: linear-gradient(to bottom, #e2e8f0 50%, transparent 50%);
  background-size: 2px 8px;
  background-repeat: repeat-y;
  z-index: 1;
}

/* Icon Container */
.pm-step-icon-container {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  margin-right: 20px;
  position: relative;
  z-index: 2;
  color: #006e6f;
}
.pm-step-icon-container svg {
  width: 20px;
  height: 20px;
}

.pm-step-content {
  flex: 1;
  padding-top: 4px;
}

.pm-step-header {
  display: flex;
  align-items: baseline;
  gap: 8px;
  margin-bottom: 4px;
}

.pm-step-num {
  font-size: 13px;
  font-weight: 700;
  color: #009899;
}

.pm-step-title {
  font-size: 15px;
  font-weight: 700;
  color: #1e293b;
  margin: 0;
}

.pm-step-desc {
  font-size: 12.5px;
  color: #64748b;
  line-height: 1.5;
  margin: 0;
}

/* Final 'Commitment' Block */
.pm-commitment {
  background: #f0fdfa;
  border-radius: 12px;
  padding: 16px 20px;
  display: flex;
  align-items: center;
  gap: 16px;
  margin-top: 32px;
  border: 1px solid #ccfbf1;
}
.pm-commitment-icon {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #009899;
  flex-shrink: 0;
  box-shadow: 0 2px 4px rgba(0,0,0,0.02);
}
.pm-commitment-icon svg { width: 18px; height: 18px; }
.pm-commitment-text h6 {
  font-size: 13px;
  font-weight: 700;
  color: #009899;
  margin: 0 0 2px 0;
}
.pm-commitment-text p {
  font-size: 12px;
  color: #64748b;
  margin: 0;
}

/* === Footer === */
.pm-footer {
  background: #004d4d; /* Dark teal */
  padding: 24px 40px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-radius: 20px;
  margin: 20px;
  margin-top: 0;
}

.pm-footer-left {
  display: flex;
  align-items: center;
  gap: 16px;
}

.pm-bulb-icon {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fbbf24; /* Yellow */
}
.pm-bulb-icon svg { width: 24px; height: 24px; }

.pm-footer-text h6 {
  color: #ffffff;
  font-size: 15px;
  font-weight: 700;
  margin: 0 0 4px 0;
}

.pm-footer-text p {
  color: rgba(255, 255, 255, 0.8);
  font-size: 13px;
  margin: 0;
}

.pm-cta-btn {
  background: #ffffff;
  color: #004d4d;
  font-size: 12px;
  font-weight: 700;
  letter-spacing: 0.05em;
  padding: 12px 24px;
  border-radius: 30px;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.pm-cta-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  color: #004d4d;
}
.pm-cta-btn svg { width: 14px; height: 14px; }


/* ── RESPONSIVE ── */
@media (max-width: 800px) {
  .pm-body { flex-direction: column; overflow-y: auto;}
  .pm-left { width: 100%; border-right: none; border-bottom: 1px solid #f1f5f9; padding: 30px; }
  .pm-right { padding: 30px; overflow-y: visible;}
  .pm-footer { flex-direction: column; align-items: flex-start; gap: 20px; padding: 20px; margin: 10px;}
  .pm-illustration { display: none; } /* Hide image on small screens to save space */
}
</style>

<!-- MODAL HTML -->
<div id="processModal" role="dialog" aria-modal="true" aria-label="Our Investment Process">
  <div class="pm-backdrop" onclick="closePM()"></div>
  <div class="pm-dialog">
    
    <!-- Close -->
    <button class="pm-close" onclick="closePM()" aria-label="Close">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
    </button>

    <div class="pm-body">
      <!-- LEFT -->
      <div class="pm-left">
        <div class="pm-eyebrow">OUR PROCESS</div>
        <h2 class="pm-title">A Smarter Way<br>to <span>Invest</span></h2>
        <p class="pm-subtitle">We follow a disciplined and transparent process to help you build wealth and achieve your financial goals.</p>
        <img src="/images/home/process_illustration.png" class="pm-illustration" alt="Investment Process Illustration">
      </div>

      <!-- RIGHT: Steps -->
      <div class="pm-right">
        <div class="pm-timeline">
          
          <div class="pm-step">
            <div class="pm-step-icon-container">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="4"/><line x1="21.17" y1="8" x2="12" y2="8"/><line x1="3.95" y1="6.06" x2="8.54" y2="14"/></svg>
            </div>
            <div class="pm-step-content">
              <div class="pm-step-header">
                <span class="pm-step-num">01</span>
                <h3 class="pm-step-title">Understand Your Goals</h3>
              </div>
              <p class="pm-step-desc">We begin by understanding your financial goals, risk appetite, and investment horizon.</p>
            </div>
          </div>

          <div class="pm-step">
            <div class="pm-step-icon-container">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            </div>
            <div class="pm-step-content">
              <div class="pm-step-header">
                <span class="pm-step-num">02</span>
                <h3 class="pm-step-title">Research & Analysis</h3>
              </div>
              <p class="pm-step-desc">Our experts analyze market trends and opportunities to create the right strategy.</p>
            </div>
          </div>

          <div class="pm-step">
            <div class="pm-step-icon-container">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"/><path d="M22 12A10 10 0 0 0 12 2v10z"/></svg>
            </div>
            <div class="pm-step-content">
              <div class="pm-step-header">
                <span class="pm-step-num">03</span>
                <h3 class="pm-step-title">Build Your Portfolio</h3>
              </div>
              <p class="pm-step-desc">We construct a diversified portfolio tailored to your goals and risk profile.</p>
            </div>
          </div>

          <div class="pm-step">
            <div class="pm-step-icon-container">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
            </div>
            <div class="pm-step-content">
              <div class="pm-step-header">
                <span class="pm-step-num">04</span>
                <h3 class="pm-step-title">Monitor & Optimize</h3>
              </div>
              <p class="pm-step-desc">We continuously monitor performance and make data-driven adjustments for growth.</p>
            </div>
          </div>

          <div class="pm-step">
            <div class="pm-step-icon-container">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22"/><path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22"/><path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/></svg>
            </div>
            <div class="pm-step-content">
              <div class="pm-step-header">
                <span class="pm-step-num">05</span>
                <h3 class="pm-step-title">Grow & Achieve</h3>
              </div>
              <p class="pm-step-desc">Stay invested, stay disciplined, and we help you achieve your financial milestones.</p>
            </div>
          </div>

        </div>

        <div class="pm-commitment">
          <div class="pm-commitment-icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/><path d="m9 12 2 2 4-4"/></svg>
          </div>
          <div class="pm-commitment-text">
            <h6>Our Commitment</h6>
            <p>Your goals. Our expertise. Growing together.</p>
          </div>
        </div>

      </div>
    </div>

    <!-- FOOTER CTA -->
    <div class="pm-footer">
      <div class="pm-footer-left">
        <div class="pm-bulb-icon">
           <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 18h6"/><path d="M10 22h4"/><path d="M15.09 14c.18-.98.65-1.74 1.41-2.5A4.65 4.65 0 0 0 18 8 6 6 0 0 0 6 8c0 1.45.62 2.84 1.5 3.5.76.76 1.23 1.52 1.41 2.5"/><path d="M12 2v2"/></svg>
        </div>
        <div class="pm-footer-text">
          <h6>Ready to start your investment journey?</h6>
          <p>Let's make your financial goals a reality.</p>
        </div>
      </div>
      <a href="/our-process" class="pm-cta-btn" onclick="navigateFromPM(event, this.href)">
        EXPLORE OUR SERVICES
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
      </a>
    </div>

  </div>
</div>

<script>
(function () {
  var STORAGE_KEY = 'pm_dismissed_time';
  var modal = document.getElementById('processModal');

  function openPM() {
    modal.classList.add('pm-visible');
    document.body.style.overflow = 'hidden';
  }

  window.closePM = function () {
    modal.classList.remove('pm-visible');
    document.body.style.overflow = '';
    try { 
      // Save the current timestamp when dismissed
      localStorage.setItem(STORAGE_KEY, Date.now().toString()); 
    } catch(e){}
  };

  window.navigateFromPM = function (event, url) {
    event.preventDefault(); // Stop immediate navigation
    closePM(); // Start closing animation
    setTimeout(function() {
      window.location.href = url;
    }, 450); // Wait for the transition to complete (450ms)
  };

  // Show after 1.5s, but only once every 24 hours
  try {
    var lastDismissed = localStorage.getItem(STORAGE_KEY);
    var oneDay = 24 * 60 * 60 * 1000; // 24 hours in milliseconds
    
    // If never dismissed, or if it's been more than 24 hours since last dismiss
    if (!lastDismissed || (Date.now() - parseInt(lastDismissed)) > oneDay) {
      setTimeout(openPM, 1500);
    }
  } catch(e) {
    setTimeout(openPM, 1500);
  }

  // Close on Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') closePM();
  });
})();
</script>
<!-- ─── END PROCESS MODAL ─────────────────────────────────────── -->


