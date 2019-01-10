# Create train data:
python gen-tf-record.py --csv_input=dist/train.csv  --output_path=dist/train.record --image_dir=images

# Create test data:
python gen-tf-record.py --csv_input=dist/test.csv  --output_path=dist/test.record --image_dir=images
