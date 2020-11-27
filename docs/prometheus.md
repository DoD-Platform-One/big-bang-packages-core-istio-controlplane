# Prometheus Configuration

## Background

The fences-bootstrap uses Istio version 1.5.4-distroless.  There is an effort ongoing to update to Istio 1.7.  Prometheus was deployed by default to show key metrics of Istio.  The Prometheus deployment of Istio is for demonstration purposes and should not be used in a production environment, but the metrics shoud be reported in the cluster monitoring suite.

## Considerations

Version 1.5.4-distroless is not an Iron Bank image, but will comply with the the IB standard when the 1.7 configuration is available.  The Istio versions are version sensitive, so it is important to use istioctl version 1.5.4 when working with the generated manifest.

## Monitoring 

The `default` profile of Istio deploys Prometheus.  To disable this the operator.yaml must be edited and a new manifest generated with the applicaiton removed.  The pipeline will need to be restarted to remove the app.  The operator needs to be modified to include the following:
```yaml
addonComponents:
    prometheus:
        enabled: false
```
## Adding the Service Monitor

Istio includes Prometheus Operator ServiceMonitor templates that can be generated using `istioctl manifest generate`. Update your operator.yaml addonComponents with the following and generate:
```yaml
addonComponents:
    prometheusOperator:
        enabled: true
```

The generated manifests will include the ServiceMonitors along with the necessary ClusterRole and ClusterRoleBinding. Here, we've extracted those resources and moved them into a separate Kustomize Component in `integrations/metrics/prometheus/`and modified them to deploy to the `monitoring` namespace and use the standalone Prometheus deployment's ServiceAccount. This way, the ServiceMonitors can be optionally included, and placed in the appropriate sync wave, without needing to perform the generation steps above.

