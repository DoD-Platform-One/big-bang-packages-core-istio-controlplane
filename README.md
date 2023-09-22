# istio

![Version: 1.19.0-bb.0](https://img.shields.io/badge/Version-1.19.0--bb.0-informational?style=flat-square) ![AppVersion: 1.19.0](https://img.shields.io/badge/AppVersion-1.19.0-informational?style=flat-square)

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
| tag | string | `"1.19.0"` | The tag to use for all images |
| enterprise | bool | `false` | Tetrate Istio Distribution - Tetrate provides FIPs verified Istio and Envoy software and support, validated through the FIPs Boring Crypto module. Find out more from Tetrate - https://www.tetrate.io/tetrate-istio-subscription |
| tidHub | string | `"registry1.dso.mil/ironbank/tetrate/istio"` |  |
| tidTag | string | `"1.18.2-tetratefips-v0"` |  |
| domain | string | `"bigbang.dev"` | The domain to use for the default gateway |
| revision | string | `""` | Revision of the Istio control plane |
| openshift | bool | `false` | Openshift feature switch toggle |
| imagePullSecrets | list | `[]` | Pull secrets for images |
| monitoring | object | `{"enabled":false}` | Big Bang Monitoring interaction controls |
| monitoring.enabled | bool | `false` | Toggle monitoring on/off (controls networkPolicies) |
| kiali | object | `{"enabled":false}` | Big Bang Kiali interaction controls |
| kiali.enabled | bool | `false` | Toggle kiali on/off (controls networkPolicies) |
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
| egressGateways | object | `{"istio-egressgateway":{"enabled":false,"extraLabels":{},"k8s":{"affinity":{},"nodeSelector":{},"podAnnotations":{},"resources":{},"service":{"type":"LoadBalancer"},"serviceAnnotations":{},"tolerations":[]}}}` | Egress gateways, The following items are automatically set for every egress gateway: - label: "app: {name of egress gateway}" |
| egressGateways.istio-egressgateway | object | `{"enabled":false,"extraLabels":{},"k8s":{"affinity":{},"nodeSelector":{},"podAnnotations":{},"resources":{},"service":{"type":"LoadBalancer"},"serviceAnnotations":{},"tolerations":[]}}` | This key becomes the name of the egressGateway |
| egressGateways.istio-egressgateway.extraLabels | object | `{}` | Labels to use for selecting the egress gateway from the service Automatic labels: 'app: {egress gateway name}' and `istio: egressgateway` |
| egressGateways.istio-egressgateway.k8s | object | `{"affinity":{},"nodeSelector":{},"podAnnotations":{},"resources":{},"service":{"type":"LoadBalancer"},"serviceAnnotations":{},"tolerations":[]}` | Set any value from https://istio.io/latest/docs/reference/config/istio.operator.v1alpha1/#KubernetesResourcesSpec |
| egressGateways.istio-egressgateway.k8s.service.type | string | `"LoadBalancer"` | "LoadBalancer" or "NodePort" |
| egressGateways.istio-egressgateway.k8s.podAnnotations | object | `{}` | https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| egressGateways.istio-egressgateway.k8s.serviceAnnotations | object | `{}` | https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| egressGateways.istio-egressgateway.k8s.nodeSelector | object | `{}` | https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector |
| egressGateways.istio-egressgateway.k8s.affinity | object | `{}` | https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity |
| egressGateways.istio-egressgateway.k8s.tolerations | list | `[]` | https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| gateways | object | `{"main":{"autoHttpRedirect":{"enabled":true},"selector":{"app":"istio-ingressgateway"},"servers":[{"hosts":["*.{{ .Values.domain }}"],"port":{"name":"https","number":8443,"protocol":"HTTPS"},"tls":{"credentialName":"wildcard-cert","mode":"SIMPLE"}}]}}` | See https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway for spec |
| gateways.main | object | `{"autoHttpRedirect":{"enabled":true},"selector":{"app":"istio-ingressgateway"},"servers":[{"hosts":["*.{{ .Values.domain }}"],"port":{"name":"https","number":8443,"protocol":"HTTPS"},"tls":{"credentialName":"wildcard-cert","mode":"SIMPLE"}}]}` | This key becomes the name of the gateway |
| gateways.main.autoHttpRedirect | object | `{"enabled":true}` | Controls default HTTP/8080 server entry with HTTP to HTTPS Redirect. Must add in HTTP server config if disabling. |
| istiod | object | `{"affinity":{},"env":[],"hpaSpec":{"maxReplicas":3,"metrics":[{"resource":{"name":"cpu","target":{"averageUtilization":60,"type":"Utilization"}},"type":"Resource"}],"minReplicas":1},"nodeSelector":{},"podAnnotations":{},"replicaCount":1,"resources":{"limits":{"cpu":"500m","memory":"2Gi"},"requests":{"cpu":"500m","memory":"2Gi"}},"serviceAnnotations":{},"strategy":{},"tolerations":[]}` | istiod / pilot configuration |
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
| cni.image.tag | string | `"1.19.0"` |  |
| cni.podAnnotations | object | `{}` | k8s pod annotations. https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| cni.nodeSelector | object | `{}` | k8s nodeSelector. https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector |
| cni.affinity | object | `{}` | k8s affinity / anti-affinity. https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity |
| cni.tolerations | list | `[]` | k8s toleration https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| meshConfig | object | `{"meshMTLS":{"minProtocolVersion":"TLSV1_2"}}` | Global mesh-wide settings https://istio.io/latest/docs/reference/config/istio.mesh.v1alpha1/#MeshConfig |
| defaultConfig | object | `{}` | Default Proxy Config for the entire mesh (inserts under meshConfig in IstioOperator resource) |
| values.global | object | `{"proxy":{"resources":{"limits":{"cpu":"100m","memory":"256Mi"},"requests":{"cpu":"100m","memory":"256Mi"}}},"proxy_init":{"resources":{"limits":{"cpu":"100m","memory":"256Mi"},"requests":{"cpu":"100m","memory":"256Mi"}}}}` | Global IstioOperator values |
| values.defaultRevision | string | `"default"` | Set defaultRevision name, must be non-empty to deploy validating webhook |
| values.pilot | object | `{}` | Istio pilot values. https://github.com/istio/istio/blob/master/manifests/charts/istio-control/istio-discovery/values.yaml |
| envoyFilters | list | `[]` | Custom EnvoyFilters. https://istio.io/latest/docs/reference/config/networking/envoy-filter/ |
| networkPolicies | object | `{"controlPlaneCidr":"0.0.0.0/0","enabled":false}` | Big Bang NetworkPolicy controls |
| networkPolicies.enabled | bool | `false` | Toggle ALL NetworkPolicies on/off |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` | See `kubectl cluster-info` and then resolve to IP |
| postInstallHook.image | string | `"registry1.dso.mil/ironbank/big-bang/base"` | Image used to run readiness check, requires `kubectl` |
| postInstallHook.tag | string | `"2.0.0"` |  |
| postInstallHook.securityContext | object | `{"fsGroup":1001,"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Pod security context for readiness check |
| postInstallHook.containerSecurityContext | object | `{"capabilities":{"drop":["ALL"]}}` | Container security context for readiness check |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
