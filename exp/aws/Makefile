define DOCS
Convenience helpers for Watch and Chill IaC

kubectl    Update kubectl with auth from Terraform run

endef

MAKEFLAGS += --jobs

AWS_REGION := $(shell terraform output -raw region)
AWS_EKS_NAME := $(shell terraform output -raw eks_cluster_name)
.ONESHELL:

# dummy target does nothing when make without arguments
export DOCS
show-usage: 
	@echo "$$DOCS"

kubectl:
	aws eks update-kubeconfig --region $(AWS_REGION) --name $(AWS_EKS_NAME)
