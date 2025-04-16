# Chapter 10: Policies in action

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
export VAULT_ADDR=http://localhost:8200
```

## Chapter Specific Commands

### vault log in
```
vault login <your-root-token>
```

### Apply kv1-reader Policy
```
vault policy write kv1-reader chapter-09/kv1-reader.hcl
```

### Apply kv2-reader Policy
```
vault policy write kv2-reader chapter-09/kv2-reader.hcl
```

### Assign Policy to Alice
```
vault write auth/userpass/users/alice \
  password="123456" \
  policies="kv1-reader,kv2-reader"
```

### Verify policy assigned to Alice
```
vault read auth/userpass/users/alice
```

### Login as Alice
```
vault login -method=userpass username=alice password=123456
```

### Writing on Kv-v2 engine

```
vault kv put kvv2/project1/api key=newvalue789
```

### Stop the vault 
```
docker stop vault-dev
```