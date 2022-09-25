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

To install the application , run the following commands

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

Istio comes with a reverse proxy built on envoy which routes traffic to backend services. This is called an [ingress gateway]() and it acts as an entrypoint into the cluster. It also does loadbalancing and virtual hosting for backend services. From a technical perspective it is simply an envoy proxy (like the sidecar) , that sits at the edge of the cluster and is exposed outside of the cluster by a loadbalancer. 

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
### Canary Deployments 

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


### Authorization 
- Authorization Policy 