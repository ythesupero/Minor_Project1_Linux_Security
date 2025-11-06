# Minor Project 1 – Linux IAM & Hardening

## Author
**Name:** Desale Yash Sanjay  
**Roll No:** 301313123017  
**College:** RCET Bhilai  
**Course:** BTech CSE Cyber Security, 5th Semester  

---

## Overview
This project focuses on implementing secure Identity and Access Management (IAM) practices on an Ubuntu Linux system and identifying/remediating misconfigurations.  
It demonstrates:
- Role-based access control (admins, devs, auditors)
- Minimal sudo privileges
- ACL-based shared folder permissions
- Audit logging and monitoring
- Detection and correction of security flaws

---

## Contents
| File | Description |
|------|--------------|
| `policy.md` | Baseline policy document (users, groups, access rules) |
| `users_setup.sh` | Script for user/group creation and permission setup |
| `fix_misconfigs.sh` | Script for finding and fixing common misconfigurations |
| `audit.rules` | Custom auditd rules used |
| `report.docx` | Full project report |
| `/evidence/` | Screenshots of configurations, fixes, and audit logs |

---

## Execution
1. Run the setup script:
   ```bash
   sudo bash users_setup.sh
