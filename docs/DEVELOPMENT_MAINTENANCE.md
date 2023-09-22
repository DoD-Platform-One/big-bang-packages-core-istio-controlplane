# How to upgrade the Istio ControlPlane Package chart
1. Checkout the branch that renovate created. This branch will have the image tag updates and typically some other necessary version changes that you will want. You can either work off of this branch or branch off of it.
1. Update the dashboards via `kpt`. You should be able to run `kpt pkg update chart/dashboards@<version> --strategy force-delete-replace` (ex: `kpt pkg update chart/dashboards@1.14.3 --strategy force-delete-replace`).
1. Update version references for the Chart. `version` should be `<version>-bb.0` (ex: `1.14.3-bb.0`) and `appVersion` should be `<version>` (ex: `1.14.3`). Also validate that the BB annotation for the main Istio version is updated (leave the Tetrate version as-is unless you are updating those images).
1. Add a changelog entry for the update. At minimum mention updating the image versions.
1. Update the readme following the [steps in Gluon](https://repo1.dso.mil/platform-one/big-bang/apps/library-charts/gluon/-/blob/master/docs/bb-package-readme.md).
1. Open MR (or check the one that Renovate created for you) and validate that the pipeline is successful. Also follow the testing steps below for some manual confirmations.

# Testing new Istio ControlPlane version
Generally the controlplane update should be tested alongside the new operator version. Follow the steps below for testing both. You should perform these steps on both a clean install and an upgrade from BB master.

1. Update your values overrides to point to your branches for both the operator and controlplane:
    ```yaml
    istio:
      git:
        tag: null
        branch: "renovate/ironbank" # Or your branch
    istioOperator:
      git:
        tag: null
        branch: "renovate/ironbank" # Or your branch
    ```
1. Also deploy the following:
- Jaeger with SSO enabled. Use the dev sso values for Jaeger [here](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/assets/configs/example/dev-sso-values.yaml). Also, be sure to disable Tempo (necessary to deploy Jaeger in this way). 
- Kiali
- Monitoring
These packages all interact with Istio in ways that are helpful to test.
1. Navigate to Jaeger (tracing.bigbang.dev) and validate you are prompted to login with SSO and that the login is successful. This verifies that Authservice is working as an Istio extension.
1. Navigate to Prometheus and validate that the Istio targets are up (under Status -> Targets). There should be targets for istio-envoy and istio-pilot.
1. Navigate to Grafana and validate that the Istio dashboards are present and show some data. You may need to alter filters to pick a workload that has information showing.
1. Navigate to Kiali and validate that data is showing. You can run through the checks done during release testing if you are unsure what to look for. Since Kiali interfaces with Istio for most of its information it is good to validate compatibility/functionality.
