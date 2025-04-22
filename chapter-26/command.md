# Chapter 26: Production Hardening Guide

### Generate Certificates
```
openssl req -x509 -nodes -days 365 \
  -newkey rsa:4096 \
  -keyout vault.key \
  -out vault.crt \
  -subj "/CN=internal.vault.local"

```

### Create a vault user
```
useradd --system --home /etc/vault.d --shell /bin/false vault
```

### Control Folder ownership
```
chown -R vault:vault /etc/vault.d /opt/vault
```