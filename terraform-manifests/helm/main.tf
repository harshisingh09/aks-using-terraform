resource "helm_release" "ingress_controller" {
    name = "nginx-ingress"
    repo = "https://helm.nginx.com/stable"
    chart = "nginx-ingress"
    version = "0.13.2"
    create_namespace = true
    namespace = "ingress-nginx"

}