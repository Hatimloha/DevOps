# Step to deploy the Fortinet firewall in Docker

## Sign in the Fortinet support portal
You can download the FortiGate VM QCOW2 image from the official Fortinet Support Portal. Here’s how:

### Step 1: Register for a Fortinet Account
```bash
Go to Fortinet Support Portal
Click "Create an Account" (if you don’t have one).
Complete the registration and verify your email.
Step 2: Download the FortiGate VM Image
Login to Fortinet Support.
Navigate to:
Download > VM Images
Select FortiGate and choose the version you need.
In the platform list, select KVM (which provides a .qcow2 image).
Click Download.
Step 3: Extract the QCOW2 Image
Once downloaded, extract the .zip file to get the fortios.qcow2 file.
```
```bash
unzip FortiGate-VM64-KVM.zip
mv fortios.qcow2 fortigate.qcow2
```
### Step 2: install Ubuntu
- Cloud (AWS, Azure, GCP)
- WSL (windows)
- Mac

### Step3: Docker installation:
```bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install docker.io
```
### Step 4: Clone the repo:
```bash
git clone <repo url>
```
### Step 5: Build the Docker Image:
```bash
docker build -t fortigate .
```
### Run the FortiGate Firewall in Docker:
```bash
docker run --name fortigate -d --privileged -p 8443:443 -p 2222:22 fortigate
```
### Access the FortiGate GUI:
```bash
https://localhost:8443
```

### Common Issues & Fixes
- Manually Start QEMU Inside the Container
> If the error is related to QEMU, try running it inside the container:
```bash
docker exec -it fortigate bash
```
- Once inside the container, manually start QEMU:
```bash
qemu-system-x86_64 -m 1024 -smp 2 -drive file=/opt/fortigate.qcow2,format=qcow2 -netdev user,id=net0,hostfwd=tcp::8443-:443,hostfwd=tcp::2222-:22 -device e1000,netdev=net0 -nographic
```
