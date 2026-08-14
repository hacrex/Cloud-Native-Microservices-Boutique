# Project Status

## Portfolio Scope

A portfolio adaptation of the Google Online Boutique cloud-native microservices reference application. It demonstrates multi-service deployment, Helm, Kubernetes, OpenTelemetry, and GCP-focused infrastructure patterns.

## Intended Deployment Path

Use the upstream `kubernetes-manifests/`, `helm-chart/`, and `terraform/` paths. Supply a valid GCP project ID and a disposable test environment.

## Safety and Validation

This repository contains **non-production reference configuration** unless its deployment guide explicitly states otherwise. Review every Terraform plan and Kubernetes manifest in an isolated account, project, subscription, compartment, or cluster before use. Do not commit credentials, cloud access keys, API tokens, or live state files.

## What to Discuss in an Interview

Explain the architecture, the operational trade-offs, how you would validate a change, how you would roll it back, and the parts that require organisation-specific configuration.
