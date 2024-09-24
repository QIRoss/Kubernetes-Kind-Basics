# Kubernetes (Kind - Kubernetes in Docker) Basic

Kubernetes Basic Setup for FastAPI Application

This documentation outlines how to set up a FastAPI application in a Kubernetes cluster using Docker. The FastAPI app returns the IP address of the Kubernetes pod it's running on.

Prerequisites
Make sure you have the following installed:

Docker
Kubernetes (kubectl)
A Kubernetes cluster (can use Kind, Minikube, or any cloud provider)
(Optional) Docker Hub account for pushing Docker images

Create a Kubernetes Cluster Using Kind
```
kind create cluster --name fastapi-cluster
```

Build the Docker Image:
```
docker build -t fastapi-instance .
docker tag fastapi-instance qiross/fastapi-instance:latest
docker push qiross/fastapi-instance:latest
```

Deploy to Kubernetes:
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

List pods and services:
```
kubectl get pods
kubectl get services
```

Port Forward the Service:
```
kubectl port-forward service/fastapi-service 30007:80
```

Test the Application:
```
curl http://localhost:30007
```

Restart Deployment (For Updates):
```
kubectl rollout restart deployment fastapi-deployment
```

Clean up:
```
kubectl delete -f deployment.yaml
kubectl delete -f service.yaml
```

Delete Deployment:
```
kubectl delete deployment fastapi-deployment
```

Delete Cluster:
```
kind delete cluster --name fastapi-cluster
```