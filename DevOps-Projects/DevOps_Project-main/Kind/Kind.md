# Installing Kubernetes using kind on Ubuntu

## Prerequisites
- Docker
- kubectl
- kind
- helm
- Custom manifest

1. **Docker**: Ensure Docker is installed and running. If you don’t have Docker, install it with the following commands:

   ```bash
   sudo apt update
   sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   sudo apt update
   sudo apt install -y docker-ce
    ```
### After installation, ensure Docker is running:
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

## 2. kubectl: Install kubectl, the command-line tool for Kubernetes:
```bash
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

## 3. Install kind:
Download the kind binary with the following commands:
```bash
# Download the latest version
curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64

# Make it executable
chmod +x ./kind

# Move it to your PATH
sudo mv ./kind /usr/local/bin/kind
```

- Creating a Cluster

## 1. Create a Cluster:
To create a new Kubernetes cluster with kind, run:
```bash
kind create cluster
```
`This command will set up a cluster with the default configuration.`

## 2. Create a Cluster:
To create a new Kubernetes cluster with kind, run:
```bash
kubectl cluster-info --context kind-kind
```

## 3. Interacting with the Cluster:
To create a new Kubernetes cluster with kind, run:
```bash
kubectl get nodes
```

- Deleting the Cluster
## 1. Deleting the Cluster
When you're finished and want to remove the cluster, run:
```bash
kind delete cluster
```

- Optional: Custom Configuration
If you want to customize your cluster, create a configuration file (e.g., kind-config.yaml):
```bash
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
networking:
  disableDefaultCNI: false
nodes:
  - role: control-plane
```
Then create the cluster with:
```bash
kind create cluster --config kind-config.yaml
```
  
