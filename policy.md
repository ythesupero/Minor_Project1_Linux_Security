
---

## 📄 `policy.md`

```markdown
# Baseline IAM Policy – Linux IAM & Hardening Project

### Groups:
- **admins** – Full system maintenance privileges
- **dev** – Limited development folder access
- **audit** – Read-only monitoring access

### Users:
| Username | Role | Group | Access Level |
|-----------|------|--------|---------------|
| alice | Admin | admins | Full sudo access (limited commands) |
| bob | Developer | dev | Write access to /srv/project |
| claire | Auditor | audit | Read-only access |

### Sudo Policy:
| Group | Allowed Commands |
|--------|------------------|
| admins | apt, ufw, systemctl, useradd, userdel, usermod |
| dev | systemctl restart project.service (NOPASSWD) |
| audit | None |

### Folder Access:
- `/srv/project`: dev (rwx), audit (rx), others (---)
- `/etc/`: root-only
- `/home/`: individual ownership

### Logging & Auditing:
- All user changes and sudo edits tracked with `auditd`.
- Regular permission checks via cron.
