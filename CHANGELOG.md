# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
