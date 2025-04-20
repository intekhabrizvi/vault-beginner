# Encrypt-Only Policy
path "transit/encrypt/my-encryption-key" {
  capabilities = ["update"]
}

# Decrypt-Only Policy
path "transit/decrypt/my-encryption-key" {
  capabilities = ["update"]
}

# Key Rotation Policy
path "transit/keys/my-encryption-key/rotate" {
  capabilities = ["update"]
}

# Sign-Only Policy
path "transit/sign/my-signing-key" {
  capabilities = ["update"]
}

# Verify-Only Policy
path "transit/verify/my-signing-key" {
  capabilities = ["update"]
}

# Full Admin Policy for a Key
path "transit/keys/my-encryption-key" {
  capabilities = ["create", "read", "update", "delete", "list"]
}