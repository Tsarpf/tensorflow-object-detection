(cd training/
rm -rf dist/*

./package-code.sh
./get-tools.sh
./create-training-scripts.sh
)
