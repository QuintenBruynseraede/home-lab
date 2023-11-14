#!/bin/sh -e

echo "Creating argocd namespace"
kubectl create namespace argocd
echo "Installing argocd from https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "Creating portforward on localhost:443"
kubectl port-forward -n argocd deployment/argocd-server 8080:8080 &
echo "Done. Press Ctrl+C to return."
