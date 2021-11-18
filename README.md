# istio

![Version: 1.11.3-bb.2](https://img.shields.io/badge/Version-1.11.3--bb.2-informational?style=flat-square)

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
| profile | string | `"default"` |  |
| hub | string | `"registry1.dso.mil/ironbank/opensource/istio"` |  |
| tag | string | `"1.11.3"` |  |
| domain | string | `"bigbang.dev"` |  |
| revision | string | `""` |  |
| openshift | bool | `false` |  |
| imagePullSecrets | list | `[]` |  |
| monitoring.enabled | bool | `false` |  |
| authservice.enabled | bool | `false` |  |
| ingressGateways.istio-ingressgateway.enabled | bool | `true` |  |
| ingressGateways.istio-ingressgateway.extraLabels | object | `{}` |  |
| ingressGateways.istio-ingressgateway.k8s.resources | object | `{}` |  |
| ingressGateways.istio-ingressgateway.k8s.service.type | string | `"LoadBalancer"` |  |
| ingressGateways.istio-ingressgateway.k8s.podAnnotations | object | `{}` |  |
| ingressGateways.istio-ingressgateway.k8s.serviceAnnotations | object | `{}` |  |
| ingressGateways.istio-ingressgateway.k8s.nodeSelector | object | `{}` |  |
| ingressGateways.istio-ingressgateway.k8s.affinity | object | `{}` |  |
| ingressGateways.istio-ingressgateway.k8s.tolerations | list | `[]` |  |
| gateways.main.autoHttpRedirect.enabled | bool | `true` |  |
| gateways.main.selector.app | string | `"istio-ingressgateway"` |  |
| gateways.main.servers[0].hosts[0] | string | `"*.{{ .Values.domain }}"` |  |
| gateways.main.servers[0].port.name | string | `"https"` |  |
| gateways.main.servers[0].port.number | int | `8443` |  |
| gateways.main.servers[0].port.protocol | string | `"HTTPS"` |  |
| gateways.main.servers[0].tls.credentialName | string | `"wildcard-cert"` |  |
| gateways.main.servers[0].tls.mode | string | `"SIMPLE"` |  |
| istiod.replicaCount | int | `1` |  |
| istiod.resources.requests.cpu | string | `"500m"` |  |
| istiod.resources.requests.memory | string | `"2Gi"` |  |
| istiod.resources.limits.cpu | string | `"500m"` |  |
| istiod.resources.limits.memory | string | `"2Gi"` |  |
| istiod.hpaSpec.maxReplicas | int | `3` |  |
| istiod.hpaSpec.minReplicas | int | `1` |  |
| istiod.hpaSpec.metrics[0].type | string | `"Resource"` |  |
| istiod.hpaSpec.metrics[0].resource.name | string | `"cpu"` |  |
| istiod.hpaSpec.metrics[0].resource.targetAverageUtilization | int | `60` |  |
| istiod.strategy | object | `{}` |  |
| istiod.podAnnotations | object | `{}` |  |
| istiod.serviceAnnotations | object | `{}` |  |
| istiod.nodeSelector | object | `{}` |  |
| istiod.affinity | object | `{}` |  |
| istiod.tolerations | list | `[]` |  |
| tracing.enabled | bool | `false` |  |
| tracing.address | string | `"jaeger-collector.jaeger.svc"` |  |
| tracing.port | int | `9411` |  |
| tracing.sampling | int | `10` |  |
| cni.image.name | string | `"install-cni"` |  |
| cni.image.hub | string | `"registry1.dso.mil/ironbank/opensource/istio"` |  |
| cni.image.tag | string | `"1.11.3"` |  |
| cni.podAnnotations | object | `{}` |  |
| cni.nodeSelector | object | `{}` |  |
| cni.affinity | object | `{}` |  |
| cni.tolerations | list | `[]` |  |
| meshConfig | object | `{}` |  |
| values.imagePullPolicy | string | `"Always"` |  |
| values.global.proxy.resources.requests.cpu | string | `"100m"` |  |
| values.global.proxy.resources.requests.memory | string | `"256Mi"` |  |
| values.global.proxy.resources.limits.cpu | string | `"100m"` |  |
| values.global.proxy.resources.limits.memory | string | `"256Mi"` |  |
| values.global.proxy_init.resources.limits.cpu | string | `"100m"` |  |
| values.global.proxy_init.resources.limits.memory | string | `"256Mi"` |  |
| values.global.proxy_init.resources.requests.cpu | string | `"100m"` |  |
| values.global.proxy_init.resources.requests.memory | string | `"256Mi"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| postInstallHook.image | string | `"registry1.dso.mil/ironbank/big-bang/base:8.4"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
