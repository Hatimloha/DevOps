# Installation Script for Minikube and kubectl on Ubuntu

### This script provides a straightforward method to install Minikube and kubectl on an Ubuntu system. It automates the setup process, ensuring that both Minikube and kubectl are installed and configured correctly.

## Features:

- Minikube Installation: The script downloads and installs the latest version of Minikube, a tool for running Kubernetes clusters locally.
- kubectl Installation: It also installs kubectl, the command-line tool for interacting with Kubernetes clusters.
- Dependency Management: It handles all necessary dependencies and prerequisites, making the setup process smooth and error-free.

```python
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb

sudo dpkg -i minikube_latest_amd64.deb
```

```python
apt-get install docker.io
```

```python
minikube start --driver=docker --force
```

```python
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

chmod +x kubectl

mkdir -p ~/.local/bin

mv ./kubectl ~/.local/bin/kubectl

kubectl version --client

kubectl version --client --output=yaml
```
```python
sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list
```
```python
sudo apt-get update

sudo apt-get install -y kubectl
```

