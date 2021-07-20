# Istio Control Plan Ingress Configuration

## Default

Without changes to this template, the following ingress will be created:

- One ingress gateway
  - Name: `istio-ingressgateway`
  - Type: load balancer
  - Listening ports: 80 (HTTP), 443 (HTTPS), 15021 (Istio Status), and 15443 (Istio SNI)
- One gateway
  - Name: `main`
  - Ingress Gateway: `istio-ingressgateway`
  - Hosts: `*.{domain}`
  - HTTP redirect to HTTPS
  - TLS termination on HTTPS
  - No TLS certificate

At a minimum, a secret holding the wildcard TLS certificate for the domain needs to be provided for the default setup to function.  In addition, Virtual Services should be created for applications to create a complete ingress to an endpoint.

## Additional Ingress Gateways

To create additional ingress gateways (or replace the default), the following `values.yaml` configuration can be used.  Under the `k8s` section, any parameters listed in the [Istio Operator documentation](https://istio.io/latest/docs/reference/config/istio.operator.v1alpha1/#KubernetesResourcesSpec) can be added.

> To remove the default ingress gateway, set `istio-ingressgateway: null` in your `values.yaml`

```yaml
ingressGateways:
  # Complete example of an additional ingressgateway defined below
  private-ingressgateway:  # This becomes the name
    extraLabels: {} # Automatic labels: 'app: {ingress gateway name}'
    k8s: # Set any value from https://istio.io/latest/docs/reference/config/istio.operator.v1alpha1/#KubernetesResourcesSpec
      # hpaSpec:  By default, HPA is set from 1-5 instances with a target average utilization of 80%
      resources: {}
        # requests:
        #   cpu: 500m
        #   memory: 1Gi
        # limits:
        #   cpu: 1.5
        #   memory: 3Gi
      service:
        type: "LoadBalancer" # or "NodePort"
        # ports: By default ports 15021 (status), 80, 443, and 15443 (SNI Routing) are setup
      podAnnotations: {} # https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
      serviceAnnotations: {} # https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
      nodeSelector: {} # https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector
      affinity: {} # https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity
      tolerations: [] # https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
```

## Additional Gateways

Additional gateways can be added to Istio by using the following configuration in your `values.yaml`.

- `selector` should be used to select which `IngressGateway` to use
- HTTP redirect is automatically included in every gateway
- The TLS credentials must be created separately in a secret and referenced in the `tls.credentialName` field
- Hosts should not overlap between Gateways unless the Ingress Gateways are completely isolated (e.g. different IPs or different Ports)

> To remove the default gateway, set `main: null` in your `values.yaml`

```yaml
# See https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway for spec
gateways:
  private:
    selector:
      app: "private-istio-ingressgateway"
    servers:
    - hosts:
      - "mypackage.{{ .Values.domain }}"
      port:
        name: http2
        number: 8443
        protocol: HTTPS
      tls:
        credentialName: "some-secret"
        mode: "SIMPLE"
  ```
