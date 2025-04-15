# Chapter 5: Storing Your First Secret

## Starting Vault and attaching to the container

### To start the vault container

```
docker run -d --rm \
  -p 8200:8200 \
  -v $(pwd)/../vault-data/config:/vault/config \
  -v $(pwd)/../vault-data/file:/vault/file \
  -v $(pwd)/../vault-data/logs:/vault/logs \
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
export VAULT_ADDR=http://localhost:8200
```

## Chapter 5 Specific Commands

### vault log in
```
vault login <your-root-token>
```

### Enabling the KV Secrets Engine
```
vault secrets enable -path=secret kv
```

### Storing a Secret (KV Put)
```
vault kv put secret/myapp username=admin password="S3cr3t!"
```

### Retrieving a Secret (KV Get)
```
vault kv get secret/myapp
```

### Retrieving a Secret (KV Get) JSON Format
```
vault kv get -format=json secret/myapp
```

### Deleting a Secret (KV Delete)
```
vault kv delete secret/myapp
```

### Stop the vault 
```
docker stop vault-dev
```