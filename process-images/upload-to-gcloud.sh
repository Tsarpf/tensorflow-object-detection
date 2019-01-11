$(cat ../settings | xargs)
gsutil cp dist/train.record gs://${BUCKET}/${BUCKET_FOLDER}/
gsutil cp dist/label-map.pbtxt gs://${BUCKET}/${BUCKET_FOLDER}/
gsutil cp dist/test.record gs://${BUCKET}/${BUCKET_FOLDER}/
