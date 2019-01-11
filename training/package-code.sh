
cp setup.py dist/
cp slim-setup.py dist/
(cd dist
python slim-setup.py sdist
python setup.py sdist
mv dist/* ./
rm -rf ./dist
rm slim-setup.py
rm setup.py
)
