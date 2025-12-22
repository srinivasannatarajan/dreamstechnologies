# Kubernetes Challenges

This directory contains three Kubernetes manifests demonstrating container orchestration concepts.

---

## Prerequisites

### Local Kubernetes Setup

**Docker Desktop**

```bash
# Enable Kubernetes in Docker Desktop settings
# Settings > Kubernetes > Enable Kubernetes

# Verify
kubectl cluster-info
kubectl get nodes

# Set kubectl config context in your commandline for the local cluster
```

### 1. Deploy a Pod (nginx-pod.yaml)

**Description**: Basic pod deployment running nginx:latest with port 80 exposed.

**Deploy**:

```bash
# Create the pod
kubectl apply -f nginx-pod.yaml

# Check pod status
kubectl get pods nginx-pod

# Describe pod
kubectl describe pod nginx-pod

# View logs
kubectl logs nginx-pod

# Port forward to access locally
kubectl port-forward pod/nginx-pod 8080:80
# Access: http://localhost:8080
```

---

### 2. ConfigMap Usage (configmap-pod.yaml)

**Description**: Pod with ConfigMap mounted as environment variables.

**Deploy**:

```bash
# Create ConfigMap and Pod
kubectl apply -f configmap-pod.yaml

# View ConfigMap
kubectl get configmap app-config
kubectl describe configmap app-config

# Check pod
kubectl get pod configmap-pod

# View environment variables in pod
kubectl exec configmap-pod -- env | grep APP

# Port forward to access
kubectl port-forward pod/configmap-pod 8081:80
# Access: http://localhost:8081
```

---

### 3. Deployment + Service (deployment-service.yaml)

**Description**: Deployment with 2 replicas and ClusterIP service.

**Deploy**:

```bash
# Create Deployment and Service
kubectl apply -f deployment-service.yaml

# Check deployment
kubectl get deployment nginx-deployment

# Check replica sets
kubectl get replicaset

# Check pods
kubectl get pods -l app=nginx

# Check service
kubectl get service nginx-service

# Describe service
kubectl describe service nginx-service
```

**Access the Service**:

```bash
# Port forward to service
kubectl port-forward service/nginx-service 8082:80
# Access: http://localhost:8082

```

---

### Access in browser:

- Nginx Pod: http://localhost:8080
- ConfigMap Pod: http://localhost:8081
- Nginx Service: http://localhost:8082

### Cleanup All

```bash
kubectl delete -f nginx-pod.yaml
kubectl delete -f configmap-pod.yaml
kubectl delete -f deployment-service.yaml

# Verify cleanup
kubectl get all
```
