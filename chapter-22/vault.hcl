ui = true
log_level = "info"

storage "raft" {
  path    = "/opt/vault/data"
  node_id = "vault-node-1"
}

listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/etc/vault.d/vault.crt"
  tls_key_file  = "/etc/vault.d/vault.key"
}

api_addr = "https://<<YOUR_IP_OR_FQDN_HERE>>:8200"
cluster_addr = "https://<<YOUR_IP_OR_FQDN_HERE>>:8201"

disable_mlock = false