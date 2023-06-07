export MODEL_DIR="/models/trained_models/det_320_320_rgb"
export PIPELINE_CONFIG=$MODEL_DIR"/pipeline.config"
export OUTPUT_DIR=$MODEL_DIR"/export"

python3 object_detection/model_main.py \
    --logtostderr=true \
    --model_dir=$MODEL_DIR \
    --pipeline_config_path=$PIPELINE_CONFIG

export LAST_CHECKPOINT=$MODEL_DIR/$(awk 'NR==1 && gsub("\"", "", $2) { print $2}' $MODEL_DIR/checkpoint)

python3 object_detection/export_tflite_ssd_graph.py \
  --pipeline_config_path=$PIPELINE_CONFIG \
  --trained_checkpoint_prefix=$LAST_CHECKPOINT \
  --output_directory=$OUTPUT_DIR \
  --config_override " \
      model{ \
        ssd{ \
          post_processing { \
            batch_non_max_suppression { \
              score_threshold: 0.5 \
              iou_threshold: 0.2 \
            } \
          } \
        } \
      } \
  " \
  --add_postprocessing_op=true
