## Prerequisites
- AWS Account
- ec2 (t2.medium)
- java (jdk17)
- 

## Updating and Upgrading the System
```bash
sudo apt-get update 
sudo apt-get upgrade -y
```

## Check the System Type
```bash
sudo uname -i
```



## 1. Java
```bash
sudo apt install openjdk-17-jre-headless -y
```

## 2. Jenkins
Weekly release
A new release is produced weekly to deliver bug fixes and features to users and plugin developers. It can be installed from the debian apt repository.
```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```
- Enable jenkins service:
When ever server restartt jenkins service will be auto start
```bash
sudo systemctl enable jenkins
```
- login to the jenkins server
Copy public ip and paste in browser with port 8080
```bash
sudo cat /var/jenkins_home/secrets/initialAdminPassword
```
- click Install suggested plugin

## 3. Install docker
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
- To install the latest version, run:
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
- Change user permission
`$USER = current user`
```bash
sudo usermod -aG docker $USER
```

## 4. Install trivy
Check the OS `I am using ubunut`
```bash
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy
```

## 5. Install kubectl
- Download the latest release (refer to the official documentation: Install kubectl on Linux):
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```
- Validate the binary (optional)
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# Validate the kubectl binary against the checksum file:
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# If valid, the output is: 
## kubectl: OK
```
- Install kubectl
```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

### If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:
```bash
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
# and then append (or prepend) ~/.local/bin to $PATH
```

### Test to ensure the version you installed is up-to-date
```bash
kubectl version --client
```


