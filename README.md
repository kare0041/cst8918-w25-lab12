# Terraform CI/CD on Azure with GitHub Actions

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision and manage Azure resources such as a virtual network and a subnet. The focus is on automating the infrastructure lifecycle and CI/CD workflows using GitHub Actions.

## Lab Scenario


- The Terraform configuration provisions Azure resources and deploys a virtual network and a subnet.
- CI/CD automation is implemented with GitHub Actions workflows for static analysis, integration testing, deployment, and drift detection.

## Folder Structure

```
cst8918-w25-lab12
├── .github
│   └── workflows
│       ├── infra-ci-cd.yml
│       ├── infra-drift-detection.yml
│       └── infra-static_tests.yml
├── app
│   └── .gitkeep
├── infra
│   ├── az-federated-credential-params
│   │   ├── branch-main.json
│   │   ├── production-deploy.json
│   │   └── pull-request.json
│   ├── tf-app
│   │   ├── .tflint.hcl
│   │   ├── main.tf
│   │   ├── terraform.tf
│   │   └── tf-app.plan
│   └── tf-backend
│       ├── main.tf
│       └── tf-backend.plan
├── screenshots
│   ├── PR Terraform plan 1.png
│   ├── PR Terraform plan 2.png
│   └── PR workflows.png
└── README.md
```

## Infrastructure Details

- **Backend State:**
  - `infra/tf-backend` contains Terraform code to provision an Azure resource group, storage account, and container for storing the Terraform state file remotely.
- **Application Infrastructure:**
  - `infra/tf-app` provisions the resource group, virtual network, and subnet for the application. The backend is configured to use the remote state created above.
  - `.tflint.hcl` configures static analysis for Terraform code.
- **Federated Credentials:**
  - `infra/az-federated-credential-params` contains JSON files for configuring Azure federated credentials for GitHub Actions OIDC authentication.

## GitHub Actions Workflows

- **Static Code Analysis:**
  - `.github/workflows/infra-static_tests.yml` runs on every push. It performs Terraform validation, formatting, and security scanning using `tfsec`.
- **Integration Tests & Deployment:**
  - `.github/workflows/infra-ci-cd.yml` runs on pull requests and pushes to `main`. It performs `terraform plan` for PRs and applies changes on merge to `main`.
- **Drift Detection:**
  - `.github/workflows/infra-drift-detection.yml` runs daily and on demand. It checks for configuration drift between the deployed infrastructure and the Terraform configuration, opening or closing GitHub issues as needed.

## Lab Steps

1. **Repository Setup:**
   - Create a GitHub repository and invite your teammate as a collaborator.
   - Set up environment and branch protection rules.
2. **Remote State Configuration:**
   - Use `infra/tf-backend` to provision Azure Blob Storage for remote Terraform state.
3. **Azure Credentials:**
   - Create Azure access credentials for GitHub Actions automation.
   - Add Azure identity values as secrets in your GitHub repository.
4. **Terraform Configuration:**
   - Update `infra/tf-app` to use the Azure identity values and remote backend.
5. **CI/CD Workflows:**
   - Implement GitHub Actions workflows for:
     - Static analysis (`infra-static_tests.yml`)
     - Integration tests and deployment (`infra-ci-cd.yml`)
     - Drift detection (`infra-drift-detection.yml`)
6. **Testing:**
   - Test the workflows by making changes to the Terraform configuration and observing the automated checks and deployments.

> **Note:** Collaboration is required. Both team members must contribute and review code via pull requests.

## Group Members

| Name             | GitHub Username | Profile Link                                 |
|------------------|-----------------|----------------------------------------------|
| Nidhi Desai      | @Nidhi0152      | [Nidhi0152](https://github.com/Nidhi0152)    |
| Daniel Karengera | @kare0041       | [kare0041](https://github.com/kare0041)      |
| Satkirat Kaur    | @kaur1852       | [Satkirat-kaur](https://github.com/Satkirat-kaur) |

## Screenshots

### Pull Request workflows
![PR workflows](screenshots/PR%20workflows.png)

### Pull Request Terraform plan 1
![PR Terraform plan 1](screenshots/PR%20Terraform%20plan%201.png)

### Pull Request Terraform plan 2
![PR Terraform plan 2](screenshots/PR%20Terraform%20plan%202.png)

