# kv2-reader.hcl
path "kvv2/data/*" {
  capabilities = ["read"]
}

path "kvv2/metadata/*" {
  capabilities = ["list"]
}