# Docker Challenges

This directory contains the Dockerfile challenges.

## Challenges Overview

### 1. Flask App (Simple Web App)

**Directory**: `flask-app/`

A Python Flask web application containerized with Docker.

**Quick Start**:

```bash
cd flask-app
docker build -t flask-app:latest .
docker run -d -p 5000:5000 --name flask-app flask-app:latest
# Access: http://localhost:5000
```

---

### 2. Nginx Static Site

**Directory**: `nginx-static/`

Static HTML website served by Nginx in an Alpine-based container.

**Quick Start**:

```bash
cd nginx-static
docker build -t nginx-static:latest .
docker run -d -p 8080:80 --name nginx-static nginx-static:latest
# Access: http://localhost:8080
```

---

### 3. Node.js Multi-Stage Build

**Directory**: `nodejs-multistage/`

Demonstrates Docker multi-stage builds: build in Node.js stage, serve with Nginx.

**Quick Start**:

```bash
cd nodejs-multistage
docker build -t nodejs-multistage:latest .
docker run -d -p 3000:80 --name nodejs-app nodejs-multistage:latest
# Access: http://localhost:3000
```

---

## Common Docker Commands

### Building Images

```bash
# Build with tag
docker build -t <image-name>:<tag> .

# Build without cache
docker build --no-cache -t <image-name> .

# View build history
docker history <image-name>
```

### Running Containers

```bash
# Run in detached mode
docker run -d -p <host-port>:<container-port> --name <container-name> <image-name>

# Run with environment variables
docker run -d -e KEY=value <image-name>

# Run with volume mount
docker run -d -v /host/path:/container/path <image-name>
```

### Container Management

```bash
# List running containers
docker ps

# List all containers
docker ps -a

# View logs
docker logs <container-name>

# Follow logs
docker logs -f <container-name>

# Execute command in container
docker exec -it <container-name> sh

# Stop container
docker stop <container-name>

# Remove container
docker rm <container-name>
```

### Image Management

```bash
# List images
docker images

# Remove image
docker rmi <image-name>

# Remove unused images
docker image prune

# Tag image
docker tag <source-image> <target-image>

# Push to registry
docker push <image-name>
```

### Cleanup Commands

```bash
# Remove all stopped containers
docker container prune

# Remove all unused images
docker image prune -a

# Remove all unused volumes
docker volume prune

# Complete cleanup
docker system prune -a
```

---

## Running All Applications

### Terminal 1: Flask App

```bash
cd flask-app
docker build -t flask-app .
docker run -d -p 5000:5000 --name flask-app flask-app
```

### Terminal 2: Nginx Static

```bash
cd nginx-static
docker build -t nginx-static .
docker run -d -p 8080:80 --name nginx-static nginx-static
```

### Terminal 3: Node.js Multi-Stage

```bash
cd nodejs-multistage
docker build -t nodejs-multistage .
docker run -d -p 3000:80 --name nodejs-app nodejs-multistage
```

### Access Applications

- Flask App: http://localhost:5000
- Nginx Static: http://localhost:8080
- Node.js App: http://localhost:3000

---

## Docker Compose

Create a `docker-compose.yml` in the docker directory to run all apps:

```yaml
version: "3.8"

services:
  flask-app:
    build: ./flask-app
    ports:
      - "5000:5000"
    container_name: flask-app

  nginx-static:
    build: ./nginx-static
    ports:
      - "8080:80"
    container_name: nginx-static

  nodejs-app:
    build: ./nodejs-multistage
    ports:
      - "3000:80"
    container_name: nodejs-app
```

Run all applications:

```bash
docker-compose up -d
```

Stop all applications:

```bash
docker-compose down
```

---

## Best Practices Demonstrated

1. **Multi-stage builds** - Reduces final image size
2. **Alpine base images** - Minimal, secure base
3. **Health checks** - Container health monitoring
4. **Security headers** - Web security best practices
5. **Gzip compression** - Performance optimization
6. **.dockerignore** - Build optimization
7. **Non-root users** - Security hardening
8. **Layer optimization** - Efficient caching

---

## Troubleshooting

### Port Already in Use

```bash
# Find process using port
netstat -ano | findstr :<port>  # Windows
lsof -i :<port>                 # Linux/Mac

# Use different port
docker run -p 5001:5000 <image>
```

### Container Won't Start

```bash
# Check logs
docker logs <container-name>

# Inspect container
docker inspect <container-name>

# Check container status
docker ps -a
```

### Build Failures

```bash
# Build with verbose output
docker build --progress=plain .

# Check Dockerfile syntax
docker build --no-cache .
```
