# Scaling Requests to Queryable Apache Kafka Topics with nginx

This repository contains the code for our blog post [Scaling Requests to
Queryable Apache Kafka Topics with nginx]().

It includes the custom routing logic for nginx, the wrk benchmark script
, and the Kubernetes manifests.

## Quick Start
The Kafka Streams application requires an existing Kafka deployment (e.g.
[Confluent Helm Charts](https://github.com/confluentinc/cp-helm-charts)).
You can run `kubectl apply -f k8s/` to deploy all resources.







