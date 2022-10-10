## Istio Quickstart 
The goal of this document is to provide a quickstart for using istio feautures in an organization or enterprise. 

Istio provides a lot of features and capabilities which are broadly grouped into 3:
* Traffic management 
* Security 
* Observability 

The main focus of this quickstart will be on the traffic management and security capabilities of Istio. Understanding the features of the custom resources Istio comes with is key to proper adoption and best practice implementation. 


### Scenario building 

Simulating a custom application being implemented in the cluster , this could ideally be a mission application or any custom application deployed on top of the big bang stack. 

The following pre reqs need to be met
* Istio installed and functional 
* Application installed in a namespace labelled for istio injection. 

## Sample application 
For practice we shall be using a [sample application](https://github.com/rinormaloku/master-istio.git) called Sentiment Analysis - more information about the application can be found [here](https://www.freecodecamp.org/news/learn-kubernetes-in-under-3-hours-a-detailed-guide-to-orchestrating-containers-114ff420e882)

To install the application, run the following commands

`kubectl create ns demo  && kubectl label ns demo istio-injection=enabled`

This creates a demo namespace and enables istio proxy injection. 

`kubectl config set-context --current --namespace=demo`

This switches to the demo namespace in the current context. 

`git clone https://github.com/rinormaloku/master-istio.git && cd master-istio`

This clones a repository containing a sample application. 

`kubectl apply -f ./kube`

This will deploy the sample application. Validate the application. 
```
k get po -n demo
NAME                           READY   STATUS    RESTARTS   AGE
sa-feedback-7d9cfcfcdd-4fw62   2/2     Running   0          12h
sa-frontend-6968b849b5-6bm2c   2/2     Running   0          12h
sa-logic-5f89d59554-2vth8      2/2     Running   0          12h
sa-logic-5f89d59554-wt2mr      2/2     Running   0          12h
sa-webapp-67d5cbdccb-rnt4n     2/2     Running   0          12h
```

## Traffic management 
Before going into traffic management, it is imperative to understand the various components that aid traffic routing into the cluster 
* [Virtual services](https://istio.io/latest/docs/concepts/traffic-management/#virtual-services)
* [Destination Rules](https://istio.io/latest/docs/concepts/traffic-management/#destination-rules)
* [Gateways](https://istio.io/latest/docs/concepts/traffic-management/#destination-rules)
* [ServiceEntry](https://istio.io/latest/docs/concepts/traffic-management/#service-entries)


### Admitting traffic into the mesh/cluster 

Istio comes with a reverse proxy built on envoy which routes traffic to backend services. This is called an [ingress gateway](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/) and it acts as an entrypoint into the cluster. It also does loadbalancing and virtual hosting for backend services. From a technical perspective it is simply an envoy proxy (like the sidecar) , that sits at the edge of the cluster and is exposed outside of the cluster by a loadbalancer. 

To verify the ingress gateway is running, issue the command below 
`kubectl get svc -n istio-system -l istio=ingressgateway`

```
kubectl get svc -n istio-system -l istio=ingressgateway
NAME                   TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                                                                      AGE
istio-ingressgateway   LoadBalancer   10.104.1.247   34.123.224.92   15021:30045/TCP,80:30536/TCP,443:30515/TCP,31400:32708/TCP,15443:30053/TCP   9d`
```
You should see an external IP for the loadblancer. This external IP is the entry point into the cluster and should be mapped to a DNS basedomain like "myenterprise.com". Traffic hitting that domain will now be filtered and proxied to the right backend service. 

To configure this ingress gateway, we will need to create a [gateway](https://istio.io/latest/docs/reference/config/networking/gateway/). An example of a gateway can be seen below 

<details open>
<summary>Sample Gateway manifest</summary>
<br>

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: my-gateway
  namespace: some-config-namespace
spec:
  selector:
    app: my-gateway-controller
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - uk.bookinfo.com
    - eu.bookinfo.com
    tls:
      httpsRedirect: true # sends 301 redirect for http requests
  - port:
      number: 443
      name: https-443
      protocol: HTTPS
    hosts:
    - uk.bookinfo.com
    - eu.bookinfo.com
    tls:
      mode: SIMPLE # enables HTTPS on this port
      serverCertificate: /etc/certs/servercert.pem
      privateKey: /etc/certs/privatekey.pem
  - port:
      number: 9443
      name: https-9443
      protocol: HTTPS
    hosts:
    - "bookinfo-namespace/*.bookinfo.com"
    tls:
      mode: SIMPLE # enables HTTPS on this port
      credentialName: bookinfo-secret # fetches certs from Kubernetes secret
  - port:
      number: 9080
      name: http-wildcard
      protocol: HTTP
    hosts:
    - "*"
  - port:
      number: 2379 # to expose internal service via external port 2379
      name: mongo
      protocol: MONGO
    hosts:
    - "*"
```
</details>

This is a [sample](https://istio.io/latest/docs/reference/config/networking/gateway/) from the official docs but the principle is the same.  You use th gateway object to configure the ingress gateway. It serves as a route for traffic hitting the ingress gateway reverse proxy. It is analogous to the [ingress object](https://kubernetes.io/docs/concepts/services-networking/ingress/) in kubernetes , with the ingress gateway being analagous to the [ingress controller](https://docs.nginx.com/nginx-ingress-controller/). 


## Security using Istio 

Before we go into Istio security, there are a few concepts we need to understand that are key to getting how istio provides microservices security. 

- Authentication - is the ability is the ability to prove "who" you are.  In this case , it is a service or entity providing identification. 
- Authorization - is the ability to determine "what you can do" . In this case it could be a service or an entity trying to access a service within the mesh. 

An analogy would be having a badge as an employee working in an office.  The badge provides your identity and "athentication" but there are some rooms/offices you may not be "authorized" to access. 

### Authentication 

 - Peer Authentication 
 - RequestAuthentication 

Before understanding the concepts above it is imperative to know MTLS.  MTLS simply means Mutual TLS is a type of mutual authentication in which the two parties in a connection authenticate each other using the TLS protocol. So in this case both the client and the server authenticate using x509 certificates. 

Istio has multiple Mtls modes but the most important/used are the PERMISSIVE and STRICT policies. 

Permissive is the default and allows plain text traffic while strict - as the name denotes - only allows mutually authenticated traffic.   Peer authentication is configured using the Peer authentication  custom resource.   Expand the sample below

<details open>
<summary>Sample Peer Authentication manifest</summary>
<br>

```yaml
apiVersion: "security.istio.io/v1beta1"
kind: "PeerAuthentication"
metadata:
  name: "default"
  namespace: "istio-system"
spec:
  mtls:
    mode: STRICT
```
</details>

This manifest ensures strict MTLS across the ENTIRE mesh because of the `namespace: "istio-system"` section. Once it is applied to the istio-system namespace it propagates across the entire mesh.  It is possible to do a narrower scoped application at the namespace level and the applicaiton level via labels. 

 To test , we are going to make calls without peer authentication enabled. 

 Run the following command  
`kubectl create ns legacy && 
kubectl -n legacy run workload --image=radial/busyboxplus:curl -- tail -f /dev/null`

### Request Authentication 
In request authentication ( or end user authentication), users are authenticated using [JWTs](https://jwt.io/). These JWTs are typically issue by any OIDC  provider , however because the bigbang stack deploys keycloak , we will use it as our IDP. For the purpose of this demo we can spin up a keycloak instance. 

Run the following commands 
```bash
kubectl create ns keycloak
kubectl -n keycloak apply -f kube/idp/keycloak.yaml

# wait for the rollout
kubectl -n keycloak rollout status deploy/keycloak
```
Once we install the local keycloak server, we can configure it with the script 

```bash
# 1. Port forward to the local environment
kubectl port-forward svc/keycloak -n keycloak  8081:8080 &
PID=$!
sleep 2

# 2. Create client and users
export KEYCLOAK_URL=http://localhost:8081/auth

export KEYCLOAK_TOKEN=$(curl -d "client_id=admin-cli" -d "username=admin" -d "password=admin" -d "grant_type=password" "$KEYCLOAK_URL/realms/master/protocol/openid-connect/token" | jq -r .access_token)
echo $KEYCLOAK_TOKEN

# Create initial token to register the client
read -r client token <<<$(curl -H "Authorization: Bearer ${KEYCLOAK_TOKEN}" -X POST -H "Content-Type: application/json" -d '{"expiration": 0, "count": 1}' $KEYCLOAK_URL/admin/realms/master/clients-initial-access | jq -r '[.id, .token] | @tsv')

# Register the client
read -r id secret <<<$(curl -X POST -d "{ \"clientId\": \"sa-frontend\", \"implicitFlowEnabled\": true }" -H "Content-Type:application/json" -H "Authorization: bearer ${token}" ${KEYCLOAK_URL}/realms/master/clients-registrations/default| jq -r '[.id, .secret] | @tsv')

# Add allowed redirect URIs
curl -H "Authorization: Bearer ${KEYCLOAK_TOKEN}" -X PUT \
  -H "Content-Type: application/json" -d "{\"serviceAccountsEnabled\": true, \"directAccessGrantsEnabled\": true, \"authorizationServicesEnabled\": true, \"redirectUris\": [\"http://localhost:8080/\"]}" $KEYCLOAK_URL/admin/realms/master/clients/${id}

# Add the group attribute in the JWT returned by Keycloak
curl -H "Authorization: Bearer ${KEYCLOAK_TOKEN}" -X POST -H "Content-Type: application/json" -d '{"name": "group", "protocol": "openid-connect", "protocolMapper": "oidc-usermodel-attribute-mapper", "config": {"claim.name": "group", "jsonType.label": "String", "user.attribute": "group", "id.token.claim": "true", "access.token.claim": "true"}}' $KEYCLOAK_URL/admin/realms/master/clients/${id}/protocol-mappers/models

# Add the user type attribute in the JWT returned by Keycloak
curl -H "Authorization: Bearer ${KEYCLOAK_TOKEN}" -X POST -H "Content-Type: application/json" -d '{"name": "usertype", "protocol": "openid-connect", "protocolMapper": "oidc-usermodel-attribute-mapper", "config": {"claim.name": "usertype", "jsonType.label": "String", "user.attribute": "usertype", "id.token.claim": "true", "access.token.claim": "true"}}' $KEYCLOAK_URL/admin/realms/master/clients/${id}/protocol-mappers/models

# Create regular user
curl -H "Authorization: Bearer ${KEYCLOAK_TOKEN}" -X POST -H "Content-Type: application/json" -d '{"username": "user", "email": "user@acme.com", "enabled": true, "attributes": {"group": "users", "usertype": "regular"}, "credentials": [{"type": "password", "value": "password", "temporary": false}]}' $KEYCLOAK_URL/admin/realms/master/users

# Create beta user
curl -H "Authorization: Bearer ${KEYCLOAK_TOKEN}" -X POST -H "Content-Type: application/json" -d '{"username": "beta", "email": "beta@acme.com", "enabled": true, "attributes": {"group": "users", "usertype": "beta"}, "credentials": [{"type": "password", "value": "password", "temporary": false}]}' $KEYCLOAK_URL/admin/realms/master/users

# Create moderator user
curl -H "Authorization: Bearer ${KEYCLOAK_TOKEN}" -X POST -H "Content-Type: application/json" -d '{"username": "moderator", "email": "moderator@acme.com", "enabled": true, "attributes": {"group": "moderator", "usertype": "regular"}, "credentials": [{"type": "password", "value": "password", "temporary": false}]}' $KEYCLOAK_URL/admin/realms/master/users

# 3. Stop port-forwarding
kill $PID
```
For keycloak to be available to endusers , we will have to expose it via the ingress gateway.  Run the following command. 

`kubectl apply -f istio/vs-route-ingress-keycloak.yaml`

You can view the details of the virtualservice below 

<details open>
<summary>Keycloak Virtual Service</summary>
<br>

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: sa-external-services
spec:
  hosts:
  - "*"
  gateways:
  - http-gateway
  http:
  - match:
    - uri:
        exact: /
    - uri:
        prefix: /static
    - uri:
        regex: '^.*\.(ico|png|jpg)$'
    route:
    - destination:
        host: sa-frontend
        port:
          number: 80
  - match:
    - uri:
        prefix: /sentiment
    route:
    - destination:
        host: sa-webapp
        port:
          number: 80
  - match:
    - uri:
        prefix: /feedback
    route:
    - destination:
        host: sa-feedback
        port:
          number: 80
  - match:
    - uri:
        prefix: /auth
    route:
    - destination:
        host: keycloak.keycloak.svc.cluster.local
        port:
          number: 8080
```
</details>

Looking at the virtual service object , you can see that the uri path with the `/auth` suffix , has a destination of `keycloak.keycloak.svc.cluster.local`. Which is the keycloak server location in the cluster. 

To test this out , we update the deployment to use a rebuilt image with code that references keycloak. 

run the command - 

`kubectl set image deployment/sa-frontend \
    sa-frontend=rinormaloku/sentiment-analysis-frontend:keycloak`

Having configured keycloak we can now set up request authentication. 

```yaml 
apiVersion: "security.istio.io/v1beta1"
kind: "RequestAuthentication"
metadata:
  name: "keycloak-request-authn"
  namespace: istio-system
spec:
  selector:
    matchLabels:
      app: istio-ingressgateway
  jwtRules:
  - issuer: "http://localhost:8080/auth/realms/master" (1)
    jwksUri: http://keycloak.keycloak.svc:8080/auth/realms/master/protocol/openid-connect/certs (2)
```

The sample request authentication is shown above. 

From the RequestAuthenication custom resource, you can see the rules under `jwtRules`. 
- Any token matching the issuer `http://localhost:8080/auth/realms/master` will be authenticated. 
- Tokens are validated against the JSON Web token Keysets found at the ` http://keycloak.keycloak.svc:8080/auth/realms/master/protocol/openid-connect/certs` uri.


Apply the yaml 

`kubectl apply -f istio/security/request-authentication.yaml`. 

It is important to note that The RequestAuthentication resource only authenticates requests containing the JWT. Other requests will be let through. 

Validate by running the command 

```bash
curl -S http://localhost:8080/sentiment \
    -H "Content-type: application/json" \
    -d '{"sentence": "I love yogobella"}'
```

Requests which have a JWT will have the identity data stored in the connection metadata. The connection metadata are referred to as connection identity or request identity.
The policies make decisions to admit or reject traffic based on the request identity

## Authorization 

Authorization is the process of determining if an an authenticated subject can perform an action. The envoy proxy which is a sidecar in containers in the mesh is the authorization implementation point. Istio configures this through a custom resource called Authorization policy
- Authorization Policy 

An example is shown below 

<details open>
<summary>Sample Authorization Policy</summary>
<br>

```yaml
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata:
  name: allow-view
  namespace: istio-system
spec:
  selector:
    matchLabels:
      app: istio-ingressgateway
  action: ALLOW
  rules:
  - to:
    - operation:
        paths: ["/", "/static*", "/auth*"]
```
</details>

This policy enables access , meshwide , to the paths `/` , `/static` and `/auth` which map to the sa-frontend and keycloak services respectively.

Apply the manifest to the cluster .

`kubectl apply -f istio/security/allow-view.yaml`


With the policy below, we allow requests from any of the matching requestPrincipals for all paths prefixed with /sentiment.

``` yaml 
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata:
  name: allow-analysis
  namespace: istio-system
spec:
  selector:
    matchLabels:
      app: istio-ingressgateway
  action: ALLOW
  rules:
  - from:
    - source:
        requestPrincipals: ["*"]
    to:
    - operation:
        paths: ["/sentiment*"]
```
For a policy to apply to incoming traffic, it must match both the source and the operation. For example, the above policy will apply and allow traffic only if:

- It matches the source in the rules. 
- It matches the paths in the operations. 



## Conclusion 

This document is meant to serve as a quickstart to getting up and running with Istio andthe example is taken from [], however to get more detailed information on learning and using istio , the following resources are recommended. 


- [Tetrate academy istio training](https://academy.tetrate.io/courses/istio-fundamentals)
- [Red hat Istio Tutorial](https://redhat-scholars.github.io/istio-tutorial/istio-tutorial/1.9.x/index.html)
- [ Tetrate Istio Weekly](https://www.youtube.com/watch?v=8X_pSA5eRTY&list=PLm51GPKRAmTnMzTf9N95w_yXo7izg80Jc)
- [Istio by example](https://istiobyexample.dev/)