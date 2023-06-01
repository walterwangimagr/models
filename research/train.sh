MODEL_DIR="/models/imagr/trained_models/det_320_320_rgb"
python3 object_detection/model_main.py \
    --logtostderr=true \
    --model_dir=$MODEL_DIR \
    --pipeline_config_path=$MODEL_DIR/pipeline.config
