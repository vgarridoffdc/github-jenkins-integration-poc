# GITHUB - JEKINS - INTEGRATION

## Steps to connect Github with local Jenkin
- Check access to repo `https://github.com/vgarridoffdc/github-jenkins-integration-poc`
- Pull jenkins image https://hub.docker.com/r/jenkins/jenkins -> `docker pull jenkins/jenkins:lts-jdk11`
- Run Jenkins running locally `docker run -p 8080:8080 --name=jenkins-master -d jenkins/jenkins:lts-jdk11`
- Access `http://localhost:8080/` and click on `Install Suggested Plugins` 
- Create an admin user with this info:
  - Username: admin
  - Password: 1234
  - Full Name: Super Local Admin
  - E-mail: your email
- Set Jenkins URL to `http://localhost:8080/` (default value)
- Create a ngrok account (I have linked to my google account)
- Install and setup ngrok `https://dashboard.ngrok.com/get-started/setup` (I will commit the ngrok zip)
- Run ngrok locally aiming to the Jenkins port with `./ngrok http 8080`
- Go to the github repo settings/webhooks
- Create a webhook with this config:
  - Payload URL: https://<check your ngron console forwarding>.ngrok.io/github-webhook/
  - SSL verification: SSL enabled
  - Which events would you like to trigger: Just the push event
  - Active checked
  - Click on create/update webhook
- In the ngrok console you will see a POST request made to /github-webhook/ 
- Generate a deploy ssh key. To do this follow these steps:
  - Open a terminal session inside the jenkins container with `docker exec -it <container-id> bash `
  - Then run `ssh-keygen` and click enter to each question, this should create the ssh key inside `/var/lib/jenkins/.ssh/id_rsa.pub` 
  - Run `cat /var/lib/jenkins/.ssh/id_rsa.pub` to access the ssh key, copy it somewhere
  - Then navigate to your Github repository Settings > Deploy Keys and Add deploy key. Give it a name and paste in the copied key. Enable write access
  - Inside the jenkins terminal run `ssh git@github.com` and accept the connection
  - You should see a confirmation message, this means that you can your local Jenkins can connect with Github

## Setting up a Jenkins Job
- Create a piipeline in your local jenkins:
  - Name: github-integration-pipeline
  - Type: Pipeline
  - `GitHub hook trigger for GITScm polling` enabled
  - Definition: Pipeline script from SCM
  - SCM: Git
  - Repository URL: `https://github.com/vgarridoffdc/github-jenkins-integration-poc`
  - Branch specifier (default value): `*/master`
  - Click on Save
## Some docs
  - How to run and setup Jenkins locally -> https://technology.riotgames.com/news/putting-jenkins-docker-container
