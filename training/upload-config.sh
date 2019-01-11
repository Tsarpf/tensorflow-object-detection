$(cat ../settings | xargs)

gsutil cp ./dist/training.config gs://${BUCKET}/${BUCKET_FOLDER}/
