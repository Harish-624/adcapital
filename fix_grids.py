import os
import re

common_dir = '/Users/harishramaraj/Documents/Abhishek/adcapital/project/ROOT-v2/src/main/webapp/WEB-INF/jsp/common'
calc_dir = '/Users/harishramaraj/Documents/Abhishek/adcapital/project/ROOT-v2/src/main/webapp/WEB-INF/jsp/calculator'

def replace_in_file(filepath, pattern, replacement):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    new_content = re.sub(pattern, replacement, content)
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")

# Update news.jsp
news_path = os.path.join(common_dir, 'news.jsp')
replace_in_file(news_path, r'<div class="row g-4 mb-5">', r'<div class="row g-4 mb-5 sr-section">')
replace_in_file(news_path, r'class="col-lg-4 col-md-6 sr-reveal"', r'class="col-lg-4 col-md-6 sr-child"')

# Update blog.jsp
blog_path = os.path.join(common_dir, 'blog.jsp')
replace_in_file(blog_path, r'<div class="row g-4">', r'<div class="row g-4 sr-section">')
replace_in_file(blog_path, r'class="col-lg-4 col-md-6 sr-reveal"', r'class="col-lg-4 col-md-6 sr-child"')

# Update mutual-funds.jsp
mf_path = os.path.join(common_dir, 'mutual-funds.jsp')
replace_in_file(mf_path, r'<div class="row justify-content-center sr-reveal">', r'<div class="row justify-content-center sr-section">')
replace_in_file(mf_path, r'class="col-lg-6 mb-4 mb-lg-0 sr-reveal"', r'class="col-lg-6 mb-4 mb-lg-0 sr-child"')
replace_in_file(mf_path, r'class="col-lg-6 sr-reveal"', r'class="col-lg-6 sr-child"')

# Update links-and-books.jsp
links_path = os.path.join(common_dir, 'links-and-books.jsp')
replace_in_file(links_path, r'class="tab-content sr-reveal"', r'class="tab-content sr-section"')
replace_in_file(links_path, r'class="col-md-6 col-lg-4"', r'class="col-md-6 col-lg-4 sr-child"')
replace_in_file(links_path, r'class="col-12"', r'class="col-12 sr-child"')

# Update Calculators
for f in os.listdir(calc_dir):
    if f.endswith('.jsp'):
        filepath = os.path.join(calc_dir, f)
        replace_in_file(filepath, r'class="row align-items-center mb-5 sr-reveal"', r'class="row align-items-center mb-5 sr-section"')
        replace_in_file(filepath, r'class="col-sm-12 my-3 row-eq-height sr-reveal"', r'class="col-sm-12 my-3 row-eq-height sr-child"')
        replace_in_file(filepath, r'class="card mb-5 text-center premium-result-card sr-reveal"', r'class="card mb-5 text-center premium-result-card sr-child"')

