# 🌐 AWS Terraform Networking Lab (Foundations + Best Practices)

This repository represents a learning foundation and evolution path in **Infrastructure as Code (IaC)** using Terraform on AWS.

The project is divided into two clear stages:

1. 🧱 **Base Infrastructure (Foundations)**
2. 🚀 **Production-Ready Infrastructure (Best Practices)**

---

## 📌 Objective

Build an AWS network from scratch and evolve it into a more production-like design by applying:

* Modularization
* Environment separation
* Remote state management
* CI/CD automation

---

## 🧱 Stage 1 — Infrastructure Foundations

In this phase, a basic AWS network was built to understand how Terraform works.

### 🔧 What is implemented

* VPC
* Public and private subnets
* Internet Gateway (IGW)
* Route Tables
* Security Groups

### 🎯 Goal

Learn:

* How Terraform creates resources
* Dependencies between components
* Basic `.tf` file structure

### ⚠️ Limitations

* No environment separation
* Local state
* No automation

---

## 🚀 Stage 2 — Production-Ready Infrastructure

In this phase, the project is fully refactored using industry best practices.

---

## 🧠 Concepts Applied

### 📦 Modularization

Infrastructure is split into reusable modules:

```text id="r2dj9f"
modules/
├── vpc/
├── subnets/
├── routing/
└── security-group/
```

---

### 🌍 Environment Separation

```text id="6t7d1p"
environments/
├── dev/
└── prod/
```

* `dev` → testing and experimentation
* `prod` → controlled environment

---

### 🗄️ Remote State

Terraform uses:

* **S3** → state storage
* **DynamoDB** → state locking

This enables:

* Team collaboration
* Preventing state corruption
* Centralized state management

---

### ⚙️ CI/CD with GitHub Actions

Deployment is automated:

#### 🟢 DEV

* Automatic deployment
* Runs on every change in modules or dev

#### 🔴 PROD

* Controlled deployment
* Requires manual approval
* Not automatically updated from module changes

---

## 🔁 Workflow

```text id="2a0z7s"
1. Changes are made in modules
2. Automatically deployed to DEV
3. Changes are validated
4. Promoted to PROD with approval
```

---

## 📁 Project Structure

```text id="m7kq1h"
aws-state-remote-and-environments/
├── environments/
│   ├── dev/
│   └── prod/
├── modules/
├── bootstrap/        # backend (S3 + DynamoDB)
└── .github/workflows/
```

---

## 💸 Cost Control

Avoids the use of expensive resources such as:

* ❌ NAT Gateway
* ❌ EC2

👉 Project focused on networking (near-zero cost)

---

## ⚠️ Best Practices Implemented

* Use of reusable modules
* Environment separation
* Remote state management
* CI/CD automation
* Controlled production deployments
* Avoid manual changes in production

---

## 🧠 Key Learnings

* Terraform is not just about creating infrastructure, but managing it
* Environment separation prevents critical errors
* Remote state is essential in real-world projects
* CI/CD enables safe and repeatable deployments

---

## 🚀 Result

Achieved infrastructure that is:

* Reproducible
* Scalable
* Secure
* Aligned with real industry practices

---

## 👤 Author

Project developed as part of a progressive learning journey in Terraform and AWS, evolving from fundamentals to professional-level practices.
