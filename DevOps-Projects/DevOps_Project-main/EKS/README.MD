# Nginx Server on AWS EKS
## Description
This repository contains configurations and scripts to deploy an Nginx server on AWS Elastic Kubernetes Service (EKS).

## Prerequisites
- AWS Account
- ec2 (t2.micro)
- zip
- awscli
- kubectl
- eksctl

## Setup Instructions
1. Clone this repository.
2. Install dependencies.
3. Configure AWS CLI.

## Updating and Upgrading the System
```bash
sudo apt-get update 
sudo apt-get upgrade -y
```

## Check the System Type
```bash
uname -i
```

## 1. Install Zip:
```bash
sudo apt-get install zip -y
```

## 2. Install AWS CLI:
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## Configure AWS CLI:
```bash
# Log in via IAM role (provide admin write access if you're a beginner)
aws configure
```
> You'll be prompted to enter the following:
- AWS Access Key ID [None]: Required
- AWS Secret Access Key [None]: Required
- Default region name [None]: Enter
- Default output format [None]: Enter


## 3. Install kubectl: 
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

## 4. Install eksctl:
To install eksctl, run:
```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
```

- Verify the installation:
```bash
eksctl version
```

- Create an EKS Cluster (it will take 15-30 minute)
```bash
# Change require: <your-region>
# Change require: cluster-name
eksctl create cluster --name my-cluster --region <your-region> --node-type t2.micro --nodes 2
```
- Configure kubectl to Use the New Cluster
```bash
kubectl get svc
```

## 5. Apply the manifest:
- nginx-deployment.yaml
- nginx-service.yaml

Deploy your Nginx server using the following commands:
```bash
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
```

# Check the external IP using below cmd:
```bash
kubectl get svc
```



- To delete the cluster (EKS), replace <your-region> and <cluster-name> with your values:
```bash
# Change require: <your-region>
# Change require: cluster-name
eksctl delete cluster --name my-cluster --region <your-region>
```
