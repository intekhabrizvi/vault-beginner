# Chapter 20: Vault Agent and Templating - Bridging the Gap for Legacy Apps

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

### Start vault with vault agent in container
```
docker compose up
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
### Stop the vault stack
```
docker compose down
```