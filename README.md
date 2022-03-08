# istio

![Version: 1.13.1-bb.1](https://img.shields.io/badge/Version-1.13.1--bb.1-informational?style=flat-square) ![AppVersion: 1.13.1](https://img.shields.io/badge/AppVersion-1.13.1-informational?style=flat-square)

Configurable Deployment of Istio Custom Resources Wrapped Inside a Helm Chart.

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install istio chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| profile | string | `"default"` | The istio profile to use |
| hub | string | `"registry1.dso.mil/ironbank/opensource/istio"` | The hub to use for all images, images are built as ".Values.hub/<component>:.Values.tag" |
| tag | string | `"1.13.1"` | The tag to use for all images |
| domain | string | `"bigbang.dev"` | The domain to use for the default gateway |
| revision | string | `""` | Revision of the Istio control plane |
| openshift | bool | `false` | Openshift feature switch toggle |
| imagePullSecrets | list | `[]` | Pull secrets for images |
| monitoring | object | `{"enabled":false}` | Big Bang Monitoring interaction controls |
| monitoring.enabled | bool | `false` | Toggle monitoring on/off (controls networkPolicies) |
| authservice | object | `{"enabled":false}` | If authservice is enabled, it will be added to extension providers as an external authorization system. https://istio.io/latest/docs/tasks/security/authorization/authz-custom/ |
| ingressGateways | object | `{"istio-ingressgateway":{"enabled":true,"extraLabels":{},"k8s":{"affinity":{},"nodeSelector":{},"podAnnotations":{},"resources":{},"service":{"type":"LoadBalancer"},"serviceAnnotations":{},"tolerations":[]}}}` | Ingress gateways, The following items are automatically set for every ingress gateway: - label: "app: {name of ingress gateway}" |
| ingressGateways.istio-ingressgateway | object | `{"enabled":true,"extraLabels":{},"k8s":{"affinity":{},"nodeSelector":{},"podAnnotations":{},"resources":{},"service":{"type":"LoadBalancer"},"serviceAnnotations":{},"tolerations":[]}}` | This key becomes the name of the ingressGateway |
| ingressGateways.istio-ingressgateway.extraLabels | object | `{}` | Labels to use for selecting the ingress gateway from the service Automatic labels: 'app: {ingress gateway name}' and `istio: ingressgateway` |
| ingressGateways.istio-ingressgateway.k8s | object | `{"affinity":{},"nodeSelector":{},"podAnnotations":{},"resources":{},"service":{"type":"LoadBalancer"},"serviceAnnotations":{},"tolerations":[]}` | Set any value from https://istio.io/latest/docs/reference/config/istio.operator.v1alpha1/#KubernetesResourcesSpec |
| ingressGateways.istio-ingressgateway.k8s.service.type | string | `"LoadBalancer"` | "LoadBalancer" or "NodePort" |
| ingressGateways.istio-ingressgateway.k8s.podAnnotations | object | `{}` | https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| ingressGateways.istio-ingressgateway.k8s.serviceAnnotations | object | `{}` | https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| ingressGateways.istio-ingressgateway.k8s.nodeSelector | object | `{}` | https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector |
| ingressGateways.istio-ingressgateway.k8s.affinity | object | `{}` | https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity |
| ingressGateways.istio-ingressgateway.k8s.tolerations | list | `[]` | https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| gateways | object | `{"main":{"autoHttpRedirect":{"enabled":true},"selector":{"app":"istio-ingressgateway"},"servers":[{"hosts":["*.{{ .Values.domain }}"],"port":{"name":"https","number":8443,"protocol":"HTTPS"},"tls":{"credentialName":"wildcard-cert","mode":"SIMPLE"}}]}}` | See https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway for spec |
| gateways.main | object | `{"autoHttpRedirect":{"enabled":true},"selector":{"app":"istio-ingressgateway"},"servers":[{"hosts":["*.{{ .Values.domain }}"],"port":{"name":"https","number":8443,"protocol":"HTTPS"},"tls":{"credentialName":"wildcard-cert","mode":"SIMPLE"}}]}` | This key becomes the name of the gateway |
| gateways.main.autoHttpRedirect | object | `{"enabled":true}` | Controls default HTTP/8080 server entry with HTTP to HTTPS Redirect. Must add in HTTP server config if disabling. |
| istiod | object | `{"affinity":{},"hpaSpec":{"maxReplicas":3,"metrics":[{"resource":{"name":"cpu","targetAverageUtilization":60},"type":"Resource"}],"minReplicas":1},"nodeSelector":{},"podAnnotations":{},"replicaCount":1,"resources":{"limits":{"cpu":"500m","memory":"2Gi"},"requests":{"cpu":"500m","memory":"2Gi"}},"serviceAnnotations":{},"strategy":{},"tolerations":[]}` | istiod / pilot configuration |
| istiod.podAnnotations | object | `{}` | k8s pod annotations. https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| istiod.serviceAnnotations | object | `{}` | k8s service annotations. https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| istiod.nodeSelector | object | `{}` | k8s nodeSelector. https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector |
| istiod.affinity | object | `{}` | k8s affinity / anti-affinity. https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity |
| istiod.tolerations | list | `[]` | k8s toleration https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| tracing.enabled | bool | `false` |  |
| tracing.address | string | `"jaeger-collector.jaeger.svc"` |  |
| tracing.port | int | `9411` |  |
| tracing.sampling | int | `10` | percent of traces to send to jaeger |
| cni.image.hub | string | `"registry1.dso.mil/ironbank/opensource/istio"` |  |
| cni.image.name | string | `"install-cni"` |  |
| cni.image.tag | string | `"1.13.1"` |  |
| cni.podAnnotations | object | `{}` | k8s pod annotations. https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| cni.nodeSelector | object | `{}` | k8s nodeSelector. https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector |
| cni.affinity | object | `{}` | k8s affinity / anti-affinity. https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity |
| cni.tolerations | list | `[]` | k8s toleration https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| meshConfig | object | `{}` |  |
| values.global | object | `{"proxy":{"resources":{"limits":{"cpu":"100m","memory":"256Mi"},"requests":{"cpu":"100m","memory":"256Mi"}}},"proxy_init":{"resources":{"limits":{"cpu":"100m","memory":"256Mi"},"requests":{"cpu":"100m","memory":"256Mi"}}}}` | Global IstioOperator values |
| values.defaultRevision | string | `"default"` | Set defaultRevision name, must be non-empty to deploy validating webhook |
| networkPolicies | object | `{"controlPlaneCidr":"0.0.0.0/0","enabled":false}` | Big Bang NetworkPolicy controls |
| networkPolicies.enabled | bool | `false` | Toggle ALL NetworkPolicies on/off |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` | See `kubectl cluster-info` and then resolve to IP |
| postInstallHook | object | `{"image":"registry1.dso.mil/ironbank/big-bang/base:1.0.0"}` | Big Bang postInstall "readiness" controls |
| postInstallHook.image | string | `"registry1.dso.mil/ironbank/big-bang/base:1.0.0"` | Image used to run readiness check, requires `kubectl` |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
