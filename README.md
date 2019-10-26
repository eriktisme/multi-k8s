# multi-k8s

* Install [Helm](https://helm.sh/docs/using_helm/#from-script) on Google GKE using a script.
* Configure [RbAC](https://helm.sh/docs/using_helm/#role-based-access-control) before we can run `helm init`
* Install [NGINX Ingress](https://kubernetes.github.io/ingress-nginx/deploy/#using-helm) on Google GKE using a command.

### Configuring Role-based Access Control
First step is to create a service account for tiller
`kubectl create serviceaccount --namespace kube-system tiller`

After that we need to create a cluster role binding
`kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller`

Once we have configured our role-bases access control we can run `helm init --service-account tiller --upgrade` to initialize Helm.

