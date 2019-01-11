
python setup.py build

python setup.py install

python object_detection/export_inference_graph.py \
    --input_type image_tensor \
    --pipeline_config_path ./pentect.config \
    --trained_checkpoint_prefix ./ready-model/model.ckpt-131448 \
    --output_directory exported_graphs

