# Portfolio Exercise: Safe Boutique Deployment and Checkout Diagnosis

This exercise adds a portfolio-owned Kustomize overlay without changing the upstream application source. It provides an isolated namespace, a resource quota, a development-friendly `NodePort` frontend service, and a CPU-based HPA for the frontend.

## Render before applying

```bash
./scripts/validate-portfolio-overlay.sh
kubectl kustomize portfolio/overlays/dev | less
```

## Apply in a disposable cluster

```bash
kubectl apply -k portfolio/overlays/dev
kubectl get deploy,svc,hpa,resourcequota -n boutique-portfolio
```

The HPA requires a working metrics server. If metrics are unavailable, that is a cluster prerequisite failure, not an application failure.

## Controlled diagnosis scenario

Use the upstream load generator only in a disposable environment. If checkout latency rises, inspect request rate and error ratio first, then follow a representative trace to determine whether the frontend, cart, payment, shipping, or another dependency is the limiting component. Compare CPU, memory, pod restarts, service endpoints, and retry/timeout behaviour before changing replica counts.

## What this does not prove

The overlay does not create a production service mesh, external ingress, persistent data service, or real payment flow. It is a small, reviewable platform exercise designed to show namespace isolation, resource guardrails, and deployment validation.
