# Chapter 28: Creating PGP Keys for Vault Security

## Check if GPG is Installed

```
gpg --version
```

## Install GPG in Ubuntu/Debian

```
sudo apt update && sudo apt install gnupg
```

## Install GPG in macOS (using Homebrew)

```
brew install gnupg
```

## Install GPG in Alpine Linux

```
apk add gnupg
```

## Generating a PGP Keypair

```
gpg --full-generate-key
```

## View Your Key

```
gpg --list-keys
```

## Export Public Key

```
gpg --armor --export [YOUR_EMAIL_ADDRESS_HERE] > public-key.asc
```

## Export Private Key

```
gpg --armor --export-secret-key [YOUR_EMAIL_ADDRESS_HERE] > private-key.asc
```

## Encrypt a Sample Message

```
echo "Hello Vault!" | gpg --armor --encrypt --recipient [YOUR_EMAIL_ADDRESS_HERE] > message.asc
```

## Decrypt the Message

```
gpg --decrypt message.asc
```
