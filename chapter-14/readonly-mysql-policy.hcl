# readonly-mysql-policy.hcl
path "database/creds/readonly-role" {
  capabilities = ["read"]
}