## Prerequisites
- AWS Account
- ec2 (t2.micro)
- docker



## Updating and Upgrading the System
```bash
sudo apt-get update 
sudo apt-get upgrade -y
```

## Check the System Type
```bash
sudo uname -i
```

## 1. Install docker
```bash
sudo apt-get install docker.io -y
```
- Give full permission to user
```bash
sudo usermod -aG docker ubuntu
newgrp docker
```

## 2. Create a nexus container
```bash
docker run -d -p 8081:8081 sonatype/nexus3
```

- check container status:
```bash
docker ps
``` 

## 3. Find nexus password
```bash
docekr exec -it <container-id> /bin/bash
```
- Follow the below steps:
User: admin
copy the password and paste in nexus server `caopy till bash part only`
```bash
ls
cd sonatype-work/
cd nexus3/
car admin.password
```




































