# Considerations

In order to use this configuration file (main.tf), you will need to be have installed terraform and az equivalent utility (depending on your OS), 
and to be logged in on Azure.

The main.tf config file creates a simple but yet functional Kubernetes cluster on Azure.

## Commands to create k8s cluster on Azure after meeting requirements

1 - terraform init <br>
2 - terraform plan -o k8s.plan <br>
3 - terraform apply "k8s.plan"
