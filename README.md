# infra-templates
Production-ready infrastructure templates for AWS, GCP, and Azure.

## Available Templates

### AWS
- **ECS Fargate** (`aws/ecs-fargate`) - Containerized applications with Application Load Balancer
- **Lambda API** (`aws/lambda-api`) - Serverless API with API Gateway  
- **RDS Postgres** (`aws/rds-postgres`) - Managed PostgreSQL database

### Azure
- **App Service + SQL Database** (`azure/app-service-sql`) - Web applications with Azure SQL Database
- **AKS Cluster** (`azure/aks-cluster`) - Managed Kubernetes cluster with auto-scaling
- **Container Apps** (`azure/container-apps`) - Serverless containers with HTTPS ingress
- **Functions + Cosmos DB** (`azure/functions-cosmosdb`) - Serverless functions with NoSQL database

### GCP
- **Cloud Run** (`gcp/cloud-run`) - Serverless containers

### Kubernetes
- **Base** (`k8s/base`) - Basic Kubernetes manifests with Kustomize

## Usage

Each template includes:
- **main.tf** - Main Terraform configuration
- **variables.tf** - Input variables with defaults
- **outputs.tf** - Output values
- **modules/** - Reusable modules (where applicable)

To use a template:

1. Copy the template directory to your project
2. Update `variables.tf` with your values
3. Configure the backend in `main.tf`
4. Run `terraform init && terraform plan && terraform apply`

## Features

- ✅ Production-ready configurations
- ✅ Modular and reusable components  
- ✅ Security best practices
- ✅ Auto-scaling and monitoring
- ✅ CI/CD validation
- ✅ Comprehensive documentation

<!-- last-ci-trigger: 2026-02-17T20:16:30.384Z -->