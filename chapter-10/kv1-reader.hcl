# kv1-reader.hcl
path "secret/*" {
  capabilities = ["read", "list"]
}