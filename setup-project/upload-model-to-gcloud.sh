$(cat ../settings | xargs)
echo Uploading model ${MODEL_NAME} to bucket: ${BUCKET} folder ${BUCKET_FOLDER}
gsutil cp dist/${MODEL_NAME}/model.ckpt.* gs://${BUCKET}/${BUCKET_FOLDER}/

