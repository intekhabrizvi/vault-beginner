# Chapter 8: Authentication Methods – Giving Others Access

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

## Chapter 6 Specific Commands

### vault log in
```
vault login <your-root-token>
```

### Enabling the Userpass Auth Method
```
vault auth enable userpass
```

### Create a User
```
vault write auth/userpass/users/alice \
  password="123456" \
  policies="default"
```

### Login using userpass method
```
vault login -method=userpass username=alice password=123456
```

### Retrieving a latest secret from kv-v2 (KV Get)
```
vault kv get kvv2/project1/api
```

### Retrieving a specific version of Secret from KV-2 (KV Get)
```
vault kv get -version=1 kvv2/project1/api
```

### Reading metadata of Secret from KV-2
```
vault kv metadata get kvv2/project1/api
```

### Soft Deleting the Secret (KV Delete)
```
vault kv delete kvv2/project1/api
```

### Undelete the Secret (KV Delete)
```
vault kv undelete -versions=2 kvv2/project1/api
```

### Permanent Deleting the Secret (KV Delete)
```
vault kv destroy -versions=2 kvv2/project1/api
```

### Stop the vault 
```
docker stop vault-dev
```