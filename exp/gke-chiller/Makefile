define DOCS
Convenience helpers for maintaining Watch and Chill load test environment

In general:
make gc-auth
make apply (this takes ~10 minutes)
make k-auth
make install-runtime
make grafana-pf  (do this in its own shell)
make prom-pf     (do this in its own shell)
(do whatever)
make destroy


Set project context:      gc-auth
Get kubectl auth:         k-auth

Terraform stuff:          init plan apply destroy
Grafana and Prom.:        install-runtime
Port forward local:       grafana-pf prom-pf
endef

export DOCS
help:
	@echo "$$DOCS"

gc-auth:
	gcloud config set project chiller-load-test
	gcloud auth application-default set-quota-project chiller-load-test

k-auth:
	gcloud container clusters get-credentials $(shell terraform output -raw kubernetes_cluster_name) --zone $(shell terraform output -raw zone)

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

destroy:
	terraform destroy

install-runtime:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo update
	helm install kps prometheus-community/kube-prometheus-stack

grafana-pf:
	kubectl port-forward --address=192.168.88.130 svc/kps-grafana 3000:80

prom-pf:
	kubectl port-forward --address=192.168.88.130 svc/prometheus-operated 9090

