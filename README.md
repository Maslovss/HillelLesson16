# HillelLesson16

## Deploy kubernetes cluster in aws cloud using kubeadm

### Using

- Edit terraform.tfvars
- sh deploy_all.sh
- Drink two cups coffee
- After script ending login to master node:

```
ssh -i k8s_ssh_key.pem ubuntu@`awk '/master/{getline; print}' aws_hosts`
```

### Requirements

- Installed ansible
- Installed and configured AWS CLI

### Result
```
ubuntu@k8s-master:~$ sudo kubectl get pods --all-namespaces
NAMESPACE             NAME                                                     READY   STATUS      RESTARTS   AGE
cattle-fleet-system   fleet-agent-b94869475-cpdj8                              1/1     Running     0          2m4s
cattle-fleet-system   fleet-controller-974d9cc9f-bf52b                         1/1     Running     0          3m18s
cattle-fleet-system   gitjob-5778966b7c-fsx66                                  1/1     Running     0          3m18s
cattle-system         helm-operation-7wfv5                                     0/2     Completed   0          2m56s
cattle-system         helm-operation-l9zvv                                     0/2     Completed   0          2m27s
cattle-system         helm-operation-sbkqh                                     0/2     Completed   0          3m36s
cattle-system         helm-operation-wchgc                                     0/2     Completed   0          2m44s
cattle-system         rancher-76cc8c9498-6ffrw                                 1/1     Running     0          5m14s
cattle-system         rancher-76cc8c9498-7mvks                                 1/1     Running     0          5m14s
cattle-system         rancher-76cc8c9498-wmxw5                                 1/1     Running     0          5m14s
cattle-system         rancher-webhook-7f84b74ddb-5qkgw                         1/1     Running     0          2m38s
cert-manager          cert-manager-74f46787b6-q5t4z                            1/1     Running     0          5m43s
cert-manager          cert-manager-cainjector-748dc889c5-ps72p                 1/1     Running     0          5m43s
cert-manager          cert-manager-webhook-5b679f47d6-smxsv                    1/1     Running     0          5m43s
default               provisioner-bqrn9                                        1/1     Running     0          6m17s
default               provisioner-kt6bc                                        1/1     Running     0          6m17s
kube-system           calico-kube-controllers-75f8f6cc59-8qtn7                 1/1     Running     0          6m56s
kube-system           calico-node-8pk59                                        1/1     Running     0          6m53s
kube-system           calico-node-8zft2                                        1/1     Running     0          6m53s
kube-system           calico-node-jhgmk                                        1/1     Running     0          6m57s
kube-system           coredns-558bd4d5db-rzxts                                 1/1     Running     0          6m56s
kube-system           coredns-558bd4d5db-vpqg9                                 1/1     Running     0          6m56s
kube-system           etcd-k8s-master.local                                    1/1     Running     0          7m9s
kube-system           kube-apiserver-k8s-master.local                          1/1     Running     0          7m9s
kube-system           kube-controller-manager-k8s-master.local                 1/1     Running     0          7m11s
kube-system           kube-proxy-8xfr5                                         1/1     Running     0          6m57s
kube-system           kube-proxy-dkb57                                         1/1     Running     0          6m53s
kube-system           kube-proxy-pzkfh                                         1/1     Running     0          6m53s
kube-system           kube-scheduler-k8s-master.local                          1/1     Running     0          7m9s
monitoring            alertmanager-prometheus-kube-prometheus-alertmanager-0   2/2     Running     0          5m39s
monitoring            prometheus-grafana-7d4d5546dc-k7m7r                      2/2     Running     0          5m56s
monitoring            prometheus-kube-prometheus-operator-68474bf579-n47rz     1/1     Running     0          5m56s
monitoring            prometheus-kube-state-metrics-58c5cd6ddb-89k7q           1/1     Running     0          5m56s
monitoring            prometheus-prometheus-kube-prometheus-prometheus-0       2/2     Running     0          5m39s
monitoring            prometheus-prometheus-node-exporter-2w29f                1/1     Running     0          5m56s
monitoring            prometheus-prometheus-node-exporter-gtxhc                1/1     Running     0          5m56s
monitoring            prometheus-prometheus-node-exporter-s5m8j                1/1     Running     0          5m56s
vault                 vault-0                                                  0/1     Running     0          2m56s
vault                 vault-agent-injector-6d76cf96d4-59lbb                    1/1     Running     0          2m56s

```
