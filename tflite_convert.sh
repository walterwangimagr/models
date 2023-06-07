ModelDir="/home/walter/git/mobileDet/saved_models/det_320_320_rgb"
PipelineConfig=$ModelDir"/pipeline.config"
OutputDir=$ModelDir"/export"

sudo chmod -R 777 $OutputDir

tflite_convert \
--enable_v1_converter  \
--output_file="$OutputDir/model.tflite"   \
--graph_def_file="$OutputDir/tflite_graph.pb"   \
--inference_type=QUANTIZED_UINT8   \
--input_arrays="normalized_input_image_tensor"   \
--output_arrays="TFLite_Detection_PostProcess,TFLite_Detection_PostProcess:1,TFLite_Detection_PostProcess:2,TFLite_Detection_PostProcess:3"   \
--mean_values=128   \
--std_dev_values=128   \
--input_shapes=1,320,320,3   \
--change_concat_input_ranges=false   \
--allow_nudging_weights_to_use_fast_gemm_kernel=true   \
--allow_custom_ops

edgetpu_compiler $OutputDir/model.tflite
