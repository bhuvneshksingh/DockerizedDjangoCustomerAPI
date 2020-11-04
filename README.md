To Dockerize a Django Project--

create a file "Dockerfile"
create a file "docker-compose.yml"

create a directory "scripts"
inside "scripts" directory create a file "entrypoint.sh"

to build image inside the docker, run command in the current directory terminal
"docker-compose build" or "docker-compose up --build"


Example of Docker version control command---

docker build -t registry:latest .
docker push registry:latest


docker tag registry:latest registry:2
docker push registry:2

docker tag registry:latest registry:2.6
docker push registry:2.6

docker tag registry:latest registry 2.6.3
docker push registry:2.6.3


Docker commands---

1. docker –version
This command is used to get the currently installed version of docker

2. docker login
This command is used to login to the docker hub repository

3. docker pull
Usage: docker pull <repository-name or registry-name or image-name>:<tag>
This command is used to pull images from the docker repository(hub.docker.com)

4. docker push
usage: docker push <repository name>:<tag>
This command is used to push repository to the docker hub repository

5. docker tag
usage: docker tag <current docker image-name or image-id>:<tag> <your dockerhub username>/<registry-name or repository-name or project-name>:<tag>
This command is used to tag or versioning of repository to the docker hub repository

6. docker commit
Usage: docker commit <conatainer id> <username/imagename>
This command creates a new image of an edited container on the local system

7. docker run
Usage: docker run -it -d <image name>
This command is used to create a container from an image

8. docker images
This command is used to list the images

9. docker ps
This command is used to list the running containers

10. docker ps -a
This command is used to show all the running and exited containers

11. docker exec
Usage: docker exec -it <container id> bash
This command is used to access the running container

12. docker stop
Usage: docker stop <container id>
This command stops a running container

13. docker kill
Usage: docker kill <container id>
This command kills the container by stopping its execution immediately. The difference between ‘docker kill’ and ‘docker stop’ is that ‘docker stop’ gives the container time to shutdown gracefully, in situations when it is taking too much time for getting the container to stop, one can opt to kill it


