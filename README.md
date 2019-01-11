# Semi-automatic Tensorflow object detection training pipeline for Google Cloud ML

Basically a scripted version of https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/running_pets.md for training on custom image sets

The pet detector from above uses transfer learning on Faster R-CNN with Resnet-101. The training config here is almost exactly the same as in the pet example except for the amount of classes that is set by the script.

## HAVE:
  - Tensorflow etc installed
  - gcloud project and bucket set up
  - used labelImg or similar software to annotate images' classes and bounding boxes in PascalVOC style (ie. have an xml file per each image file)

## PUT:
  - environment variables into `settings`
  - class names into `classes.txt` (make sure they're the same as when you annotated your images)
  - your images to `process-images/images`
  - annotations xml files to `process-images/annotations`

## RUN:
  - `./process-images.sh`, it
    * creates `process-images/dist/*.record` files
    * generates `process-images/dist/label-map.pbtxt` from `classes.txt`
  - `./download-upload-model.sh`, it
    * downloads the model locally
    * uploads the model to google cloud
  - `./setup-training.sh`, it
    * packages the Tensorflow Object Detection code.
    * writes a cluster configuration for Google Cloud ML job.
    * creates a training script in `training/dist/run-training.sh`
  - `./run-training.sh`

