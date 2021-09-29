
PULL_JENKINS_DOCKER_IMAGE:
	@docker pull jenkins/jenkins:lts-jdk11

RUN_JENKINS_LOCALLY:
	@docker run -p 8080:8080 --name=jenkins-master jenkins/jenkins:lts-jdk11