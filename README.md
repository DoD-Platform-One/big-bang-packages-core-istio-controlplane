# Istio Controlplane

A simple chart wrapper around `IstioOperator` custom resource.

# Table of Contents
- [Prerequisites](#pre-requisites)
- [Iron Bank](#iron-bank-istio-controlplane)
- [Deployment](#deploy-istio-controlplane)
- [Istio configuration](docs/README.md)
- [Keycloak configuration](docs/KEYCLOAK.md)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

This chart requires the Istio Operator to be deployed beforehand.  You can use [BigBang]() or the standalone [istio-operator](https://repo1.dsop.io/platform-one/big-bang/apps/core/istio-operator) chart.

## Iron Bank

You can `pull` the registry1 image(s) [here](https://registry1.dsop.io/harbor/projects/3/repositories/opensource%2Fistio-1.7%2Fpilot-1.7) and view the container approval [here](https://ironbank.dsop.io/ironbank/repomap/opensource/istio-1.7).

## Deployment
```
git clone https://repo1.dsop.io/platform-one/big-bang/apps/core/istio-controlplane.git
cd istio-controlplane
helm install istio-controlplane chart
```
