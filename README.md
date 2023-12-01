# Deploying Azure AKS with Application Gateway and Flux extension - An introduction to GitOps

In this blog post/tutorial, we will cover the following topics:
- Where we'll dive into a range of topics that are all deployed using GitHub Actions and Terraform. The focus is on deploying key components:
- Azure AKS Cluster: The foundation for the next components, will deploy to AKS using GitOps
- Azure Application Gateway: Seamlessly connected to the AKS cluster as an Ingress Controller as part of the Terraform deployment
- Flux GitOps Extension on AKS: Unleashing the potential of GitOps for streamlined cluster management.
- Sample Application Deployment with Flux: Taking a hands-on approach to deploying applications onto the AKS cluster.
- Sample Flux Configuration Deployment: Understanding the practical application of Flux in a real-world scenario.
