ui = true

# Storage backend: Raft
storage "raft" {
  path    = "/vault/data"
  node_id = "vault-node-1"
}

# Listener with TLS enabled
listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_cert_file = "/vault/config/certs/vault.crt"
  tls_key_file  = "/vault/config/certs/vault.key"
}

# API address
api_addr = "https://<<YOUR_IP_OR_FQDN_HERE>>:8200"

# Cluster address
cluster_addr = "https://<<YOUR_IP_OR_FQDN_HERE>>:8201"

# Mlock: prevents memory swap
disable_mlock = false

# Log level
log_level = "info"