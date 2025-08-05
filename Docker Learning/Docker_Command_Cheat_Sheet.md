# Docker Command Cheat Sheet

### 1. **Docker Images**
- **List Images**: `docker images`
- **Pull an Image**: `docker pull <image_name>:<tag>`
- **Build an Image**: `docker build -t <image_name>:<tag> .`
- **Remove an Image**: `docker rmi <image_id>`
- **Inspect Image**: `docker inspect <image_id>`
- **Tag Image**: `docker tag <source_image>:<tag> <target_image>:<tag>`
- **Push Image to Repository**: `docker push <repository_name>/<image_name>:<tag>`

### 2. **Docker Containers**
- **List All Containers**: `docker ps -a`
- **List Running Containers**: `docker ps`
- **Start a Container**: `docker start <container_id>`
- **Stop a Container**: `docker stop <container_id>`
- **Restart a Container**: `docker restart <container_id>`
- **Remove a Container**: `docker rm <container_id>`
- **Run a New Container**: `docker run -d --name <container_name> <image_name>`
- **Run Container with Port Mapping**: `docker run -d -p <host_port>:<container_port> <image_name>`
- **Run Container in Interactive Mode**: `docker run -it <image_name> /bin/bash`
- **Attach to a Running Container**: `docker attach <container_id>`
- **View Container Logs**: `docker logs <container_id>`
- **Copy Files from Container**: `docker cp <container_id>:/path/in/container /host/path`
- **Rename a Container**: `docker rename <old_name> <new_name>`

### 3. **Docker Volumes**
- **Create a Volume**: `docker volume create <volume_name>`
- **List Volumes**: `docker volume ls`
- **Remove a Volume**: `docker volume rm <volume_name>`
- **Inspect a Volume**: `docker volume inspect <volume_name>`
- **Use a Volume with a Container**: `docker run -v <volume_name>:/path/in/container <image_name>`

### 4. **Docker Networking**
- **List Networks**: `docker network ls`
- **Create a Network**: `docker network create <network_name>`
- **Remove a Network**: `docker network rm <network_name>`
- **Inspect a Network**: `docker network inspect <network_name>`
- **Connect a Container to a Network**: `docker network connect <network_name> <container_id>`
- **Disconnect a Container from a Network**: `docker network disconnect <network_name> <container_id>`

### 5. **Docker Compose**
- **Start Services**: `docker-compose up`
- **Start Services in Detached Mode**: `docker-compose up -d`
- **Stop Services**: `docker-compose down`
- **Build or Rebuild Services**: `docker-compose build`
- **View Service Logs**: `docker-compose logs`
- **List Services**: `docker-compose ps`
- **Remove Services and Volumes**: `docker-compose down -v`
- **Scale Services**: `docker-compose scale <service_name>=<count>`

### 6. **Docker System Maintenance**
- **View System Info**: `docker info`
- **Prune Unused Resources**: `docker system prune`
- **Prune Unused Volumes**: `docker volume prune`
- **Prune Unused Networks**: `docker network prune`
- **Prune Unused Images**: `docker image prune`
- **Prune Unused Containers**: `docker container prune`
- **Disk Usage**: `docker system df`

---
