# Node.js Multi-Stage Docker Build

## Description

Demonstrates Docker multi-stage builds by building a Node.js application in one stage and serving it with Nginx in the production stage.

## Build & Run

### Build the Docker Image

```bash
docker build -t nodejs-multistage:latest .
```

### Run the Container

```bash
docker run -d -p 3000:80 --name nodejs-app nodejs-multistage:latest
```

### Access the Application

```bash
# Web browser
http://localhost:3000

# Health check
curl http://localhost:3000/health
```
