# Create a Ubuntu Ec2/VM

### update the OS 
```shell
sudo apt-get update
sudo apt-get upgrade -y
```
### install the java
```shell
sudo apt install openjdk-17-jre
```

### install Jenkins
#### Go to website and copy the weekly patches for ubuntu
```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```
## Enable Jenkins service
```bash
sudo systemctl enable jenkins
```

## Start Jenkins service
```
sudo systemctl start jenkins
```

## Check servcie is running or not
```
systemctl status jenkins
```

## uncomment require function
- AuthorizedPrincipalsFile none
- PubkeyAuthentication yes
```
sudo vi /etc/ssh/sshd_config
```

##
```
```

##
```
```


