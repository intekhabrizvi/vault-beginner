# Chapter 2: Installing Vault Using Docker

## Command 1. To start the vault

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

## Command 2. To attach to the vault container

```
docker exec -it vault-dev /bin/sh
```

## Command 3. Setup env vars
```
export VAULT_ADDR=http://localhost:8200
```