# Chapter 25: Vault Production Deployment Using Docker

### Updating Ubuntu packages
```
sudo apt update
```

### Installing docker
```
sudo apt install -y docker.io; sudo systemctl enable docker;
```

### Creating vault directory for permanent saving of data
```
mkdir -p /opt/vault-prod/config /opt/vault-prod/data /opt/vault-prod/logs
```

### Change data directory ownership for docker
```
sudo chown -R 100:100 /opt/vault-prod/data
```

### Create dierctory to hold SSL certificate
```
mkdir -p /opt/vault-prod/config/certs
```

### Command to generate self-sign SSL certificate
```
openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout /opt/vault-prod/config/certs/vault.key \
  -out /opt/vault-prod/config/certs/vault.crt \
  -days 365 \
  -config vault.cnf
```

### Start vault container

```
docker run -d --name vault \
  --cap-add=IPC_LOCK \
  -p 8200:8200 \
  -p 8201:8201 \
  -v /opt/vault-prod/config:/vault/config \
  -v /opt/vault-prod/data:/vault/data \
  -v /opt/vault-prod/config/certs:/vault/config/certs \
  -e VAULT_ADDR='https://0.0.0.0:8200' \
  --restart=always \
  hashicorp/vault:latest server
```

### Initialize Hashicorp vault
```
docker exec -it vault vault operator init
```

### Unseal the vault
```
docker exec -it vault vault operator unseal <unseal-key>
```