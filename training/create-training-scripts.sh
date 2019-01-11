$(cat ../settings | xargs)

cp training-config-template dist/training.config

# Setup training config with n of classes 
# n of classes is row count of classes.txt minus one
NUM_CLASSES=$(sed '1d' ../classes.txt | wc -l)
sed -i "s/NUM_CLASSES_REPLACE/"${NUM_CLASSES}"/g" \
     ./dist/training.config


# Create a training script from template
cp run-training-template dist/run-training.sh

sed -i "s|JOB_DIR|"${BUCKET}/${BUCKET_FOLDER}/${MODEL_OUTPUT_DIR}"|g" \
     ./dist/run-training.sh

sed -i "s/REGION/"${COMPUTE_REGION}"/g" \
     ./dist/run-training.sh

sed -i "s|CONFIG_PATH|"${BUCKET}/${BUCKET_FOLDER}"|g" \
     ./dist/run-training.sh


chmod +x ./dist/run-training.sh

cp cloud.yml dist/
