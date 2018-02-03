#!/usr/bin/env bash
# Example of deploying an nginx ingress controller using Helm.
# On GKE this will configure a Cloud L4 outer load balancer (TCP) and Nginx inside the cluster for L7.
# The loadBalancerIP can be used if you have a static IP to assign to the outer L4 load balancer service.
# If this is not set a dynamic IP will be assigned.
# The publishService.enabled attribute will tell nginx to publish the L4 IP as the ingress IP.

# Set this IP to your reserved IP. Must be in the same zone as your cluster.
MYIP=xx.xx.xx.xx
helm install --namespace nginx  --set "controller.service.loadBalancerIP=$MYIP" \
    --set rbac.create=true \
    --set "controller.publishService.enabled=true"  stable/nginx-ingress




