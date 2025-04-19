# Chapter 19: AppRole Authentication Method – Vault Meets Automation

## Starting Vault and attaching to the container

### To start the vault container
```
docker run -d --rm \
  -p 8200:8200 \
  -v $(pwd)/vault-data/config:/vault/config \
  -v $(pwd)/vault-data/file:/vault/file \
  -v $(pwd)/vault-data/logs:/vault/logs \
  -v $(pwd):/home/vault/vault-beginner \
  --cap-add=IPC_LOCK \
  --name vault-dev \
    hashicorp/vault:latest server
```

### Attach to the vault container
```
docker exec -it vault-dev /bin/sh
```

### Setup env vars
```
export VAULT_ADDR=http://127.0.0.1:8200
```

### Unseal the vault
```
vault operator unseal
```
### vault log in
```
vault login <your-root-token>
```

### Enable KV v2 at a Custom Path
```
vault secrets enable -path=myapp -version=2 kv
```

### Store a Static Secret in KV v2
```
vault kv put myapp/webapp/dbcreds \
  username="app_user" \
  password="SuperSecret123"
```

### Go inside our project folder
```
cd /home/vault/vault-beginner
```

### Apply a readonly Vault Policy
```
vault policy write myapp-reader chapter-19/myapp.hcl
```

### Enable AppRole Authentication
```
vault auth enable approle
```

### Create the AppRole and Bind the Policy
```
vault write auth/approle/role/myapp \
  token_policies="myapp-reader" \
  secret_id_ttl=60m \
  token_ttl=20m \
  token_max_ttl=60m \
  secret_id_num_uses=5
```

### Fetch Role ID
```
vault read auth/approle/role/myapp/role-id
```

### Generate Secret ID
```
vault write -f auth/approle/role/myapp/secret-id
```

### Stop the vault container
```
docker stop vault-dev
```

### Start vault with MicroService Container
```
docker compose up -d
```

### MicroService Endpoint
```
http://localhost:8000/
```

### Stop the vault stack
```
docker compose down
```