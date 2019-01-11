echo "Removing old dist contents if any"
rm ./dist/* 
python xml-to-csv.py
python split.py
./create-tf-record.sh
python create-label-map.py
