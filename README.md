# Build docker container

```bash
bash build_docker.sh
```

* This docker file clone Imagr Models repo, if you previously cache the docker container and update the repo later, want to build another docker container with the updated repo use 

```bash 
docker build --no-cache -f research/object_detection/dockerfiles/tf1/Dockerfile -t od_tf1 .
```



# Pipeline config 

* Create a dir to save all the training output, checkpoint, export model, etc. 
  * eg. my model dir path: `~/git/mobileDet/saved_models/det_320_320_rgb`

![image-20230608105604070](/home/walter/git/imagr/models/README.assets/image-20230608105604070.png)

* Only need to mount your tfrecord to `/models/data/tfrecord`
* Store the pipeline config in model dir 

# Run docker container 

`run_docker.sh`

```bash
export DATA="/home/walter/git/mobileDet/data/micro_controller/tfrecord"
export TRAINED_MODEL="/home/walter/git/mobileDet/saved_models"
sudo docker run -it --gpus device=0 \
-v $DATA:/models/data/tfrecord \
-v $TRAINED_MODEL:/models/trained_models \
od_tf1 /bin/bash
```

mount the tfrecord to the `/models/data/tfrecord`

mount the model dir `~/git/mobileDet/saved_models/det_320_320_rgb`  to `/models/trained_models`

**Run docker container **

```bash 
bash run_docker.sh
```



# Start training 

after runing the docker 

vim the train_and_export.sh

![image-20230608110059740](/home/walter/git/imagr/models/README.assets/image-20230608110059740.png)

Change the MODEL_DIR

and start training 



