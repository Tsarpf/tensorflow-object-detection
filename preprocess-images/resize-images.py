import glob
from PIL import Image

imgs = glob.glob('./original-images/*.jpg')
for path in imgs:
    new_path = path.replace('original-', '')
    img = Image.open(path)
    img.thumbnail((1000, 1000), Image.ANTIALIAS)
    img.save(new_path)

