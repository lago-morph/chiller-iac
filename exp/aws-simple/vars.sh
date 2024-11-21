#!/bin/bash
#
export MONITOR_IP=`terraform output -raw monitor_public_ip`
export WEB_IP=`terraform output -raw web_public_ip`

