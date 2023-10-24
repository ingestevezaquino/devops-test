# Initial k8s config file

This is an add-on, here I automate with ansible some basic configuration related to target namespace and service account for a k8s cluster.

## Requirements:

1 - Ansible core installed on your hosts <br>
2 - To have kubectl already configured / connected to target k8s <br>
3 - Install ansible collection: kubernetes.core <br>

## How to use:

Run:
```
ansible-playbook main.yaml
```
