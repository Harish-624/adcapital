import os
import re

directory = '/Users/harishramaraj/Documents/Abhishek/adcapital/project/ROOT-v2/src/main/webapp/WEB-INF/jsp'

for root, dirs, files in os.walk(directory):
    for file in files:
        if file.endswith('.jsp'):
            filepath = os.path.join(root, file)
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
            
            # replace wow fadeInUp with sr-reveal
            new_content = re.sub(r'\bwow\s+fadeInUp\b', 'sr-reveal', content)
            new_content = re.sub(r'\bwow\b', 'sr-reveal', new_content)
            # clean up duplicated sr-reveal
            new_content = re.sub(r'\bsr-reveal\s+sr-reveal\b', 'sr-reveal', new_content)
            # remove data-wow-delay="..."
            new_content = re.sub(r'\s*data-wow-delay="[^"]*"', '', new_content)
            
            if new_content != content:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                print(f"Updated {filepath}")
