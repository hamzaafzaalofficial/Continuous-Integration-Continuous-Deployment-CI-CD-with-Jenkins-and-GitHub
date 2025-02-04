#your ip goes here
ssh -i ~/.ssh/id_rsa root@167.71.239.120
sudo apt update && sudo apt upgrade -y
# Java is neccesary for jenkins
sudo apt install openjdk-17-jre-headless
java -version
# Jenkins installation goes here
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debianecho "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
-stable/jenkins.io-2023.key
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins 
sudo systemctl status jenkins
#access Jenkin at port http://your-ip-address:8080
#Use the below command for password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# Installing apache2
sudo apt install apache2

# For installing SonarQube, refer to docker setup & then sonarqube setup here in sequence 
# Access the SonarQube at 9000 port
# http://your-ip-address:9000


#steps for Jenkins: 
#1 Manage Jenkins -> Plugins -> Github Integeration plugin install
#2 You can use any git repository you want to use and then copy it's URL in Jenkins when asked in later steps
#3 Setting up your Jenkins FreeStyle Project: 
 # Give a name -> Configure -> Specify Git SCM (means github will be source control) & enter your copied git url -> Specify your path (main or master) 
 # Build Triggers: Select GitHub Hook trigers for SCM 
 # Build Environments: Prepare SonarQube Scanner Environment (Couple to steps before here, you need to add the token of your project in my case it was myproject, you need to go to 
   # sonarqube and then create a project and then after this select locally, and then create a token, use that token and add it in your credentials of jenkins globally,
   # select this over here
 # Build Steps: You can add multiple steps over here, in my case, it was doing sonar qube scanner running(analysis properties) & adding shell commands [ refer to the code in repo]
#4 Build your pipeline and Analyze your code analysis 
