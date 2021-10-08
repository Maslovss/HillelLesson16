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

