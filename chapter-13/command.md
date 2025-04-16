# Chapter 13: Dynamic Secrets in Action

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

## Chapter Specific Commands

### vault log in
```
vault login <your-root-token>
```

### Enable database secret engine
```
vault secrets enable database
```

### Command to configure the MySQL plugin
```
vault write database/config/my-mysql-database \
  plugin_name=mysql-database-plugin \
  connection_url="{{username}}:{{password}}@tcp(mysql:3306)/" \
  allowed_roles="readonly-role" \
  username="root" \
  password="rootpass"
```

### Define the Dynamic Credentials Role
```
vault write database/roles/readonly-role \
  db_name=my-mysql-database \
  creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}'; GRANT SELECT ON vaultdb.* TO '{{name}}'@'%';" \
  default_ttl="1m" \
  max_ttl="5m"
```

### Generate Dynamic Credentials
```
vault read database/creds/readonly-role
```

### Manually revoke credentials
```
vault lease revoke <lease_id>
```

### Stop the vault stack
```
docker compose down
```