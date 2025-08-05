## 1. check available images.  

```python
Docker images
```

## 2. command is used to search for Docker images on Docker Hub or other container registries. It allows you to find images based on keywords or specific criteria, such as the image name, description, or official status.

```python
docker search <search image name>
```

## 3. Use to pull image from dockerhub private-public. 

```python
docker pull <jenkins/jenkins>
```

## 4. Used to create and start image and make it container. 

```python
docker run –it –name <container name> <image name> /bin/bash
```
 -   -it : I (interact mode) t (terminal): it help in go inside container while creating.
 -   --name: it is used to give name to the image while running. 

## 5. Used to check service are working or not. 

```python
service docker status
```

## 6. Used to start docker engine service.

```python
service docker start
```

## 7. Used to start image and make it container.

```python
docker start <image name>
```

## 8. Go inside the running container without creating new process. 

```python
docker attached <container name>
```

## 9. Go inside the container with new process.  

```python
docker exec  -it <container name>
    E.g: docker exec -it 3e44af33ac25 bash
```
 
## 10. Used to check running and non-running container.

```python
docker ps –a 
```

## 11. It will show only running container.

```python
docker ps
```

## 12. To stop container.

```python
docker stop <container name>
```

## 13. Use to remove container.  

```python
docker rm <container name>: 
```

## 14. To check version and docker install or not. 

```python
docker –v / which docker
```
## 15. Same as service docker status cmd. 
```python
docker info 
```

## 16. Used to exit from container. 
```python
exit
```

## 17. Use to expose container port so you access it through public and private ip with custom port.

```python
docker run –it -p <8080:8080> –name <container name> <image name>
```

# Mass action command in docker 

## 1. Used to stop all running container a once 

```python
docker stop $
```

## 2. Used to remove all stop docker 

```python
docker rm $
```

## 3. Used to delete all images 

```python
docker rmi –f $
```

# Puss and Pull docker image.

## 1. Push image to dockerhub public-private.

```python
docker push <image name> <docker-id>/<custom image name you want to upload with>
```

## 2. Pull image to dockerhub public-private.

```python
docker pull <image name> 
docker pull <image name> <docker-id>/<custom image name you want to download with>
```


