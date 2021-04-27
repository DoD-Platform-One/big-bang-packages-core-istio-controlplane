# Service Meshes and Istio 

A service mesh is a dedicated infrastructure layer for making service-to-service communication safe, fast, and reliable, at times relying on a container orchestrator or integration with another service discovery system. Service meshes might deploy as a separate layer atop container orchestrators, but don’t require them, as control and data-plane components might be deployed independent of containerized infrastructure. Istio is able to do this using the envoy sidecar proxy which it auto injects into every application pod. 


# Benefits of Istio 

* **Observability
    * Integrated Jaeger deployment for tracing.
    * Integrated Kiali deployment for service to service traffic visibility.
    * Integrated Prometheus deployment to scrape metrics.
* **Traffic control**
    * Circuit breaking and retry logic.
    * Canary and Dark releases.
* Security
    * More granular fine grained security applied on service to service interaction.
    * Mutual TLS can be applied at a cluster or namespace level.
    * Programming intelligence/security into applications without intrusive    instrumentation using sidecar proxy.
    * Policy Standardization across the enterprise.