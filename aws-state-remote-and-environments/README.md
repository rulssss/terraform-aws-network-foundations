# 🌐 Terraform AWS Networking Lab (Dev & Prod)

Base infrastructure on AWS using Terraform, featuring environment separation (**dev** and **prod**), remote state in S3, and automated deployment via GitHub Actions.

---

## 📌 Objective

This project implements a foundational network on AWS following best practices:

- Use of **reusable modules**
- Environment separation (`dev` and `prod`)
- Remote state with **S3 + DynamoDB (locking)**
- CI/CD with GitHub Actions
- Automated deployment in `dev` and controlled deployment in `prod`

---

## 🧱 Infrastructure Created

- VPC
- Public and private subnets
- Internet Gateway (IGW)
- Route Tables
- Security Groups

⚠️ NAT Gateway is not used to avoid costs.

## ⚙️ Backend (Remote State)

Terraform stores the state in:

- 🪣 S3 → state storage
- 🔒 DynamoDB → locking (prevents concurrent executions)

### Backend Initialization

```bash
cd bootstrap
terraform init
terraform apply
```

This creates:

- S3 bucket
- DynamoDB table

---

## 🚀 How to Deploy

---

### 🟢 DEV (Automated)

#### Trigger

- Changes in:
  * `modules/`
  * `environments/dev/`

#### Workflow

```text
Commit → GitHub Actions → terraform apply (dev)
```

#### Characteristics

- Automated
- No approval required
- Testing environment

---

### 🔴 PROD (Controlled)

#### Trigger

- Changes in:

```text
environments/prod/
```

#### Workflow

```text
Intentional change → Push → GitHub Actions → Approval → Apply
```

#### Characteristics

- Requires manual approval
- Does not deploy automatically when module files change
- Represents a real production environment

---

## 🧠 How to Promote Changes to Production

1. Make changes in `modules/`
2. Verify in DEV (automated deploy)
3. Update PROD with an intentional change, for example:

```hcl
release_version = "v2"
```

4. Push changes
5. Approve the deployment in GitHub Actions

---

## 🔄 CI/CD (GitHub Actions)

### DEV Workflow

- Executes:
  * `terraform init`
  * `terraform plan`
  * `terraform apply`

- Triggered by changes in:

  ```text
  modules/**
  environments/dev/**
  ```

---

### PROD Workflow

- Executes:
  * `terraform init`
  * `terraform plan`
  * (waits for approval)
  * `terraform apply`

- Triggered by changes in:

  ```text
  environments/prod/**
  ```

---

## ⚠️ Best Practices Implemented

- ❌ Do not apply changes to PROD from a local machine
- ✅ Use of reusable modules
- ✅ Environment separation via state
- ✅ CI/CD for deployments
- ✅ Manual control in production

---

## 🧪 Destroy Infrastructure

### DEV

```bash
cd environments/dev
terraform destroy
```

### PROD

```bash
cd environments/prod
terraform init -reconfigure
terraform destroy
```

---

## 💸 Costs

This project avoids costly resources:

- ❌ NAT Gateway
- ❌ EC2

👉 Virtually free infrastructure (networking only)

---

## 🧠 Concepts Applied

- Infrastructure as Code (IaC)
- Terraform Modules
- Remote State
- Environment Separation
- CI/CD Pipelines
- GitHub Actions
- Cloud Networking (AWS)

---

## 🚀 Outcome

- Reproducible infrastructure
- Clear separation between dev and prod
- Deployment workflow similar to real enterprise environments

---

## 👤 Author

Project built as a hands-on Terraform and AWS practice at a professional level.
