# Chapter 16: Dynamic Secrets with PostgreSQL

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

### Enable Database Secrets Engine on a Custom Path
```
vault secrets enable -path=pgdb database
```

### Configure Vault to Connect to PostgreSQL
```
vault write pgdb/config/my-postgres-db \
  plugin_name=postgresql-database-plugin \
  allowed_roles="readonly-role" \
  connection_url="postgresql://{{username}}:{{password}}@postgres:5432/vaultdb?sslmode=disable" \
  username="root" \
  password="rootpassword"
```

### Create a Readonly Role
```
vault write pgdb/roles/readonly-role \
  db_name=my-postgres-db \
  creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
  default_ttl="1h" \
  max_ttl="24h" \
  num_uses=5
```

### Generate Dynamic Credentials
```
vault read pgdb/creds/readonly-role
```

### Revoke the Dynamic Secret
```
vault lease revoke <<lease_id>>
```

### Stop the vault stack
```
docker compose down
```