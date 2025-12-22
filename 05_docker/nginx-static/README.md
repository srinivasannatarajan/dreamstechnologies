# Nginx Static Site Docker Challenge

## Description

Nginx web server serving static HTML content in a Docker container.

## Build & Run

### Build the Docker Image

```bash
docker build -t nginx-static:latest .
```

### Run the Container

```bash
docker run -d -p 8080:80 --name nginx-static nginx-static:latest
```

### Access the Website

```bash
# Web browser
http://localhost:8080

# Health check
curl http://localhost:8080/health
```
