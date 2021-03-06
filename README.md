# GITHUB - JEKINS - INTEGRATION

## Steps to connect Github with local Jenkin

- Check access to repo `https://github.com/vgarridoffdc/github-jenkins-integration-poc`
- Pull jenkins image https://hub.docker.com/r/jenkins/jenkins -> `make BUILD_JENKINS_DOCKER_IMAGE`
  - we need to create a custom image to include docker as a dependency inside Jenkins, without this any job using docker will fail as it will be unable to execute docker
- Create the folder `~/Volumes/jenkins` to use it as volume for the jenkins container
- Run Jenkins running locally `make RUN_JENKINS`
- Check the terminal output, you should see a generated by Jenkins. You can find it if you search `Please use the following password to proceed to installation`.
- Access `http://localhost:8080/` , paste the password and click on `Install Suggested Plugins` 
- Create an admin user with this info:
  - Username: admin
  - Password: 1234
  - Full Name: Super Local Admin
  - E-mail: your email
- Set Jenkins URL to `http://localhost:8080/` (default value)
- Install the `Job and Stage monitoring` and `GitHub Branch Source` plugins
- Create a ngrok account (I have linked to my google account)
- Install and setup ngrok `https://dashboard.ngrok.com/get-started/setup` (I will commit the ngrok zip)
- Run ngrok locally aiming to the Jenkins port with `./ngrok http 8080`
- Follow steps defined in: https://www.linkedin.com/pulse/integrating-github-webhooks-jenkins-automate-unit-becerril-dom%C3%ADnguez/
  - **IMPORTANT** You will need to create a multi pipeline jenkins jobs with the same credentials used in the previous link, the normal pipeline or freestyle job have not being tested
  - When creating the github personal token you need to provide enough access, I think that at least you need to check all the permissions regarding the "repo" category, maybe some more.
  - Remember that the github username doesn't include your email domain (@financialforce.com)
  
## Notes

- The github webhook content type format should be **application/json**