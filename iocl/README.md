https://kustomize.io/

```
kubectl logs <podname>
kubectl apply -k ./pricing-tool
kustomize build ~/pricing-tool | kubectl apply -f -
kustomize build ~/pricing-tool/overlays/integration | kubectl apply -f -
```