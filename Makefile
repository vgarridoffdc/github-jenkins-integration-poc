# Use getintodevops/jenkins-withdocker as we need to "tweak" the jenkins base image to be able to use docker inside the dockerized jenkins
BUILD_JENKINS_DOCKER_IMAGE:
	@docker build . -t vgarrido/jenkins-with-docker

RUN_JENKINS:
	@docker run \
	--name=jenkins-master \
	--rm \
	-p 8080:8080 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v ~/Volumes/jenkins:/var/jenkins_home \
	vgarrido/jenkins-with-docker

RESTART_JENKINS:
	@docker restart $(shell docker ps --filter "name=jenkins-master" -a --format "{{json .ID}}" |  jq --slurp --raw-output '.[0]')

OPEN_TERMINAL_JENKINS:
	@docker exec -it $(shell docker ps --filter "name=jenkins-master" --format "{{json .ID}}" |  jq --slurp --raw-output '.[0]') bash

RUN_NGROK:
	@./ngrok http 8080