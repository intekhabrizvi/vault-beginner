# Chapter 17: Dynamic Secrets with MongoDB

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
vault secrets enable -path=mongo-db database
```

### Configure MongoDB Connection
```
vault write mongo-db/config/main \
  plugin_name=mongodb-database-plugin \
  allowed_roles="readonly" \
  connection_url="mongodb://{{username}}:{{password}}@mongo:27017/admin?authSource=admin" \
  username="root" \
  password="password"
```

### Create a Dynamic Role
```
vault write mongo-db/roles/readonly \
  db_name=main \
  creation_statements='{ "db": "admin", "roles": [ { "role": "readAnyDatabase", "db": "admin" } ] }' \
  default_ttl="1h" \
  max_ttl="24h"
```

### Generate Dynamic Credentials
```
vault read mongo-db/creds/readonly
```

### Login on MongoDB using Dynamic Credentials
```
docker exec -it mongo mongosh -u <<username>> -p <<password>> -- authenticationDatabase admin
```
### Login on MongoDB as root
```
docker exec -it mongo mongosh -u root -p password --authenticationDatabase admin
```

### Find newly created Dynamic Credentials
```
use admin
db.system.users.find()
```

### Revoke the Dynamic Secret
```
vault lease revoke <<lease_id>>
```

### Stop the vault stack
```
docker compose down
```