## Server

### Prerequisite
- Name: Server
- EC2: t2.medium
- install zip
- install awscli
- install terraform

## Create a key pair
-  Name: DevOps-Shack

## Update the server 
```bash
sudo -i
apt-get update
apt-get upgrade -y
```

## Change the host name
```
vi etc/hostname
# remove everthing from the host file and type "Server"
```

## Restart the server
```bash
sudo init 6
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

## 3. Install terraform
Ensure that your system is up to date and you have installed the gnupg, software-properties-common, and curl packages installed. You will use these packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```
- Install the HashiCorp GPG key.
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```
- Verify the key's fingerprint.
```bash
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```
Add the official HashiCorp repository to your system. The lsb_release -cs command finds the distribution release codename for your current system, such as buster, groovy, or sid.
```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```
- Download the package information from HashiCorp.
```bash
sudo apt update
```
- Install Terraform from the new repository.
```bash
sudo apt-get install terraform
```
- Verify the installation
```bash
terraform -help
```
## 4. Clone the repo
```bash
git clone https://github.com/jaiswaladi246/Blue-Green-Deployment.git
```
- Go inside the git clone folder
```bash
cd Blue-Green-Deployment
```

- Go inside the Cluster folder
```bash
cd Cluster
```
## 5. Terraform
Initialize the Terraform
```bash
terraform init
```
- terraform plan is used to create an execution plan, showing what actions Terraform will take to reach the desired state defined in the configuration files.
```bash
terraform plan
```
- Before `terraform apply` check the region and zone in variables.tf file inside the Cluster folder
It will take 15-20 minute to build infrastructure
```bash
terraform apply --auto-approve
```
## 6. Install kubectl: 
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

- If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:
```bash
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
# and then append (or prepend) ~/.local/bin to $PATH
```

- Test to ensure the version you installed is up-to-date
```bash
kubectl version --client
```

- Connect to the cluster
```bash
aws eks --region ap-south-1 update-kubeconfig --name devopsshack-cluster
```
- check the nodes and pods
```bash
kubectl get nodes
kubectl get pods]
```

## 7. rbac
Creating Service Account
```bash
vi sa.yml
```
copy and paste in file
```bash
apiVersion: v1
kind: ServiceAccount
metadata:
  name: jenkins
  namespace: webapps
```
- Now create a namespace to work the cmd
```bash
kubectl create ns webapp
kubectl apply -f sa.yml
```

- Create role for assigning jenkins user
```bash
vi role.yml
```
Copy and paste 
```bash
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: app-role
  namespace: webapps
rules:
  - apiGroups:
        - ""
        - apps
        - autoscaling
        - batch
        - extensions
        - policy
        - rbac.authorization.k8s.io
    resources:
      - pods
      - secrets
      - componentstatuses
      - configmaps
      - daemonsets
      - deployments
      - events
      - endpoints
      - horizontalpodautoscalers
      - ingress
      - jobs
      - limitranges
      - namespaces
      - nodes
      - pods
      - persistentvolumes
      - persistentvolumeclaims
      - resourcequotas
      - replicasets
      - replicationcontrollers
      - serviceaccounts
      - services
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
```
```bash
kubectl apply -f role.yml
```
- Bind the role to service account
```bash
vi rolebind.yml
```
```bash
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: app-rolebinding
  namespace: webapps 
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: app-role 
subjects:
- namespace: webapps 
  kind: ServiceAccount
  name: jenkins
```
```bash
kubectl apply -f rolebind.yml
```
### Generate token using service account in the namespace
```bash
vi sec.yml
```
```bash
apiVersion: v1
kind: Secret
type: kubernetes.io/service-account-token
metadata:
  name: mysecretname
  annotations:
    kubernetes.io/service-account.name: jenkins
```
```bash
kubectl apply -f sec.yml -n webapps
```
- check the secret is generate or not
```bash
kubectl describe secret mysecretname -n webapps
```
`Steps`
- copy token from output `kubectl describe secret mysecretname -n webapps`
- open jenkins server
- login
- Manage jenkins
- Credential -> system -> Global credential
- craete a new token `name: k8-token`

## 8. install some plugins in jenkins server
http://_________:8080
- plugin names:
`sonarqube scanner`
`config file provider`
`maven intergration`
`Pipeline maven integrations`
`Pipeline stage view`
`docker Pipeline`
`kubernetes`
`kubernetes cli`
`kubernetes client api`
`kubernetes credentials`
- Click on installl

## 9. Create a Pipeline
- I have craete a script with the name `Jenkins-Groovy`
##### Steps
- Dashboard
- craete a pipeline
- Name of pipeline `Blue-Green-Deployment`
- click on pipeline
- Watch video 40:00 minute (https://www.youtube.com/watch?v=tstBG7RC9as&list=PLAdTNzDIZj_9c-o43WJ7yYBa5YEAkWiOv&index=1)

