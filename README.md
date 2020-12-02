# Scaling Requests to Queryable Apache Kafka Topics with nginx

This repository contains the code for our blog post [Scaling Requests to
Queryable Apache Kafka Topics with nginx](https://medium.com/bakdata/scaling-requests-to-queryable-kafka-topics-with-nginx-957bb3a9c532).

It includes the custom routing logic for nginx, the wrk benchmark script
, and the Kubernetes manifests.

## Quick Start
The Kafka Streams application requires an existing Kafka deployment (e.g.
[Confluent Helm Charts](https://github.com/confluentinc/cp-helm-charts)).
You can run `kubectl apply -f k8s/` to deploy all resources.







