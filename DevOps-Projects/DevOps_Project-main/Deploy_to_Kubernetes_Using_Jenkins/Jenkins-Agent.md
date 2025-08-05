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

## install docker 
```
sudo apt-get install docker.io
```

## Give full write to current user
```
sudo usermod -aG docker $USERsudo usermod -aG docker $USER
sudo usermod -aG docker $USER
```

## uncomment require function
- AuthorizedPrincipalsFile none
- PubkeyAuthentication yes
```
sudo vi /etc/ssh/sshd_config
```
## Reload sshd service
```bash
sudo service sshd reload
```

## Generate keys
```bash
ssh-keygen -t ed25519
```
