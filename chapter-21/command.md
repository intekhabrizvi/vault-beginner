# Chapter 21: Transit Secrets Engine – Encryption as a Service

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

### Enable the Transit Engine on default path
```
vault secrets enable transit
```

### Enable the Transit Engine on custom path
```
vault secrets enable -path=enc transit
```

### Create an Encryption Key
```
vault write -f transit/keys/my-encryption-key
```

### List all the transit keys
```
vault list transit/keys
```

### Get detail overview of specific transit key
```
vault read transit/keys/my-encryption-key
```

### Encrypting data using Transit Encryption Key
```
vault write transit/encrypt/my-encryption-key \
  plaintext=$(echo -n "<<WRITE_YOUR_SUPER_SECRET_MSG_HERE>>" | base64)
```

### Decrypt data using Transit Encryption Key
```
vault write transit/decrypt/my-encryption-key \
  ciphertext="<<WRITE_YOUR_CIPHERTEXT_HERE>>" 
```

### Decode base64 encoded data to human readable text
```
echo "<<WRITE_YOUR_BASE64_DATA_HERE>>" | base64 -d
```

### Rotate the Transit Encryption Key
```
vault write -f transit/keys/my-encryption-key/rotate
```

### Create a signing key
```
vault write -f transit/keys/my-signing-key type=ed25519
```

### Signing data using signing key
```
vault write transit/sign/my-signing-key \
  input=$(echo -n "<<WRITE_YOUR_IMPORTANT_DATA_HERE>>" | base64)
```

### Verify digital signature using signing key
```
vault write -format=json transit/verify/my-signing-key \
  input=$(echo -n "<<WRITE_YOUR_IMPORTANT_DATA_HERE>>" | base64) \
  signature="<<WRITE_YOUR_DIGITAL_SIGNATURE_HERE>>"
```

### Stop vault container
```
docker stop vault-dev
```
