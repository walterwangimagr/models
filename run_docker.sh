export DATA="/home/walter/git/mobileDet/data/micro_controller/tfrecord"
export TRAINED_MODEL="/home/walter/git/mobileDet/saved_models"
sudo docker run -it --gpus device=0 \
-v $DATA:/models/data/tfrecord \
-v $TRAINED_MODEL:/models/trained_model \
od_tf1 /bin/bash 
