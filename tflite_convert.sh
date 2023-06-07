export TRAINED_MODEL="/home/walter/git/mobileDet/saved_models"
sudo docker run -it \
-v $TRAINED_MODEL:/trained_models \
-w /trained_models \
tf2_edgetpu_runtime /bin/bash
