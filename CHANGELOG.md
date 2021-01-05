# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.7.3-bb.1]
### Added
- Top level "sso" values designation. This will enable an haproxy installation in the desired namespace (sso.namespace: istio-addons-sso) that in conjunction with authservice package will place an SSO gate in front of Kiali+Jaeger UIs.
- New Jaeger+Kiali VirtualServices pointing to the haproxy installation will be installed when "sso.enabled: true"
- sso.selector variable sets the label that will be applied to the authservice EnvoyFilter placing the SSO page in front of the regular UIs. Must match the selector for "authservice.selector.key/value".

### Changed
- Jaeger+Kiali VirtualServices pointing directly to the UIs will be skipped when "sso.enabled: true"

