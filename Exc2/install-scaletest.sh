#!/bin/sh
helm upgrade --install scaletest --namespace default --values  ./scaletest/values.yaml ./scaletest
#helm install prometheus-adapter prometheus-community/prometheus-adapter -f ./scaletest/values.yaml
