import os
import glob
from PIL import Image

image_dir = "src/main/resources/static/images"
extensions = ('*.png', '*.jpg', '*.jpeg')
files = []
for ext in extensions:
    files.extend(glob.glob(os.path.join(image_dir, '**', ext), recursive=True))

for file in files:
    if "Banner-1" in file or "Banner-2" in file or "banner1" in file:
        continue # skip deleted ones
        
    orig_size = os.path.getsize(file)
    
    # Only compress files larger than 500KB to be absolutely safe
    if orig_size < 500 * 1024:
        continue

    # Generate webp filename
    base, ext = os.path.splitext(file)
    webp_file = base + ".webp"
    
    try:
        img = Image.open(file)
        
        # PRESERVE TRANSPARENCY
        if img.mode in ('RGBA', 'LA') or (img.mode == 'P' and 'transparency' in img.info):
            img = img.convert('RGBA')
        else:
            img = img.convert('RGB')
            
        img.save(webp_file, "WEBP", quality=80, method=6)
        
        new_size = os.path.getsize(webp_file)
        print(f"Compressed {os.path.basename(file)}: {orig_size/1024/1024:.2f}MB -> {new_size/1024/1024:.2f}MB (Kept transparency: {img.mode == 'RGBA'})")
    except Exception as e:
        print(f"Failed {file}: {e}")

