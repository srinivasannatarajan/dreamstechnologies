# Flask App Docker Challenge

## Description

Simple Python Flask web application containerized with Docker, listening on port 5000.

## Build & Run

### Build the Docker Image

```bash
docker build -t flask-app:latest .
```

### Run the Container

```bash
docker run -d -p 5000:5000 --name flask-app flask-app:latest
```

### Access the Application

```bash
# Web browser
http://localhost:5000

# Health check API
curl http://localhost:5000/api/health

```
