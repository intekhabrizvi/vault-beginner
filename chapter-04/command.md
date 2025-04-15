# Chapter 4: Understanding Shamir’s Secret Sharing and Rekeying Vault

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

## Chapter 4 Specific Commands


### Vault init using PGP keys

```
vault operator init \
  -key-shares=5 \
  -key-threshold=3 \
  -pgp-keys="pgp1.asc,pgp2.asc,pgp3.asc,pgp4.asc,pgp5.asc"
```

### Decrypting the encrypted vault keys

```
echo "<key>" | base64 -d | gpg -d
```

### Customizing Key Shares and Thresholds

```
vault operator init -key-shares=7 -key-threshold=4
```

### Init Rekeying Vault

```
vault operator rekey -init -key-shares=5 -key-threshold=3
```

### Continue Rekeying Vault

```
vault operator rekey
```

### Rekeying Vault with PGP

```
vault operator rekey -init \
  -key-shares=5 \
  -key-threshold=3 \
  -pgp-keys="pgp1.asc,pgp2.asc,pgp3.asc,pgp4.asc,pgp5.asc"
```

### Continue Rekeying Vault

```
vault operator rekey
```