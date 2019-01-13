python ./export-inference-graph.py \
    --input_type image_tensor \
    --pipeline_config_path ../training/dist/training.config \
    --trained_checkpoint_prefix ../model-checkpoints/model.ckpt-12410 \
    --output_directory exported-graphs
