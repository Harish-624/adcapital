<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  /* ── PAGE HERO (Removed inline styles, now using global .page-hero-curved) ── */

  /* ── Section & Ambient Background ─────────────────────────────── */
  .team-section {
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
    margin-bottom: 30px;
    transition: transform 0.4s cubic-bezier(0.165, 0.84, 0.44, 1), box-shadow 0.4s ease;
  }
  .mv-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 20px 40px rgba(0,0,0,0.08);
  }

  /* ── Team Image Effects ─────────────────────────────── */
  .team-img-wrapper {
    position: relative;
    display: inline-block;
    margin-bottom: 20px;
  }
  .team-img-backing {
    position: absolute;
    inset: -10px;
    background: linear-gradient(135deg, rgba(0, 152, 153, 0.15) 0%, rgba(0, 133, 161, 0.05) 100%);
    border-radius: 50%;
    transform: rotate(-5deg);
    z-index: 0;
    transition: transform 0.5s ease;
  }
  .mv-card:hover .team-img-backing {
    transform: rotate(10deg) scale(1.05);
  }
  .team-img-wrapper img {
    position: relative;
    z-index: 1;
    border-radius: 50%;
    width: 220px;
    height: 220px;
    object-fit: cover;
    border: 4px solid #fff;
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    transition: transform 0.5s ease;
  }
  .mv-card:hover .team-img-wrapper img {
    transform: scale(1.02);
  }

  /* ── Typography & Links ─────────────────────────────── */
  .team-name {
    color: #1a1f2e;
    font-size: 1.8rem;
    font-weight: 700;
    margin-bottom: 5px;
  }
  .team-role {
    color: #009899;
    font-weight: 600;
    font-size: 14px;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin-bottom: 20px;
    display: inline-block;
    padding: 6px 16px;
    background: rgba(0, 152, 153, 0.08);
    border-radius: 50px;
  }
  .team-bio {
    color: #4b5563;
    line-height: 1.8;
    font-size: 15px;
    margin-bottom: 20px;
  }
  .team-social a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    border-radius: 10px;
    background: rgba(0, 152, 153, 0.1);
    color: #009899;
    font-size: 18px;
    transition: all 0.3s ease;
  }
  .team-social a:hover {
    background: #009899;
    color: #fff;
    transform: translateY(-3px);
  }

  @media (max-width: 768px) {
    .mv-card { padding: 30px 20px; text-align: center; }
    .team-bio { text-align: left; }
  }
</style>

<!-- ── PAGE HERO ──────────────────────────────────────────────── -->
<div class="page-hero-curved">
  <div class="container text-center position-relative" style="z-index:2">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-3 justify-content-center">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="/about-us">About Us</a></li>
        <li class="breadcrumb-item active" aria-current="page">Team</li>
      </ol>
    </nav>
    <div class="text-center">
      <span class="category-label">People</span>
      <h1 class="mt-2 mb-0" style="font-size: 2.6rem; font-weight: 700; color: #1a1f2e;">Meet the Team</h1>
    </div>
  </div>
  <div class="page-hero-curve-bottom"></div>
</div>

<!-- ── MAIN CONTENT ──────────────────────────────────────────────── -->
<section class="team-section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-10">

        <!-- Intro -->
        <div class="text-center mb-5 sr-reveal">
          <h2 style="color: #1a1f2e; font-weight: 700; margin-bottom: 15px;">Automated Financial Advice with a Personal Touch</h2>
          <p style="color: #4b5563; font-size: 16px; line-height: 1.8; max-width: 800px; margin: 0 auto;">
            Given that you lead a busy lifestyle, you deserve more than a one size-fits-all investment plan. Thanks to Plutus' advanced tools, we can help you plan and go about even the most complex financial decisions with ease. And for those of you who prefer a more human approach, Plutus is supported by a team of dedicated financial advisors.
          </p>
        </div>

        <!-- Team Member 1 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/anirudh_2.jpg" alt="Anirudh Dar" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Anirudh Dar</h3>
              <div class="team-role">Founder</div>
              <p class="team-bio">
                Anirudh has over nineteen years' experience, first in the hospitality sector in which he holds an MBA degree from France and later in banking and financial advisory. Plutus is his entrepreneurial effort. Under his personal tutelage Plutus provides professional expertise and helps open doors to several modern avenues for investment by fully analysing market conditions.
              </p>
              <p class="team-bio">
                He has worked with global banks such as Deutsche Bank and ABN Amro Bank in personal and private banking roles and with Ameriprise Financial initially as part of the founding team.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/anirudhdar/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

        <!-- Team Member 2 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/rohini.jpg" alt="Rohini Wadhwa" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Rohini Wadhwa</h3>
              <div class="team-role">Head, Client Acquisition</div>
              <p class="team-bio">
                Rohini has an MBA in Marketing from Amity University, Noida and holds a Bachelors' degree in Biotechnology from Punjab University, Chandigarh. She has over fifteen years' experience in financial services and has worked with Deutsche Bank, The Royal Bank of Scotland and HSBC. In her previous assignment with Ameriprise Financial she spent over four years helping clients live their dreams and advising them on how to achieve their goals.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/rohini-wadhwa-690b50a/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

        <!-- Team Member 3 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/aarti.jpg" alt="Arti Sahgal" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Arti Sahgal</h3>
              <div class="team-role">Head, Financial Planning and Strategies</div>
              <p class="team-bio">
                Arti has a Graduate Degree in Economics as well as a Post Graduate in Financial Planning. To her sound educational background, she added the skills necessary to be a Certified Financial Planner (CFP). She has over 15 years of experience in Financial Planning and has to her credit scores of financial plans that have a reputation of meeting all landmark financial goals of her clients without any compromise.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/arti-arora-cfpcm-b9819b4/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

        <!-- Team Member 4 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/savita.jpg" alt="Savita Sharma" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Savita Sharma</h3>
              <div class="team-role">Associate Director, Sales</div>
              <p class="team-bio">
                Savita Sharma is a Commerce Graduate from Delhi University with 16 years of experience in financial services by virtue of having worked with brands like Almondz Global Securities, Unicon Insurance and Standard Chartered Bank. Savita specializes in providing financial guidance with specific investment advice and strategic portfolio management including early-stage life planning, retirement planning, and mutual funds.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/savita-sharma-03a14b35/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

        <!-- Team Member 5 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/amit.jpg" alt="Amit Gupta" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Amit Gupta</h3>
              <div class="team-role">Senior Manager, Sales</div>
              <p class="team-bio">
                Amit has an MSF in Finance from ICFAI University, Gurgaon. Amit has over nine years' experience in financial services and has worked with eminent brands like Kotak Mahindra Bank and Bajaj Capital Ltd. For the past nine years Amit has been delivering great value to clients as a financial advisor, helping them plan ahead for their short-term needs as well as long-term goals.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/amit-gupta-ba10831aa/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

        <!-- Team Member 6 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/vishnu.jpg" alt="Vishnu Kumar" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Vishnu Kumar</h3>
              <div class="team-role">Manager, Operations & Client Servicing</div>
              <p class="team-bio">
                Vishnu is a graduate from Shobhit University, Meerut and has over fifteen years' experience in banking operation services. Before joining Plutus, he was an integral part of the Central Operations Team at ABN Amro Bank. Vishnu is also responsible for handling all client queries as well and vendor and partner agreement and their smooth on-boarding at Plutus.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/vishnu-0976371aa/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

        <!-- Team Member 7 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/sherry.jpg" alt="Sherry Jindal" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Sherry Jindal</h3>
              <div class="team-role">Business Intelligence & Analytics</div>
              <p class="team-bio">
                Sherry has a Bachelor's degree in Computer Science & Engineering along with an MBA in Banking and Finance with Specialization in Investment Banking, Wealth Management and Corporate Finance. He holds special skills in Company and Client Profiling, Industry Analysis, Financial Modelling, Analysis of Financial Assets and Pitchbook.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/sherryjindal/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Team Member 8 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/smriti.jpg" alt="Smriti Mehra" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Smriti Mehra</h3>
              <div class="team-role">Associate, Financial Planning</div>
              <p class="team-bio">
                Smriti has completed her MBA in Financial Market Practices with super specialization in Investment Banking, Corporate Finance and Wealth Management. She eventually developed comprehensive proficiency in fundamental & technical analysis, market research and insight towards financial planning. With the belief "Customer is King" she strives to provide best to her clients.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/smriti-mehra-077534100/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

        <!-- Team Member 9 -->
        <div class="mv-card sr-reveal" data-sr-reveal-delay="0.1s">
          <div class="row align-items-center">
            <div class="col-md-4 text-center">
              <div class="team-img-wrapper">
                <div class="team-img-backing"></div>
                <img src="/img/team/tamanna.jpg" alt="Tamanna Saini" loading="lazy">
              </div>
            </div>
            <div class="col-md-8 mt-4 mt-md-0">
              <h3 class="team-name">Tamanna Saini</h3>
              <div class="team-role">Associate, Digital Marketing</div>
              <p class="team-bio">
                Tamanna has completed her MBA in Financial Market Practices with super specialization in Investment Banking, Corporate Finance and Wealth Management and holds a Bachelor's Degree in Commerce from Kurukshetra University. Her main objective at Plutus is to ensure all communication is crafted in a manner that best represents values of our brand on various social media networks.
              </p>
              <div class="team-social">
                <a href="https://www.linkedin.com/in/tamanna-saini-759688199/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
