# Istio Controlplane

A simple chart wrapper around `IstioOperator` custom resource.

#### _This is a mirror of a government repo hosted on [Repo1](https://repo1.dso.mil/) by [DoD Platform One](http://p1.dso.mil/).  Please direct all code changes, issues and comments to https://repo1.dso.mil/platform-one/big-bang/apps/core/istio-controlplane_

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

This chart requires the Istio Operator to be deployed beforehand via [BigBang](). Place the chart into the existing "istio-system" namespace as described below.

## Iron Bank

You can `pull` the registry1 image(s) [here](https://registry1.dso.mil/harbor/projects/3/repositories/opensource%2Fistio-1.7%2Fpilot-1.7) and view the container approval [here](https://ironbank.dso.mil/ironbank/repomap/opensource/istio-1.7).

## Deployment
```
git clone https://repo1.dso.mil/platform-one/big-bang/apps/core/istio-controlplane.git
cd istio-controlplane
helm install istio-controlplane chart -n istio-system
```
