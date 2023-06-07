# Build docker container

```bash
bash build_docker.sh
```

* This docker file clone Imagr Models repo, if you previously cache the docker container and update the repo later, want to build another docker container with the updated repo use 

```bash 
docker build --no-cache -f research/object_detection/dockerfiles/tf1/Dockerfile -t od_tf1 .
```

