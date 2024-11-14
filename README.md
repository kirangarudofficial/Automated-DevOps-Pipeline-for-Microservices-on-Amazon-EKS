
# End-to-End DevOps Pipeline for Microservices on Amazon EKS

## Table of Contents
- [Overview](#overview)
- [Project Structure](#project-structure)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Monitoring and Alerting](#monitoring-and-alerting)
- [Scripts](#scripts)
- [Contributing](#contributing)
- [License](#license)

---

## Overview
This project is a complete DevOps pipeline for deploying and managing microservices on Amazon Elastic Kubernetes Service (EKS). It includes infrastructure provisioning with Terraform, CI/CD pipeline setup using Jenkins, Docker containerization, Kubernetes orchestration, and real-time monitoring with Prometheus and Grafana. The pipeline supports code quality analysis, security scanning, and test coverage, with a blue-green deployment strategy for zero-downtime deployments.

---

## Project Structure

```plaintext
DevOps-EKS-Pipeline/
├── README.md                   # Project documentation
├── terraform/                  # Infrastructure-as-Code using Terraform
│   ├── main.tf                 # Main Terraform configuration file
│   ├── variables.tf            # Variable definitions
│   ├── outputs.tf              # Output variables for VPC and EKS cluster details
│   └── eks/
│       ├── vpc.tf              # VPC configuration (subnets, gateways, etc.)
│       ├── eks-cluster.tf      # EKS cluster configuration
│       └── node-group.tf       # EKS node group configuration
├── kubernetes/                 # Kubernetes deployment manifests
│   ├── deployment.yaml         # Application deployment configuration
│   ├── service.yaml            # Service configuration for external access
│   ├── configmap.yaml          # ConfigMap for environment variables and settings
│   └── secrets.yaml            # Secrets for sensitive information
├── jenkins/                    # Jenkins CI/CD configuration
│   ├── Jenkinsfile             # Pipeline definition
│   └── Dockerfile              # Dockerfile for Jenkins setup (if needed)
├── monitoring/                 # Monitoring configurations
│   ├── prometheus-config.yaml  # Prometheus configuration
│   ├── grafana-config.yaml     # Grafana dashboards and settings
│   └── alerts.yaml             # Prometheus alerting rules
└── scripts/                    # Helper scripts
    ├── build-docker.sh         # Docker image build script
    ├── scan-security.sh        # Security scan using Trivy
    └── deploy-to-eks.sh        # Deployment script to EKS
```

---

## Features
- **Infrastructure as Code (IaC)**: Automate AWS infrastructure provisioning with Terraform.
- **CI/CD Pipeline**: Configured in Jenkins to automate build, test, scan, and deployment processes.
- **Containerization**: Application containerized with Docker for consistency across environments.
- **Orchestration**: Deploy microservices on Amazon EKS, managing scalability and resilience.
- **Monitoring and Alerting**: Prometheus and Grafana provide real-time observability and alerting.
- **Code Quality and Security**: SonarQube, Trivy, and JaCoCo for code quality, security, and test coverage.
- **Blue-Green Deployment**: Supports zero-downtime deployment.

---

## Technologies Used
- **AWS**: EKS, VPC, IAM, and other resources provisioned via Terraform.
- **Terraform**: Infrastructure automation tool for managing cloud resources.
- **Jenkins**: CI/CD automation server for managing the pipeline.
- **Docker**: For containerizing applications.
- **Kubernetes**: Orchestration of containerized microservices on EKS.
- **SonarQube, Trivy, JaCoCo**: Code quality, security, and test coverage analysis.
- **Prometheus and Grafana**: Monitoring and alerting for application performance.

---

## Getting Started
To get started with this project, you will need:
- An AWS account with permissions to create EKS clusters and VPC resources.
- AWS CLI, Terraform, Docker, and kubectl installed on your local machine.
- A Jenkins server for CI/CD pipeline (optional Docker setup provided).
  
---

## Setup Instructions

### 1. Clone the Repository
```bash
git clone <repository-url>
cd DevOps-EKS-Pipeline
```

### 2. Configure AWS Credentials
Ensure your AWS CLI is configured to deploy resources on AWS:
```bash
aws configure
```

### 3. Provision Infrastructure with Terraform
Navigate to the `terraform/` directory and execute the following commands to set up the VPC and EKS cluster:
```bash
cd terraform/
terraform init
terraform plan
terraform apply
```

### 4. Deploy Jenkins Pipeline
1. Set up Jenkins on an EC2 instance or local machine, or use the provided Docker setup in the `jenkins/` directory.
2. Install necessary plugins in Jenkins: Docker, Kubernetes, Git, and Terraform.
3. Add a Jenkins pipeline using the `Jenkinsfile` provided in `jenkins/`.

### 5. Build Docker Images
Build and push Docker images for the application:
```bash
cd scripts/
./build-docker.sh
```

### 6. Deploy Application to EKS
Apply Kubernetes manifests to deploy your application on the EKS cluster:
```bash
cd kubernetes/
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f configmap.yaml
kubectl apply -f secrets.yaml
```

---

## Usage

### CI/CD Pipeline
The Jenkins pipeline automates the following stages:
1. **Build**: Builds the Docker image and pushes it to a registry.
2. **Code Quality and Security Scan**: SonarQube, Trivy, and JaCoCo for analysis.
3. **Deploy**: Deploys to EKS using blue-green deployment strategy.

### Blue-Green Deployment
The `Jenkinsfile` is configured to perform a blue-green deployment to ensure zero downtime during updates. The new version of the service is deployed alongside the old one, and traffic is routed to the new version once validation is complete.

---

## Monitoring and Alerting
The project uses Prometheus and Grafana for real-time monitoring and alerting.

1. **Prometheus**:
   - Configure Prometheus to scrape metrics from Kubernetes components and application endpoints.
   - Use `prometheus-config.yaml` for setting up Prometheus.

2. **Grafana**:
   - Set up Grafana to visualize metrics collected by Prometheus.
   - Use `grafana-config.yaml` for dashboard configurations.

3. **Alerts**:
   - Alerts are configured in `alerts.yaml` to notify the DevOps team in case of any issues.

---

## Scripts
The following scripts are included for automation:

- **`build-docker.sh`**: Builds Docker images for the microservices and pushes them to a Docker registry.
- **`scan-security.sh`**: Runs Trivy security scans on Docker images.
- **`deploy-to-eks.sh`**: Deploys the application to the EKS cluster.

Example of running a script:
```bash
./scripts/build-docker.sh
```

---

## Contributing
Contributions are welcome! Please follow the standard Git workflow:
1. Fork the repository.
2. Create a new branch (`feature/your-feature`).
3. Commit your changes.
4. Push to the branch and create a pull request.

---

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
