#!/bin/sh

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install prometheus-operator prometheus-community/kube-prometheus-stack --set prometheus-node-exporter.hostRootFsMount.enabled=false
helm upgrade --install my-prometheus-adapter prometheus-community/prometheus-adapter
