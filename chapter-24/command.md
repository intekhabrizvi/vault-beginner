# Chapter 24: Revoking and Regenerating the Root Token

## Enable userpass Auth

```
vault auth enable userpass
```

## Create an Admin Policy

```
vault policy write admin admin-policy.hcl
```

## Create a Vault Admin User

```
vault write auth/userpass/users/vaultadmin \
  password="123456" \
  policies="admin"
```

## Login with userpass

```
vault login -method=userpass username=vaultadmin password=123456
```

## Begin Root Token Regeneration Process

```
vault operator generate-root -init
```

## Cancel Root Token Regeneration Process

```
vault operator generate-root -cancel
```

## Provide Unseal Key Shares (With Nonce)

```
vault operator generate-root -nonce=<nonce> <unseal_key>
```

## Decrypt the Root Token (Using OTP)

```
vault operator generate-root -decode <encoded_token> -otp <One-time-otp>
```


