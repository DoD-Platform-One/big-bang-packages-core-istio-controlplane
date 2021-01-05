# Istio Addon Specific Keycloak Configuration

# Table of Contents
- Keycloak configuration
- Istio configuration

## Keycloak Configuration

#### Kiali
1. Create a kiali client
   - Change the following configuration items
      - access type: confidential _this will enable a "Credentials" tab within the client configuration page_
      - Direct Access Grants Enabled: Off
      - Valid Redirect URIs: https://kiali.${DOMAIN}/login
      - Base URL: https://kiali.${DOMAIN}
    - Take note of the client secret in the credential tab

#### Jaeger
1. Create a jaeger client
   - Change the following configuration items
      - access type: confidential _this will enable a "Credentials" tab within the client configuration page_
      - Direct Access Grants Enabled: Off
      - Valid Redirect URIs: https://tracing.${DOMAIN}/login
      - Base URL: https://tracing.${DOMAIN}
    - Take note of the client secret in the credential tab


## Kiali and Jaeger Configuration
Configuration of Keycloak/OIDC auth in front of Prometheus+Alertmanager requires the following:

1. [Authservice](https://repo1.dso.mil/platform-one/big-bang/apps/sandbox/authservice) Installed in your cluster and individual chains for Prometheus+Alertmanager configured:
```
authservice:
  enabled: true
  values:
    chains:
      kiali:
        match:
          header: ":authority"
          prefix: "kiali.DOMAIN"
        client_id: kiali (configured above)
        client_secret: secret-text
        callback_uri: https://kiali.DOMAIN/login
        cookie_name_prefix: hello_world
        logout_path: /logout
      jaeger:
        match:
          header: ":authority"
          prefix: "tracing.DOMAIN"
        client_id: jaeger (configured above)
        client_secret: secret-text
        callback_uri: https://jaeger.DOMAIN/login
        cookie_name_prefix: hello_world
        logout_path: /logout
```
* When used in conjunction with Bigbang Umbrella, see the `istio.sso` section of values.yaml to configure sso in Umbrella.  The umbrella configures Authservice with these values.
* Jaeger/tracing chain looks identical just with jaeger specific client_id, client_secret, prefix, and callback_uri.

2. Utilize the sso options for this monitoring package:
```
sso:
  enabled: false
  namespace: istio-addons-sso
  selector:
    key: protect
    value: keycloak
```
* Setting sso.enabled to true installs an HAProxy container in the defined namespace which works in conjunction with Authservice to place an OIDC redirect in front of Kiali+Jaeger.
* When sso.enabled is set to true, the Kiali+Jaeger VirtualServices are replaced with ones that route to the HAProxy Deployment rather than directly to the services themselves.
* The selector value MUST correspond to the same "selector" value set for Authservice. Default for all is the label: "protect: keycloak"
