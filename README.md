# Cloud-Native Microservices Boutique

This repository tracks the [Google Cloud Online Boutique](https://github.com/GoogleCloudPlatform/microservices-demo) reference application and adds a small deployment overlay for local platform work. The upstream source remains under its Apache 2.0 license; see `NOTICE` and `docs/UPSTREAM_README.md` for attribution and original instructions.

The added overlay lives in `overlays/dev/`. It uses its own namespace, a quota, a frontend HPA, and a development-friendly `NodePort` service. It is deliberately small so changes are easy to review.

## Try the overlay

```bash
./scripts/validate-overlay.sh
kubectl apply -k overlays/dev
kubectl get deploy,svc,hpa,resourcequota -n boutique-portfolio
```

A metrics server is required for the HPA to report CPU utilisation. Use a disposable cluster for load tests, and begin any checkout issue with request rate, error ratio, service endpoints, pod restarts, and a trace before changing replica counts.

## Repository layout

| Path | Purpose |
|---|---|
| `src/` | Upstream microservices and load generator. |
| `kustomize/` | Upstream Kustomize base. |
| `overlays/dev/` | Namespace, quota, HPA, and Service changes maintained here. |
| `helm-chart/` | Upstream Helm chart. |
| `scripts/validate-overlay.sh` | Renders the development overlay before apply. |

The application is not presented as an original product. The useful work here is the deployment overlay and the operational workflow around it.
