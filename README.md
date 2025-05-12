# HashiCorp Vault for Beginners - First edition
###  A practical, hands-on guide to mastering Hashicorp Vault without losing your sanity 

Welcome to the GitHub companion repo for **“HashiCorp Vault for Beginners”** — a practical, Docker-powered book that helps developers, DevOps engineers, and security teams master Vault with zero stress and maximum hands-on learning.

This repo contains **real-world exercises**, **Docker configurations**, and **step-by-step commands** used across all chapters of the book so you can follow along without messing up your system.

---

### 🧠 What’s This Book About?

HashiCorp Vault can be intimidating when you're just starting out. This book changes that. It walks you through everything from installing Vault using Docker to building automation pipelines with Vault Agent, using AppRole, encrypting secrets using Transit, and deploying Vault in production with real-world security tips.

No theory dumps. Just **command-line action**, **real configs**, and **practical scenarios**.


---

![Hashicorp-vault-for-beginners-cover](https://www.intekhab.in/images/Hashicorp-vault-for-beginners-cover.jpg)

---

### 📂 Book Chapters

| Chapter | Title                                                              | Codes |
| ------- | ------------------------------------------------------------------ | ----- |
| 1       | Introduction to Hashicorp Vault                                    |  |
| 2       | Installing Vault Using Docker                                      | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-02) |
| 3       | Vault Initialization and Logging In                                | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-03) |
| 4       | Understanding Shamir’s Secret Sharing and Rekeying Vault           | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-04) |
| 5       | Storing Your First Secret                                          | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-05) |
| 6       | KV v2 Versioned Secrets                                            | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-06) |
| 7       | Secrets Engine and Paths                                           | |
| 8       | Authentication Methods – Giving Others Access                      | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-08) |
| 9       | Understanding Vault Policies                                       |  |
| 10      | Policies in Action                                                 | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-10) |
| 11      | Accessing Vault Using Browser-Based UI                             |  |
| 12      | Understanding Dynamic Secrets                                      |  |
| 13      | Dynamic Secrets in Action                                          | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-13) |
| 14      | Fine-Tuning and Access Control on Dynamic Secrets                  | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-14) |
| 15      | Leasing, TTL, and Vault’s Secret Lifecycle                         |  |
| 16      | Dynamic Secrets with PostgreSQL                                    | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-16) |
| 17      | Dynamic Secrets with MongoDB                                       | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-17) |
| 18      | Getting Started with the Vault API – Your First Step to Automation | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-18) |
| 19      | AppRole Authentication Method – Vault Meets Automation             | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-19) |
| 20      | Vault Agent and Templating – Bridging the Gap for Legacy Apps      | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-20) |
| 21      | Transit Secrets Engine – Encryption as a Service                   | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-21) |
| 22      | Understanding Vault Audit Devices                                  | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-22) |
| 23      | Revoking and Regenerating the Root Token                           | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-23) |
| 24      | Production Deployment of Hashicorp Vault on Ubuntu LTS             | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-24) |
| 25      | Production Deployment of Hashicorp Vault Using Docker              | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-25) |
| 26      | Production Hardening Guide                                         | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-26) |
| 27      | Creating PGP Keys for Vault Security                               | [Codes](https://github.com/intekhabrizvi/vault-beginner/tree/master/chapter-27) |

---

### 🐳 No Setup Headaches

All exercises run on Docker. No Vault installations on your local machine. No OS-level dependency hell.

```bash
docker compose up -d
```

Boom. You’re ready.

---

### 📂 Directory Structure

```bash
vault-beginners/
├── chapter-02/
├── chapter-03/
├── ...
├── chapter-21/
├── ...
└── chapter-27/
```

Each folder includes:

* Vault CLI commands
* Docker setup (if any)
* Sample policy files
* API request examples (using `curl`)
* Extra notes or troubleshooting help

---

### 📥 How to Get the Book

**It’s free. PDF only.**

Download the book here 👉 [Hashicorp vault for beginners](https://www.intekhab.in/hashicorp-vault-for-beginner-pdf-ebook.html)

Want to print it or translate it into your language? Please contact me first.

---

### 👨‍💻 About the Author

You probably know me already, but just in case: I'm a senior software engineer obsessed with security, automation, and writing things that don’t suck. This book was written to make Vault feel like something you *want* to use—not something you *have* to Google endlessly.

---

### 📬 Stay in Touch

* Personal Site / Blog: [www.intekhab.in](https://www.intekhab.in)

---

### ⭐️ Support This Project

If this repo or the book helped you out, consider giving it a ⭐️ on GitHub—it really does help!

