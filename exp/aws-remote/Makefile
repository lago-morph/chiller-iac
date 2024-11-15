define DOCS
Set up for remote backend

backend-init    Create S3 bucket, DynamoDB table, and output to backend.tf

endef

MAKEFLAGS += --jobs

S3B := chiller-state-bucket-$(shell openssl rand -hex 10)
DDBNAME := terraformstatelock
DDBKEY := LockID
REGION := $(shell aws configure get region)
TFBACKENDFILE := backend.tf

.ONESHELL:

# dummy target does nothing when make without arguments
export DOCS
show-usage: 
	@echo "$$DOCS"


create-resources:
	aws s3 mb s3://$(S3B)
	aws dynamodb create-table \
		  --table-name $(DDBNAME) \
		  --key-schema AttributeName=$(DDBKEY),KeyType=HASH \
		  --attribute-definitions AttributeName=$(DDBKEY),AttributeType=S \
		  --billing-mode PAY_PER_REQUEST

output-file:
	cat <<EOF > $(TFBACKENDFILE)
	terraform {
	  backend "s3" {
	    bucket                 = "$(S3B)"
	    region                 = "$(REGION)"
	    key                    = "backend.tfstate"
	    dynamodb_table         = "$(DDBNAME)"
	  }
	}
	EOF

backend-init: create-resources output-file

