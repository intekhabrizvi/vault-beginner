# Chapter 18: Getting Started with the Vault API – Your First Step to Automation

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
export VAULT_TOKEN=<<YOUR_ROOT_TOKEN>>
```

### Unseal the vault
```
curl -s \
  --request PUT \
  --data '{"key": "<<UNSEAL_KEY>>"}' \
  $VAULT_ADDR/v1/sys/unseal
```

### Enable the KV-v2 on custom path
```
curl -s \
  --header "X-Vault-Token: $VAULT_TOKEN" \
  --request POST \
  --data '{"type": "kv", "options": {"version": "2"}}' \
  $VAULT_ADDR/v1/sys/mounts/api-exp
```

### Saving a secret in api-exp path
```
curl -s \
  --header "X-Vault-Token: $VAULT_TOKEN" \
  --request POST \
  --data '{"data": {"username": "admin", "password": "password123"}}' \
  $VAULT_ADDR/v1/api-exp/data/app1
```

### Reading back the saved secret
```
curl -s \
  --header "X-Vault-Token: $VAULT_TOKEN" \
  $VAULT_ADDR/v1/api-exp/data/app1
```

### List all secrets on the given path
```
curl -s \
  --header "X-Vault-Token: $VAULT_TOKEN" \
  $VAULT_ADDR/v1/api-exp/metadata/app1
```

### Delete the stored secret
```
curl -s \
  --header "X-Vault-Token: $VAULT_TOKEN" \
  --request DELETE \
  $VAULT_ADDR/v1/api-exp/data/app1
```

### Recover the delete secret on KV-v2
```
curl -s \
  --header "X-Vault-Token: $VAULT_TOKEN" \
  --request POST \
  --data '{"versions":[1]}' \
  $VAULT_ADDR/v1/api-exp/undelete/app1
```

### Stop the vault container
```
docker stop vault-dev
```