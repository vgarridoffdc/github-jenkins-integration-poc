
PULL_JENKINS_DOCKER_IMAGE:
	@docker pull jenkins/jenkins:lts-jdk11

RUN_JENKINS:
	@docker run -p 8080:8080 --name=jenkins-master -v ~/Volumes/jenkins:/var/jenkins_home jenkins/jenkins:lts-jdk11

RESTART_JENKINS:
	@docker restart $(shell docker ps --filter "name=jenkins-master" -a --format "{{json .ID}}" |  jq --slurp --raw-output '.[0]')

OPEN_TERMINAL_JENKINS:
	@docker exec -it $(shell docker ps --filter "name=jenkins-master" --format "{{json .ID}}" |  jq --slurp --raw-output '.[0]') bash

RUN_NGROK:
	@./ngrok http 8080