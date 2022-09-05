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

## Traffic management 