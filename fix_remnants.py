import os
import re

calc_dir = '/Users/harishramaraj/Documents/Abhishek/adcapital/project/ROOT-v2/src/main/webapp/WEB-INF/jsp/calculator'

def replace_in_file(filepath, pattern, replacement):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    new_content = re.sub(pattern, replacement, content)
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")

for f in os.listdir(calc_dir):
    if f.endswith('.jsp'):
        filepath = os.path.join(calc_dir, f)
        replace_in_file(filepath, r'class="col-sm-12 my-3 sr-reveal"', r'class="col-sm-12 my-3 sr-child"')
        replace_in_file(filepath, r'class="row pb-4 sr-reveal"', r'class="row pb-4 sr-section"')
        replace_in_file(filepath, r'class="col-lg-7 sr-reveal fadeInRight".*?>', r'class="col-lg-7 sr-child">')
        replace_in_file(filepath, r'class="col-lg-5 my-3 sr-reveal fadeInRight".*?>', r'class="col-lg-5 my-3 sr-child">')
        replace_in_file(filepath, r'class="col-lg-12 sr-reveal fadeInRight".*?>', r'class="col-lg-12 sr-child">')
        replace_in_file(filepath, r'class="row calculator sr-reveal"', r'class="row calculator sr-section"')

