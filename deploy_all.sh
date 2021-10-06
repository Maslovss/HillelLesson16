#!/bin/sh

terraform apply -auto-approve

ansible-playbook --private-key k8s_ssh_key.pem -u ubuntu -i aws_hosts deploy_packages.yaml
ansible-playbook --private-key k8s_ssh_key.pem -u ubuntu -i aws_hosts deploy_cluster.yaml
ansible-playbook --private-key k8s_ssh_key.pem -u ubuntu -i aws_hosts deploy_nodes.yaml
ansible-playbook --private-key k8s_ssh_key.pem -u ubuntu -i aws_hosts deploy_helm.yaml

