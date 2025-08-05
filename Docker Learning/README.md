# Dockerfile Language Guide

This document provides an overview of common keywords and instructions in Dockerfiles, along with their explanations and usage.

---

## Dockerfile Keywords and Instructions

### 1. **FROM**
   - **Usage**: `FROM <image>:<tag>`
   - **Description**: Defines the base image for the Docker image. Every Dockerfile must begin with a `FROM` instruction, specifying the base layer for the new image.
   - **Example**: `FROM python:3.9`

### 2. **WORKDIR**
   - **Usage**: `WORKDIR <directory-path>`
   - **Description**: Sets the working directory for subsequent instructions like `COPY`, `RUN`, and `CMD`. If the directory doesn’t exist, Docker creates it.
   - **Example**: `WORKDIR /app`

### 3. **COPY**
   - **Usage**: `COPY <source> <destination>`
   - **Description**: Copies files or directories from the host system into the Docker container’s filesystem.
   - **Example**: `COPY . /app`

### 4. **ADD**
   - **Usage**: `ADD <source> <destination>`
   - **Description**: Similar to `COPY`, but with extra capabilities like decompressing `.tar` files directly into the container.
   - **Example**: `ADD package.tar.gz /app`

### 5. **RUN**
   - **Usage**: `RUN <command>`
   - **Description**: Executes a command in the container during the image build process, often used to install packages or dependencies.
   - **Example**: `RUN apt-get update && apt-get install -y nginx`

### 6. **CMD**
   - **Usage**: `CMD ["executable", "param1", "param2"]`
   - **Description**: Specifies the default command to run when the container starts. Only the last `CMD` instruction in the Dockerfile is used.
   - **Example**: `CMD ["python", "app.py"]`

### 7. **ENTRYPOINT**
   - **Usage**: `ENTRYPOINT ["executable", "param1", "param2"]`
   - **Description**: Configures a container to run as an executable. Often used in combination with `CMD` to provide default arguments.
   - **Example**: `ENTRYPOINT ["nginx", "-g", "daemon off;"]`

### 8. **ENV**
   - **Usage**: `ENV <key> <value>`
   - **Description**: Sets environment variables that can be accessed by processes in the container.
   - **Example**: `ENV PORT=8080`

### 9. **EXPOSE**
   - **Usage**: `EXPOSE <port>`
   - **Description**: Informs Docker that the container will listen on the specified network ports at runtime. It doesn’t publish the port but serves as documentation and metadata.
   - **Example**: `EXPOSE 80`

### 10. **VOLUME**
   - **Usage**: `VOLUME ["<path>"]`
   - **Description**: Creates a mount point with the specified path that will be stored outside of the container’s filesystem, useful for persistent data.
   - **Example**: `VOLUME ["/data"]`

### 11. **ARG**
   - **Usage**: `ARG <name>[=<default value>]`
   - **Description**: Defines a build-time variable that users can pass when building the image. Unlike `ENV`, `ARG` is only available during the build.
   - **Example**: `ARG VERSION=latest`

### 12. **LABEL**
   - **Usage**: `LABEL <key>=<value>`
   - **Description**: Adds metadata to the image in key-value pairs, useful for versioning, licensing, and maintaining other metadata.
   - **Example**: `LABEL maintainer="hatim@example.com"`

### 13. **USER**
   - **Usage**: `USER <username or UID>`
   - **Description**: Specifies the user to use when running the container. This helps run containers with non-root users for added security.
   - **Example**: `USER node`

### 14. **HEALTHCHECK**
   - **Usage**: `HEALTHCHECK [OPTIONS] CMD <command>`
   - **Description**: Monitors and checks the health of a container, running specified commands to ensure it’s functioning properly.
   - **Example**: `HEALTHCHECK CMD curl -f http://localhost || exit 1`

### 15. **ONBUILD**
   - **Usage**: `ONBUILD <INSTRUCTION>`
   - **Description**: Adds a trigger instruction to the image, which is executed when the image is used as a base image in another Dockerfile.
   - **Example**: `ONBUILD RUN echo "Trigger Instruction"`

### 16. **STOPSIGNAL**
   - **Usage**: `STOPSIGNAL <signal>`
   - **Description**: Sets the system call signal to stop the container, like `SIGTERM` or `SIGKILL`.
   - **Example**: `STOPSIGNAL SIGKILL`

### 17. **SHELL**
   - **Usage**: `SHELL ["executable", "parameters"]`
   - **Description**: Specifies the default shell for `RUN` commands on Windows and Linux containers.
   - **Example**: `SHELL ["powershell", "-command"]`

---

## Example Dockerfile

Below is an example Dockerfile that uses some of the above instructions to create a simple Node.js application image.

```dockerfile
# Set the base image
FROM node:14

# Set environment variable
ENV NODE_ENV=production

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy application source code
COPY . .

# Expose application port
EXPOSE 3000

# Default command to run application
CMD ["node", "app.js"]
