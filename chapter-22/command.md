# Chapter 22: Understanding Vault Audit Devices

## Starting Vault and attaching to the container

### To start the vault container
```
docker run -d \
  -p 8200:8200 \
  -v $(pwd)/vault-data/config:/vault/config \
  -v $(pwd)/vault-data/file:/vault/file \
  -v $(pwd)/vault-data/logs:/vault/logs \
  -v $(pwd):/home/vault/vault-beginner \
  -e VAULT_ADDR="http://localhost:8200/" \
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
## Chapter specific commands

### Change folder ownership
```
chown vault:vault /vault/logs
```
### Enabling the Audit Device
```
vault audit enable file \
    file_path=/vault/logs/audit.log
```
### List enabled Audit Devices
```
vault audit list
```

### Read back some secrets
```
vault kv get api-exp/app1
```

### Check the audit device log
```
cat /vault/logs/audit.log
```

### Stop vault container
```
docker stop vault-dev
```