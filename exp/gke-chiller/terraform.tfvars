# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Need both a region and a zone in order to build a "zonal" cluster.  
# If we provide a region when creating the cluster (e.g., us-central1), 
# it will create 
# masters and nodes spread across the various zones within the region.
# So if I select a region with 3 zones, then defining a cluster with 2
# nodes will result in 1 master and 2 nodes per zone (3 masters, 6 nodes)
# That's not what I want for a testing cluster.  Maybe for production.
# However, I still need the region key for things like vpcs which are targeted
# at regions, not zones

project_id = "chiller-load-test"
region     = "us-central1"
zone       = "us-central1-a"
