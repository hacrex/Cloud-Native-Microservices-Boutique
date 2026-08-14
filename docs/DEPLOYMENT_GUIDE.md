# Deployment Guide

## Supported Paths

Use one of the repository's native deployment paths rather than generic sample manifests:

- `kubernetes-manifests/` for the published Kubernetes manifest bundle.
- `helm-chart/` for Helm-based configuration.
- `terraform/` for the included GCP infrastructure example.

## Validation

```bash
helm lint helm-chart
kubectl apply --dry-run=server -f kubernetes-manifests/
cd terraform && terraform fmt -check -recursive && terraform init && terraform validate
```

Set `gcp_project_id` in a local `terraform.tfvars` file before planning. Do not commit the configured file if it contains organisation-specific identifiers or secrets.
