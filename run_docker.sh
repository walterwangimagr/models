DATA="/home/walter/git/mobileDet/data/micro_controller/tfrecord"
sudo docker run -u $(id -u):$(id -g) -it --gpus device=3 -v $DATA:/models/data/tfrecord od_tf1  /bin/bash
