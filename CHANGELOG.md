# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
## [1.23.6-bb.1] 2025-05-06
### Fixed
- Resolved issue with "Istio Control Plane Dashboard" not properly loading in Grafana.

## [1.23.6-bb.0] 2025-04-17
### Changed
- ironbank/opensource/istio/install-cni updated from 1.23.5 to 1.23.6
- ironbank/opensource/istio/pilot updated from 1.23.5 to 1.23.6
- ironbank/opensource/istio/proxyv2 updated from 1.23.5 to 1.23.6
- ironbank/opensource/kubernetes/kubectl updated from v1.30.8 to v1.30.10
- ironbank/tetrate/istio/install-cni updated from 1.23.5 to 1.23.6
- ironbank/tetrate/istio/pilot updated from 1.23.5 to 1.23.6
- ironbank/tetrate/istio/proxyv2 updated from 1.23.5 to 1.23.6
- Updated Gluon to v0.5.15

## [1.23.5-bb.1] - 2025-03-25
### Changed
- Added an `EnvoyFilter` to simplify classification banner creation

## [1.23.5-bb.0] - 2025-02-19
### Changed
- ironbank/opensource/istio/install-cni updated from 1.23.4 to 1.23.5
- ironbank/opensource/istio/pilot updated from 1.23.4 to 1.23.5
- ironbank/opensource/istio/proxyv2 updated from 1.23.4 to 1.23.5
- ironbank/opensource/kubernetes/kubectl updated from v1.30.8 to v1.30.10
- ironbank/tetrate/istio/install-cni updated from 1.23.4 to 1.23.5
- ironbank/tetrate/istio/pilot updated from 1.23.4 to 1.23.5
- ironbank/tetrate/istio/proxyv2 updated from 1.23.4 to 1.23.5
- Updated Gluon to v0.5.14

## [1.23.4-bb.0] - 2025-01-13
### Changed
- ironbank/opensource/istio/install-cni updated from 1.23.3 to 1.23.4
- ironbank/opensource/istio/pilot updated from 1.23.3 to 1.23.4
- ironbank/opensource/istio/proxyv2 updated from 1.23.3 to 1.23.4
- ironbank/opensource/kubernetes/kubectl updated from v1.30.6 to v1.30.8
- ironbank/tetrate/istio/install-cni updated from 1.23.3 to 1.23.4
- ironbank/tetrate/istio/pilot updated from 1.23.3 to 1.23.4
- ironbank/tetrate/istio/proxyv2 updated from 1.23.3 to 1.23.4

## [1.23.3-bb.3] - 2025-01-06
### Changed
- Update OSCAL to utilize Lula config file & fix templating bug

## [1.23.3-bb.2] - 2024-12-10
### Changed
- Removed global cpu limit for istio proxy

## [1.23.3-bb.1] - 2024-11-25
### Changed
- Added app.kubernetes.io/name and app.kubernetes.io/version labels to all workloads
- Removed version label that was added as part of previous Kiali labelling strategy
- Added the maintenance track annotation and badge

## [1.23.3-bb.0] - 2024-11-04
### Changed
- ironbank/opensource/istio/install-cni updated from 1.23.2 to 1.23.3
- ironbank/opensource/istio/pilot updated from 1.23.2 to 1.23.3
- ironbank/opensource/istio/proxyv2 updated from 1.23.2 to 1.23.3
- ironbank/opensource/kubernetes/kubectl updated from v1.30.5 to v1.30.6
- ironbank/tetrate/istio/install-cni updated from 1.23.2 to 1.23.3
- ironbank/tetrate/istio/pilot updated from 1.23.2 to 1.23.3
- ironbank/tetrate/istio/proxyv2 updated from 1.23.2 to 1.23.3

## [1.23.2-bb.1] - 2024-10-21
### Added
- added default, global envoy filter for HSTS and other security headers

## [1.23.2-bb.0] - 2024-10-08
### Changed
- ironbank/opensource/istio/install-cni updated from 1.22.5 to 1.23.2
- ironbank/opensource/istio/pilot updated from 1.22.5 to 1.23.2
- ironbank/opensource/istio/proxyv2 updated from 1.22.5 to 1.23.2
- ironbank/tetrate/istio/install-cni updated from 1.22.5 to 1.23.2
- ironbank/tetrate/istio/pilot updated from 1.22.5 to 1.23.2
- ironbank/tetrate/istio/proxyv2 updated from 1.22.5 to 1.23.2

## [1.22.5-bb.0] - 2024-09-24
### Changed
- ironbank/opensource/istio/install-cni updated from 1.22.4 to 1.22.5
- ironbank/opensource/istio/pilot updated from 1.22.4 to 1.22.5
- ironbank/opensource/istio/proxyv2 updated from 1.22.4 to 1.22.5
- ironbank/opensource/kubernetes/kubectl updated from v1.29.6 to v1.30.5
- ironbank/tetrate/istio/install-cni updated from 1.22.4 to 1.22.5
- ironbank/tetrate/istio/pilot updated from 1.22.4 to 1.22.5
- ironbank/tetrate/istio/proxyv2 updated from 1.22.4 to 1.22.5

## [1.22.4-bb.2] - 2024-09-16

### Added

- Gluon post-install wait scripts

## [1.22.4-bb.1] - 2024-08-22

### Changed

- Updating Istio `oscal-component.yaml` to include Lula validations for automated assessment

### Added

- Added `oscal-assessment-results.yaml` as a threshold for automated governance

## [1.22.4-bb.0] - 2024-08-21

### Changed

- ironbank/opensource/istio/install-cni updated from 1.22.3 to 1.22.4
- ironbank/opensource/istio/pilot updated from 1.22.3 to 1.22.4
- ironbank/opensource/istio/proxyv2 updated from 1.22.3 to 1.22.4
- ironbank/tetrate/istio/install-cni updated from 1.22.3 to 1.22.4
- ironbank/tetrate/istio/pilot updated from 1.22.3 to 1.22.4
- ironbank/tetrate/istio/proxyv2 updated from 1.22.3 to 1.22.4

## [1.22.3-bb.0] - 2024-07-18

### Changed

- ironbank/opensource/istio/install-cni updated from 1.22.2 to 1.22.3
- ironbank/opensource/istio/pilot updated from 1.22.2 to 1.22.3
- ironbank/opensource/istio/proxyv2 updated from 1.22.2 to 1.22.3
- ironbank/tetrate/istio/install-cni updated from 1.22.2 to 1.22.3
- ironbank/tetrate/istio/pilot updated from 1.22.2 to 1.22.3
- ironbank/tetrate/istio/proxyv2 updated from 1.22.2 to 1.22.3

## [1.22.2-bb.2] - 2024-07-10

### Added

- Added native sidecar support

## [1.22.2-bb.1] - 2024-07-09

### Changed

- Standardized authorization policy template directory path

## [1.22.2-bb.0] - 2024-07-01

### Changed

- ironbank/opensource/istio/install-cni updated from 1.22.1 to 1.22.2
- ironbank/opensource/istio/pilot updated from 1.22.1 to 1.22.2
- ironbank/opensource/istio/proxyv2 updated from 1.22.1 to 1.22.2
- ironbank/tetrate/istio/install-cni updated from 1.22.1 to 1.22.2
- ironbank/tetrate/istio/pilot updated from 1.22.1 to 1.22.2
- ironbank/tetrate/istio/proxyv2 updated from 1.22.1 to 1.22.2

## [1.22.1-bb.0] - 2024-06-14

### Changed

- ironbank/opensource/istio/install-cni updated from 1.21.2 to 1.22.1
- ironbank/opensource/istio/pilot updated from 1.21.2 to 1.22.1
- ironbank/opensource/istio/proxyv2 updated from 1.21.2 to 1.22.1
- ironbank/tetrate/istio/install-cni updated from 1.21.2 to 1.22.1
- ironbank/tetrate/istio/pilot updated from 1.21.2 to 1.22.1
- ironbank/tetrate/istio/proxyv2 updated from 1.21.2 to 1.22.1

## [1.21.2-bb.3] - 2024-06-12

### Changed

- Moved the package specific shared istio authorization to their helm charts

## [1.21.2-bb.2] - 2024-06-12

### Changed

- Revert to correct overwritten dashboard changes

## [1.21.2-bb.1] - 2024-05-28

### Changed

- Added the shared istio authorization policies

## [1.21.2-bb.0] - 2024-05-16

### Changed

- ironbank/opensource/istio/install-cni updated from 1.21.1 to 1.21.2
- ironbank/opensource/istio/pilot updated from 1.21.1 to 1.21.2
- ironbank/opensource/istio/proxyv2 updated from 1.21.1 to 1.21.2
- ironbank/tetrate/istio/install-cni updated from 1.21.1 to 1.21.2
- ironbank/tetrate/istio/pilot updated from 1.21.1 to 1.21.2
- ironbank/tetrate/istio/proxyv2 updated from 1.21.1 to 1.21.2

## [1.21.1-bb.1] - 2024-05-13

### Removed

- Removed native sidecar support because we have to support 1.27.x

## [1.21.1-bb.0] - 2024-05-03

### Changed

- ironbank/opensource/istio/install-cni updated from 1.20.4 to 1.21.1
- ironbank/opensource/istio/pilot updated from 1.20.4 to 1.21.1
- ironbank/opensource/istio/proxyv2 updated from 1.20.4 to 1.21.1
- ironbank/tetrate/istio/install-cni updated from 1.20.4 to 1.21.1
- ironbank/tetrate/istio/pilot updated from 1.20.4 to 1.21.1
- ironbank/tetrate/istio/proxyv2 updated from 1.20.4 to 1.21.1

## [1.20.4-bb.3] - 2024-05-02

### Added

- Added custom network policies

## [1.20.4-bb.2] - 2024-04-23

### Added

- Added native sidecar support

## [1.20.4-bb.1] - 2024-04-04

### Fixed

- Upgrade new istio dashboards to fix "Prometheus" vs "prometheus" datasource issue

## [1.20.4-bb.0] - 2024-03-25

### Changed

- ironbank/opensource/istio/install-cni updated from 1.19.7 to 1.20.4
- ironbank/opensource/istio/pilot updated from 1.19.7 to 1.20.4
- ironbank/opensource/istio/proxyv2 updated from 1.19.7 to 1.20.4
- ironbank/tetrate/istio/install-cni updated from 1.20.3 to 1.20.4
- ironbank/tetrate/istio/pilot updated from 1.20.3 to 1.20.4
- ironbank/tetrate/istio/proxyv2 updated from 1.20.3 to 1.20.4

## [1.19.7-bb.0] - 2024-02-13

### Changed

- ironbank/opensource/istio/install-cni updated from 1.19.6 to 1.19.7
- ironbank/opensource/istio/pilot updated from 1.19.6 to 1.19.7
- ironbank/opensource/istio/proxyv2 updated from 1.19.6 to 1.19.7
- ironbank/tetrate/istio/install-cni updated from 1.20.2 to 1.20.3
- ironbank/tetrate/istio/pilot updated from 1.20.2 to 1.20.3
- ironbank/tetrate/istio/proxyv2 updated from 1.20.2 to 1.20.3

## [1.19.6-bb.2] - 2024-02-12

### Added

- added postInstallHook.containerResources values for hook-job.yaml

## [1.19.6-bb.1] - 2024-01-31

### Added

- added security context values for pilot pod for kyverno-polices to allow the pilot image

## [1.19.6-bb.0] - 2024-01-12

### Changed

- ironbank/opensource/istio/install-cni updated from 1.19.5 to 1.19.6
- ironbank/opensource/istio/pilot updated from 1.19.5 to 1.19.6
- ironbank/opensource/istio/proxyv2 updated from 1.19.5 to 1.19.6
- ironbank/tetrate/istio/install-cni updated from 1.19.6 to 1.20.2
- ironbank/tetrate/istio/pilot updated from 1.19.5 to 1.20.2
- ironbank/tetrate/istio/proxyv2 updated from 1.19.5 to 1.20.2

## [1.19.5-bb.2] - 2023-12-29

### Changed

- ironbank/tetrate/istio/install-cni updated from 1.19.3 to 1.19.6
- ironbank/tetrate/istio/pilot updated from 1.19.3 to 1.19.5
- ironbank/tetrate/istio/proxyv2 updated from 1.19.3 to 1.19.5

## [1.19.5-bb.1] - 2023-12-19

### Changed

- Allow Setting resources and limits for the postInstallHook

## [1.19.5-bb.0] - 2023-12-19

### Changed

- ironbank/opensource/istio/install-cni updated from 1.19.4 to 1.19.5
- ironbank/opensource/istio/pilot updated from 1.19.4 to 1.19.5
- ironbank/opensource/istio/proxyv2 updated from 1.19.4 to 1.19.5

## [1.19.4-bb.1] - 2023-11-28

### Changed

- Updating OSCAL Component file.

## [1.19.4-bb.0] - 2023-11-15

### Changed

- ironbank/opensource/istio/install-cni updated from 1.19.3 to 1.19.4
- ironbank/opensource/istio/pilot updated from 1.19.3 to 1.19.4
- ironbank/opensource/istio/proxyv2 updated from 1.19.3 to 1.19.4

## [1.19.3-bb.1] - 2023-11-07

### Changed

- ironbank/big-bang/base updated from 2.0.0 to 2.1.0

## [1.19.3-bb.0] - 2023-10-14

### Changed

- ironbank/opensource/istio/install-cni updated from 1.19.0 to 1.19.3
- ironbank/opensource/istio/pilot updated from 1.19.0 to 1.19.3
- ironbank/opensource/istio/proxyv2 updated from 1.19.0 to 1.19.3
- ironbank/tetrate/istio/install-cni updated from 1.18.2 to 1.19.3
- ironbank/tetrate/istio/pilot updated from 1.18.2 to 1.19.3
- ironbank/tetrate/istio/proxyv2 updated from 1.18.2 to 1.19.3

## [1.19.0-bb.2] - 2023-10-11

### Changed

- Modified OSCAL Version for istio and updated to 1.1.1

## [1.19.0-bb.1] - 2023-10-02

### Changed

- Enable Istio mTLS (via peerAuthentication) globally on istio-system namespace

## [1.19.0-bb.0] - 2023-09-12

### Changed

- ironbank/opensource/istio/install-cni updated from 1.18.2 to 1.19.0
- ironbank/opensource/istio/pilot updated from 1.18.2 to 1.19.0
- ironbank/opensource/istio/proxyv2 updated from 1.18.2 to 1.19.0

## [1.18.2-bb.1] - 2023-08-16

### Changed

- istio control plane default config

## [1.18.2-bb.0] - 2023-08-02

### Changed

- ironbank/opensource/istio/install-cni updated from 1.18.1 to 1.18.2
- ironbank/opensource/istio/pilot updated from 1.18.1 to 1.18.2
- ironbank/opensource/istio/proxyv2 updated from 1.18.1 to 1.18.2
- ironbank/tetrate/istio/install-cni updated from 1.18.0 to 1.18.2
- ironbank/tetrate/istio/pilot updated from 1.18.0 to 1.18.2
- ironbank/tetrate/istio/proxyv2 updated from 1.18.0 to 1.18.2
- Updated to new HPA value schema

## [1.18.1-bb.0] - 2023-07-20

### Changed

- ironbank/opensource/istio/install-cni updated from 1.17.3 to 1.18.1
- ironbank/opensource/istio/pilot updated from 1.17.3 to 1.18.1
- ironbank/opensource/istio/proxyv2 updated from 1.17.3 to 1.18.1
- ironbank/tetrate/istio/install-cni updated from 1.17.3 to 1.18.1
- ironbank/tetrate/istio/pilot updated from 1.17.3 to 1.18.0
- ironbank/tetrate/istio/proxyv2 updated from 1.17.3 to 1.18.0

## [1.18.1-bb.0] - 2023-07-20

### Changed

- ironbank/opensource/istio/install-cni updated from 1.17.3 to 1.18.1
- ironbank/opensource/istio/pilot updated from 1.17.3 to 1.18.1
- ironbank/opensource/istio/proxyv2 updated from 1.17.3 to 1.18.1
- ironbank/tetrate/istio/install-cni updated from 1.17.3 to 1.18.1
- ironbank/tetrate/istio/pilot updated from 1.17.3 to 1.18.0
- ironbank/tetrate/istio/proxyv2 updated from 1.17.3 to 1.18.0

## [1.17.3-bb.3] - 2023-07-12

### Added

- Allow user to specify their own `EnvoyFilters`

## [1.17.3-bb.2] - 2023-07-12

### Changed

- fix README.md for bb docs compiler job

## [1.17.3-bb.1] - 2023-06-28

### Changed

- ironbank/opensource/istio/pilot updated from 1.17.2 to 1.17.3
- ironbank/opensource/istio/proxyv2 updated from 1.17.2 to 1.17.3

## [1.17.3-bb.0] - 2023-06-26

### Changed

- ironbank/opensource/istio/install-cni updated from 1.17.2 to 1.17.3
- ironbank/tetrate/istio/install-cni updated from 1.17.2 to 1.17.3
- ironbank/tetrate/istio/pilot updated from 1.17.2 to 1.17.3
- ironbank/tetrate/istio/proxyv2 updated from 1.17.2 to 1.17.3

## [1.17.2-bb.1] - 2023-05-26

### Added

- Added scc for OpenShift

## [1.17.2-bb.1] - 2023-05-04

### Changed

- ironbank/tetrate/istio/install-cni updated from 1.16.1 to 1.17.2
- ironbank/tetrate/istio/pilot updated from 1.16.1 to 1.17.2
- ironbank/tetrate/istio/proxyv2 updated from 1.16.1 to 1.17.2

## [1.17.2-bb.0] - 2023-04-11

### Changed

- ironbank/opensource/istio/install-cni updated from 1.17.1 to 1.17.2
- ironbank/opensource/istio/pilot updated from 1.17.1 to 1.17.2
- ironbank/opensource/istio/proxyv2 updated from 1.17.1 to 1.17.2

## [1.17.1-bb.1] - 2023-04-07

### Changed

- Added ability to pass pilot values to IstioOperator resource definition

## [1.17.1-bb.0] - 2023-03-01

### Changed

- ironbank/opensource/istio/install-cni updated from 1.16.2 to 1.17.1
- ironbank/opensource/istio/pilot updated from 1.16.2 to 1.17.1
- ironbank/opensource/istio/proxyv2 updated from 1.16.2 to 1.17.1

## [1.16.2-bb.0] - 2023-02-10

### Changed

- ironbank/opensource/istio/install-cni updated from 1.16.1 to 1.16.2
- ironbank/opensource/istio/pilot updated from 1.16.1 to 1.16.2
- ironbank/opensource/istio/proxyv2 updated from 1.16.1 to 1.16.2

## [1.16.1-bb.2] - 2023-02-08

### Changed

- Removed tetrate istioctl and install-cni image references

## [1.16.1-bb.1] - 2023-01-27

### Changed

- ironbank/tetrate/istio/install-cni updated from 1.15.1 to 1.16.1
- ironbank/tetrate/istio/istioctl updated from 1.15.1 to 1.16.1
- ironbank/tetrate/istio/pilot updated from 1.15.1 to 1.16.1
- ironbank/tetrate/istio/proxyv2 updated from 1.15.1 to 1.16.1

## [1.16.1-bb.0] - 2022-12-17

### Changed

- ironbank/opensource/istio/install-cni updated from 1.15.3 to 1.16.1
- ironbank/opensource/istio/pilot updated from 1.15.3 to 1.16.1
- ironbank/opensource/istio/proxyv2 updated from 1.15.3 to 1.16.1

## [1.15.3-bb.1]

### Changed

- Splits the `postInstallHook` image and tag so that they can be maintained separately.

## [1.15.3-bb.0] - 2022-11-01

### Changed

- ironbank/opensource/istio/install-cni updated from 1.15.0 to 1.15.3
- ironbank/opensource/istio/pilot updated from 1.15.0 to 1.15.3
- ironbank/opensource/istio/proxyv2 updated from 1.15.0 to 1.15.3
- ironbank/tetrate/istio/install-cni updated from 1.14.4 to 1.15.1
- ironbank/tetrate/istio/istioctl updated from 1.14.4 to 1.15.1
- ironbank/tetrate/istio/pilot updated from 1.14.4 to 1.15.1
- ironbank/tetrate/istio/proxyv2 updated from 1.14.4 to 1.15.1

## [1.15.0-bb.1] - 2022-09-30

### Changed

- ironbank/tetrate/istio/install-cni updated from 1.14.3 to 1.14.4
- ironbank/tetrate/istio/istioctl updated from 1.14.3 to 1.14.4
- ironbank/tetrate/istio/pilot updated from 1.14.3 to 1.14.4
- ironbank/tetrate/istio/proxyv2 updated from 1.14.3 to 1.14.4

## [1.15.0-bb.0] - 2022-09-17

### Changed

- ironbank/opensource/istio/install-cni updated from 1.14.3 to 1.15.0
- ironbank/opensource/istio/pilot updated from 1.14.3 to 1.15.0
- ironbank/opensource/istio/proxyv2 updated from 1.14.3 to 1.15.0
- ironbank/tetrate/istio/install-cni updated from 1.13.5 to 1.14.3
- ironbank/tetrate/istio/istioctl updated from 1.13.5 to 1.14.3
- ironbank/tetrate/istio/pilot updated from 1.13.5 to 1.14.3
- ironbank/tetrate/istio/proxyv2 updated from 1.13.5 to 1.14.3

## [1.14.3-bb.4]

### Changed

- Adds env variable to values which can be used during deployment to modify istio k8s env settings

## [1.14.3-bb.3]

### Changed

- Drop all capabilities + nonroot for hook job

## [1.14.3-bb.2]

### Changed

- Added Openshift DNS to networkpolicy egress

## [1.14.3-bb.1]

### Changed

- Removed legacy fluentd exception

## [1.14.3-bb.0]

### Changed

- Updated to 1.14.3 images

## [1.14.2-bb.2]

### Added

- Moved dashboards from monitoring chart into Istio

## [1.14.2-bb.1]

### Added

- Added minPRotocolVersion: TLSV1_2

## [1.14.2-bb.0]

### Changed

- Updated chart to `1.14.2-bb.0` version
- Updated images to `1.14.2`
- Updated app version to 1.14.2 in `Chart.yaml`

## [1.13.5-bb.2]

### Added

- Added support for egress gateways via values

## [1.13.5-bb.1]

### Changed

- Updated TID images to `1.13.5`

## [1.13.5-bb.0]

### Changed

- Updated chart to `1.13.5-bb.0` version
- Updated images to `1.13.5`
- Updated app version to 1.13.5 in `Chart.yaml`

## [1.13.4-bb.4]

### Changed

- Update the OSCAL component definition for Istio to include additional NIST 800-53 mappings and explanations.

## [1.13.4-bb.3]

### Added

- Added tolerations to Jobs

## [1.13.4-bb.2]

### Changed

- Updated BB base image to 2.0.0

## [1.13.4-bb.1]

### Changed

- Updated BB base image to 1.17.0

## [1.13.4-bb.0]

### Changed

- Updated chart to `1.13.4-bb.0` version
- Updated images to `1.13.4`
- Updated app version to 1.13.4 in `Chart.yaml`

## [1.13.2-bb.1]

### Changed

- fix pod selector for NetworkPolicy

## [1.13.2-bb.0]

### Changed

- Updated chart to `1.13.2-bb.0` version
- Updated app version to 1.13.2 in `Chart.yaml`

## [1.13.1-bb.3]

### Changed

- Added TID support

## [1.13.1-bb.2]

### Changed

- Added Kiali ingress policy for version scraping

## [1.13.1-bb.1]

### Changed

- Added `values.defaultRevision` to support deployment of validatingWebhook - <https://github.com/istio/istio/pull/35694>

## [1.13.1-bb.0]

### Changed

- Updated chart to `1.13.1-bb.0` version
- Updated app version to 1.13.1 in `Chart.yaml`

## [1.11.5-bb.2]

### Changed

- Updated `renovate.json` to track images in `tests/images.txt`
- fixed typos in `oscal-component.yaml`

## [1.11.5-bb.1]

### Changed

- Update Chart.yaml to follow new standardization for release automation

## [1.11.5-bb.0]

### Changed

- Updated to 1.11.5

## [1.11.3-bb.2]

### Added

- Istio OSCAL component for NIST 800-53 controls

## [1.11.3-bb.1]

### Changed

- Fix envoyfilter handling of DNS names with `-`

## [1.11.3-bb.0]

### Changed

- Updated Istio to 1.11.3

### Added

- `tests/images.txt` for use in package release to include the `install-cni` image
- Revision support for SSO egress NP

## [1.11.2-bb.4]

### Added

- A Helm post-install [hook](https://helm.sh/docs/topics/charts_hooks/) so a HelmRelease properly reflects
  IstioOperator status.

## [1.11.2-bb.3]

### Changed

- Introduces the `revision` value in support of Istio [canary upgrades](https://istio.io/latest/docs/setup/upgrade/canary/).
  When specified, the revision value is appended to resources names.

## [1.11.2-bb.2]

### Fixed

- Changed misdirected request envoy filter to work with non-standard ports

## [1.11.2-bb.1]

### Added

- Added autoHttpRedirect value to control the automatic generation of http to https redirects in the gateways

### Changed

- Changed to using the hosts defined in servers.hosts instead of using * for the automatic generation of http to https redirects in the gateways

## [1.11.2-bb.0]

### Changed

- Update to Istio 1.11.2

## [1.10.4-bb.3]

### Changed

- Added networkpolicy to allow egress to sso

## [1.10.4-bb.2]

### Changed

- Added authservice as extension provider

## [1.10.4-bb.1]

### Changed

- Update Istio proxy and proxy init pods to be in compliance with opa gatekeeper.

## [1.10.4-bb.0]

### Changed

- Update to Istio 1.10.4

## [1.10.3-bb.1]

### Changed

- Add envoyfilter to remove server response header to prevent information disclosure

## [1.10.3-bb.0]

### Changed

- Update to Istio 1.10.3

## [1.9.7-bb.1]

### Added

- Default configuration to hold application start until istio proxy is ready

## [1.9.7-bb.0]

### Changed

- Update to Istio 1.9.7

## [1.8.4-bb.6]

### Changed

- **BREAKING** `ingressGateway` deprecated in favor of creating `ingressGateways` in a uniform manner
- **BREAKING** `gateway` deprecated in favor of creating `gateways` in a uniform manner

## [1.8.4-bb.5]

### Fixed

- Kube API egress allowed for all pods, not just istiod

## [1.8.4-bb.4]

### Added

- Kube API egress networkpolicy

## [1.8.4-bb.3]

### Added

- Added network policies for istio

## [1.8.4-bb.2]

### Fixed

- fixed bug with indentation when providing resources to istio ingressgateways

## [1.8.4-bb.1]

### Fixed

- updated dsop.io registry hostname to dso.mil

## [1.7.3-bb.1]

### Added

- Top level "sso" values designation. This will enable an haproxy package installation in the desired namespace (sso.namespace: istio-addons-sso) that in conjunction with authservice package will place an SSO gate in front of Kiali+Jaeger UIs.
- Top level "ingress" values designation. This will control configuration for the virtualservices created. Leave empty with sso.enabled = false to have the virtualservices go straight to the kiali/jaeger UIs. Leave empty with sso.enabled = true to place the haproxy+authservice injection in front of kiali/tracing. Fill in with your own service/port if customizing the installation/services.
- New Jaeger+Kiali VirtualServices pointing to the haproxy installation will be installed when "sso.enabled: true"
- sso.selector variable sets the label that will be applied to the authservice EnvoyFilter placing the SSO page in front of the regular UIs. Must match the selector for "authservice.selector.key/value".

### Changed

- Jaeger+Kiali VirtualServices pointing directly to the UIs will be skipped when "sso.enabled: true"
- Jaeger+Kiali VirtualServices pull in their configs from the "ingress" designation so VirtualServices can be customized.
