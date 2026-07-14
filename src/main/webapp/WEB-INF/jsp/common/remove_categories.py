import re
import os

base_path = '/Users/harishramaraj/Documents/Abhishek/adcapital/project/ROOT-v2/src/main/webapp/WEB-INF/jsp/common/'

files = ['news.jsp', 'blog.jsp', 'mutual-funds-faq.jsp', 'nri-corner.jsp', 'financial-planning.jsp']

for file in files:
    path = os.path.join(base_path, file)
    with open(path, 'r') as f:
        content = f.read()
    
    # Remove category HTML blocks
    # Looking for <div class="news-categories ... </div> etc.
    content = re.sub(r'<div class=".*?categories.*?</div>\s*', '', content, flags=re.DOTALL)
    
    # Remove chip related JS logic
    content = re.sub(r'const chips = document\.querySelectorAll\([^)]+\);\s*', '', content)
    content = re.sub(r'const activeChip = [^\n]+\n\s*', '', content)
    
    # Update filtering logic to just use search
    # This might be tricky with regex, let's just replace the whole script block
    
    if 'faq' in file or 'nri' in file or 'planning' in file:
        js = """
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.faq-search-box input, .search-box input');
    const searchBtn = document.querySelector('.faq-search-btn, .search-btn');
    const items = document.querySelectorAll('.accordion-item');

    function filterItems() {
        if(!searchInput) return;
        const query = searchInput.value.toLowerCase();
        
        items.forEach(item => {
            const text = item.textContent.toLowerCase();
            const matchesSearch = text.includes(query);
            
            if (matchesSearch) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
    }

    if(searchInput) searchInput.addEventListener('keyup', filterItems);
    if(searchBtn) searchBtn.addEventListener('click', filterItems);
});
"""
    elif 'news' in file:
        js = """
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.news-search-box input');
    const searchBtn = document.querySelector('.news-search-btn');
    const cards = document.querySelectorAll('.col-lg-4, .col-md-6'); // card wrappers

    function filterCards() {
        if(!searchInput) return;
        const query = searchInput.value.toLowerCase();
        
        cards.forEach(card => {
            if(!card.querySelector('.premium-news-card')) return;
            const title = card.querySelector('.news-title').textContent.toLowerCase();
            const excerpt = card.querySelector('.news-excerpt').textContent.toLowerCase();
            
            const matchesSearch = title.includes(query) || excerpt.includes(query);
            
            if (matchesSearch) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    if(searchInput) searchInput.addEventListener('keyup', filterCards);
    if(searchBtn) searchBtn.addEventListener('click', filterCards);
});
"""
    elif 'blog' in file:
        js = """
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.blog-search-box input');
    const searchBtn = document.querySelector('.blog-search-btn');
    const cards = document.querySelectorAll('.col-lg-4, .col-md-6'); // card wrappers

    function filterCards() {
        if(!searchInput) return;
        const query = searchInput.value.toLowerCase();
        
        cards.forEach(card => {
            if(!card.querySelector('.premium-blog-card')) return;
            const title = card.querySelector('.blog-title').textContent.toLowerCase();
            const excerpt = card.querySelector('.blog-excerpt').textContent.toLowerCase();
            
            const matchesSearch = title.includes(query) || excerpt.includes(query);
            
            if (matchesSearch) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    if(searchInput) searchInput.addEventListener('keyup', filterCards);
    if(searchBtn) searchBtn.addEventListener('click', filterCards);
});
"""

    content = re.sub(r'<script>[\s\S]*?<\/script>', f'<script>\n{js}\n</script>', content)

    with open(path, 'w') as f:
        f.write(content)

