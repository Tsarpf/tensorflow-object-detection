$(cat ./settings | xargs)
gcloud auth application-default login
LOG_DIR=gs://${BUCKET}/${BUCKET_FOLDER}/${MODEL_OUTPUT_DIR}
tensorboard --logdir=${LOG_DIR}

