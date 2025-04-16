# Chapter 14: Fine-Tuning and Access Control on Dynamic Secrets

## Starting Vault and attaching to the container

### To start the vault stack
```
docker compose up -d
```

### Attach to the vault container
```
docker exec -it vault-dev /bin/sh
```

### Setup env vars
```
export VAULT_ADDR=http://localhost:8200
```

### Unseal the vault
```
vault operator unseal
```
### vault log in
```
vault login <your-root-token>
```

## Chapter Specific Commands

### Create a New Read-Write Role
```
vault write database/roles/readwrite-role \
  db_name=my-mysql-database \
  creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}'; GRANT SELECT, INSERT, UPDATE ON vaultdb.* TO '{{name}}'@'%';" \
  default_ttl="2m" \
  max_ttl="10m"
```

### Update database secret engine to accept Read-Write Role
```
vault write database/config/my-mysql-database \
  plugin_name=mysql-database-plugin \
  connection_url="{{username}}:{{password}}@tcp(mysql:3306)/" \
  allowed_roles="readonly-role, readwrite-role" \
  username="root" \
  password="rootpass"
```

### Generate Dynamic Credentials
```
vault read database/creds/readwrite-role
```

### Create MySQL readonly policy
```
vault policy write readonly-mysql chapter-14/readonly-mysql-policy.hcl
```

### Attach mysql readonly policy to Alice
```
vault write auth/userpass/users/alice \
  password="123456" \
  policies="default,readonly-mysql"
```

### Login as Alice
```
vault login -method=userpass username=alice password=123456
```

### generate mysql user for alice with readonly permissin
```
vault read database/creds/readonly-role
```

### Attempt to Generate a MySQL User for Alice with Read-Write Access
```
vault read database/creds/readwrite-role
```

### Stop the vault stack
```
docker compose down
```