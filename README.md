# GITHUB - JEKINS - INTEGRATION

## Requirements

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

## Some docs
  - How to run and setup Jenkins locally -> https://technology.riotgames.com/news/putting-jenkins-docker-container
