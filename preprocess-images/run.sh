# rm ./dist/* 
python xml-to-csv.py
python split.py
./create-tf-record.sh
