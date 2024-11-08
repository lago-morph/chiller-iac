This project will maintain the chiller-load-test GKE environment.

Note - after terraform apply for new cluster, need to do the following to get 
access:
```
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --zone $(terraform output -raw zone)
```

There will be GitHub Actions which *use* this environment, but they will not
use Terraform.

There are two components to the project:
- Terraform scripts to manage the google cloud bits of the cluster
- Helm charts to manage the runtime environment
  - Prometheus
  - Grafana
  - Open Telemetry (future)
  - Jaeger (future)
  - Istio (future)

GitHub Actions which use this environment will:
- Generate a uuid for the specific test instance being run
- Create a GitHub Issue with the uuid in the subject of the issue
- Create a unique namespace 
- Use helm to install the chiller application
  - Store the output of the helm run as a comment in the Issue
- Install the load testing pods
  - Store the output of the helm run as a comment in the Issue
- Run the test and generate whatever metrics are needed
  - Stop the load testing once the run is finished (this should be a flag so the load testing containers remain in place)
  - Store the output of the test as a comment in the Issue
- If the test is successful, close the issue (triggering the next step)

Closing one of these GH Issues triggers an Action that will:
- Remove the load testing nodes from the namespace
- Uninstall the chiller application from the namespace
- Delete the namespace

Use the chiller-load-test gcloud project

Create a "manual" TF process that maintains the chiller-load-test
GKE cluster.  Initial creation and eventual deletion is done outside of
GH Actions.  I will store state locally for now, later I can store in GC bucket.

For the purposes of this document an "environment" is:
- A CS bucket for storing terraform state (google_storage_bucket) (not now)
- A GKE cluster (google_container_cluster)
- A GKE node pool (google_container_node_pool)
- A VPC (google_compute_network)
- A VPC subnet (google_compute_subetwork)

I will use my own admin account to run these operations.

For future reference, if I wanted to create a service account to do this then
I would give it the following permissions just in the chiller-load-test
project (part of this is for GC bucket remote state):
storage.buckets.create
storage.buckets.list
storage.objects.get
storage.objects.create
storage.objects.delete
storage.objects.update
roles/container.admin
roles/compute.admin

The terraform bits will:
# not now- create a Cloud Storage bucket for remote state (the tfstate var will be local)
# not now- migrate the state to the CS bucket
- Create the cloud resources for the GKE
