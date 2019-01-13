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
  - `./setup-training.sh`
    * writes a cluster configuration for Google Cloud ML job.
    * creates a training script in `training/dist/run-training.sh`
  - `./run-training.sh`
  - `./monitor-training-tensorboard.sh` to see training progress etc. in tensorboard
  
## After training (not fully scripted)
  - Use f.ex `gsutil cp gs://yourbucket/model-output-folder/model* ./model-checkpoints/` to download model files
  - `(cd post-training && ./export-inference.sh)` exports .pb file.
  - `cd object-detection`, `python detect.py <path-to-file-to-be-detected>.jpg`, for example to run on test image that comes with the repo: `python detect.py test-images/jetpens.jpg`, the image with bounding boxes will appear in `output/jetpens.jpg` (in this case overwriting it as it's included in the repository)

## Examples
As can be seen, some false positives (like the door handle) appear, and if the pens are too far or the image is not clear enough, pens are sometimes missed. Unseen pens are sometimes also detected, even though around 290 out of 300 images in the train/validation set were on two pens, and just a handful of pictures with 5 other pens.

Original             |  Detected
:-------------------------:|:-------------------------:
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/IMG_20190113_111318.jpg)  |  ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/IMG_20190113_111318.jpg)
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/jetpens.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/jetpens.jpg)
pen not detected
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/joulukuve.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/joulukuve.jpg)
one pen missed, door handle false-positive
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/IMG_20190113_111438.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/IMG_20190113_111438.jpg)
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/pen-pic.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/pen-pic.jpg)
two pens missed on bean bag:
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/IMG_20190113_111325.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/IMG_20190113_111325.jpg)
a hard-to-find pen missed on bean bag:
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/IMG_20190113_111333.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/IMG_20190113_111333.jpg)
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/IMG_20190113_111457.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/IMG_20190113_111457.jpg)
farthest away pen not detected
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/IMG_20190113_111504.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/IMG_20190113_111504.jpg)
pens too far away, not detected at all!
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/IMG_20190113_111510.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/IMG_20190113_111510.jpg)
previously unseen pen: 
![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/test-images/unseen_white.jpg) | ![](https://github.com/Tsarpf/tensorflow-object-detection/raw/master/object-detection/output/unseen_white.jpg)
