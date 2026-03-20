# 🛡️ Azure Security Operations with Defender & Sentinel

## 📌 Overview
This project demonstrates a cloud-native security monitoring environment built using Terraform and Azure security services.

It includes:
- Infrastructure provisioning with Terraform
- Log collection using Log Analytics
- SIEM using Microsoft Sentinel
- Detection using KQL analytics rules
- Security posture with Microsoft Defender for Cloud

---

## 🏗️ Architecture Diagram

```
                Azure Subscription
                        │
                        ▼
        +----------------------------------+
        | Resource Group                   |
        | rg-secops-monitoring-dev        |
        +----------------------------------+
                        │
        ┌───────────────┼───────────────┐
        │               │               │
        ▼               ▼               ▼
+---------------+  +----------------+  +----------------------+
| Virtual       |  | Log Analytics  |  | Microsoft Defender   |
| Network       |  | Workspace      |  | for Cloud            |
| + Subnet      |  +--------+-------+  +----------+-----------+
+-------+-------+           │                     │
        │                   ▼                     │
        │        +---------------------------+    │
        │        | Microsoft Sentinel (SIEM) |<---+
        │        +------------+--------------+
        │                     │
        │                     ▼
        │        +---------------------------+
        │        | Analytics Rule (KQL)      |
        │        | Failed Login Detection    |
        │        +------------+--------------+
        │                     │
        │                     ▼
        │        +---------------------------+
        │        | Incidents & Alerts        |
        │        +---------------------------+
```

---

## 🔄 Data Flow

1. Azure resources generate logs  
2. Logs are stored in Log Analytics  
3. Microsoft Sentinel analyzes logs  
4. KQL rules detect suspicious activity  
5. Alerts and incidents are generated  
6. Microsoft Defender provides recommendations  

---

## 🏗️ Infrastructure Components

- Resource Group  
- Virtual Network & Subnet  
- Network Interface & Public IP  
- Log Analytics Workspace  
- Microsoft Sentinel  
- Analytics Rule  
- Microsoft Defender for Cloud  

---

## ⚙️ Technologies Used

- Terraform  
- Microsoft Azure  
- Log Analytics  
- Microsoft Sentinel  
- Microsoft Defender for Cloud  
- KQL (Kusto Query Language)  

---

## 🚀 Deployment Steps

### Initialize
```
terraform init
```

### Validate
```
terraform validate
```

### Plan
```
terraform plan
```

### Apply
```
terraform apply
```

---

## 🔍 Security Features

- Centralized logging  
- SIEM with Sentinel  
- Detection rule for failed logins  
- Defender for Cloud enabled  
- Structured naming convention  

---

## 📸 Deployment Screenshots

### Terraform Validate
![Validate](./screenshots/01-terraform-validate-success.png)

### Terraform Plan
![Plan](./screenshots/02-terraform-plan-success.png)

### Core Infrastructure
![Core](./screenshots/terraform-apply-core-infra-succeeded.png)

### Log Analytics
![Logs](./screenshots/terraform-apply-log-analytics-succeeded.png)

### Detection Rule
![Detection](./screenshots/terraform-apply-detection-rule-succeeded.png)

### Defender
![Defender](./screenshots/terraform-apply-defender-enabled-succeeded.png)

---


## 📸 Architecture & Security Implementation

### 🏗️ Terraform Deployment

#### Validate
![Validate](./screenshots/01-terraform-validate-success.png)

#### Plan
![Plan](./screenshots/02-terraform-plan-success.png)

#### Core Infrastructure
![Core](./screenshots/terraform-apply-core-infra-succeeded.png)

#### Log Analytics
![Log Analytics](./screenshots/terraform-apply-log-analytics-succeeded.png)

#### Defender for Cloud
![Defender](./screenshots/terraform-apply-defender-enabled-succeeded.png)

#### Detection Rule
![Detection](./screenshots/terraform-apply-detection-rule-succeeded.png)

---

### 🛡️ Web Application Firewall (WAF)
![WAF](./screenshots/secops-waf-enabled-succeeded.png)

---

### 📦 Azure Container Registry (ACR) - RBAC
![ACR RBAC](./screenshots/secops-acr-rbac-security-analyst.png)

---

### 🚀 Container App Deployment
![Container App Creation](./screenshots/secops-containerapp-creation.png)

---

### 📊 Container App Monitoring
![Container Monitoring](./screenshots/secops-containerapp-monitoring.png)









## 🧠 Lessons Learned

- Terraform state management is critical  
- Never commit `.terraform` directory  
- Azure capacity varies by region  
- Security must be added incrementally  
- Debugging builds real-world skills  

---

## 🎯 Future Improvements

- Connect VM for live monitoring  
- Generate real attack logs  
- Add automation (playbooks)  
- Implement Azure Policy  

---

## 💼 Author

Hari Sharma  
Cloud Security Engineer | Azure | AWS | Terraform
