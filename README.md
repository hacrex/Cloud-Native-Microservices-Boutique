# Cloud-Native Microservices Boutique

A portfolio adaptation of [Google Cloud Online Boutique](https://github.com/GoogleCloudPlatform/microservices-demo), retained under the upstream Apache License 2.0. It is a useful reference application for discussing the operational consequences of a multi-service architecture rather than a claim that I authored the complete application.

## What this repository demonstrates

- A multi-language e-commerce application with service boundaries and dependencies.
- Kubernetes manifests, Helm charts, Kustomize components, and a GCP-oriented Terraform path.
- OpenTelemetry-aware deployment patterns and load-generation tooling.
- Practical topics such as service discovery, dependency tracing, rollout safety, and resource isolation.

## How I position it in an interview

I focus on the platform work around the application: how I would validate a Helm release, trace a slow checkout request, define ownership, use Git-based deployment controls, and decide whether a service mesh is worth its operational cost.

## Local and cluster evaluation

Use one native deployment path at a time: `kubernetes-manifests/`, `helm-chart/`, or `terraform/`. The GCP Terraform example needs a real project ID and should be planned in a disposable environment first.

```bash
helm lint helm-chart
kubectl apply --dry-run=server -f kubernetes-manifests/
```

See [`docs/DEPLOYMENT_GUIDE.md`](docs/DEPLOYMENT_GUIDE.md) for validation notes. The historical upstream README is kept in [`docs/UPSTREAM_README.md`](docs/UPSTREAM_README.md).
