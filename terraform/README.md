# Considerations

In order to use this configuration file (main.tf), you will need to be have installed terraform and az equivalent utility (depending on your OS), 
and to be logged in on Azure.

The main.tf config file creates a simple but yet functional Kubernetes cluster on Azure.

## How to use:

```
terraform init
terraform plan -o k8s.plan
terraform apply "k8s.plan"
```
