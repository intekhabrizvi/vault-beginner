# Chapter 25: Production deployment of Hashicorp Vault on Ubuntu LTS

## Pre vault install

### Updating Ubuntu packages
```
sudo apt update;
```

### Install important packages before starting the install
```
sudo apt install -y gnupg curl software-properties-common
```

### Get and install Hashicorp Vault PGP keys to verify the vault binary
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

### Add Hashicorp into the ubuntu source list
```
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list
```

### Update the source and start the vault install
```
sudo apt update;
sudo apt install vault;
```

### prepare the vault folder
```
sudo mkdir -p /etc/vault.d /opt/vault/data /opt/vault/logs;
sudo chown -R vault:vault /opt/vault;
```

### Generate self sign certificate for ip based installation
```
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/vault.d/vault.key \
  -out /etc/vault.d/vault.crt \
  -subj "/CN=<<WRITE_YOUR_IP_ADDRESS_HERE>>";

sudo chown vault:vault /etc/vault.d/vault.*;
```

### Generate LetsEncrypt based SSL certificate for domain based installation
```
sudo apt install certbot;
sudo certbot certonly --standalone -d <<WRITE_YOUR_FQDN_HERE>>;
```

### Copy LetsEncrypt SSL Certificate to Vault folder
```
sudo cp /etc/letsencrypt/live/<<WRITE_YOUR_FQDN_HERE>>/fullchain.pem /etc/vault.d/vault.crt;
sudo cp /etc/letsencrypt/live/<<WRITE_YOUR_FQDN_HERE>>/privkey.pem /etc/vault.d/vault.key;
sudo chown vault:vault /etc/vault.d/vault.*;
```

### Install Hashicorp Vault service in Systemd

```
sudo systemctl daemon-reexec;
sudo systemctl enable vault;
sudo systemctl start vault;
```

## Post Vault Install

### Export env vars
```
export VAULT_ADDR=https://<<YOUR_IP_OR_FQDN_HERE>>:8200;
export VAULT_CACERT=/etc/vault.d/vault.crt
```

### Initialize Vault
```
vault operator init -key-shares=5 -key-threshold=3 > ~/vault.init
```

### Unseal vault
```
vault operator unseal <key1>
vault operator unseal <key2>
vault operator unseal <key3>
```