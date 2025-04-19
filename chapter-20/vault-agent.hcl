exit_after_auth = false
pid_file = "/tmp/vault-agent.pid"

auto_auth {
  method "approle" {
    mount_path = "auth/approle"
    config = {
      role_id_file_path = "/home/vault/vault-beginner/chapter-20/role_id.txt"
      secret_id_file_path = "/home/vault/vault-beginner/chapter-20/secret_id.txt"
      remove_secret_id_file_after_reading = false
    }
  }

  sink "file" {
    config = {
      path = "/home/vault/vault-beginner/chapter-20/token.txt"
    }
  }
}

template {
  source      = "/home/vault/vault-beginner/chapter-20/db-creds.tpl"
  destination = "/home/vault/vault-beginner/chapter-20/db.env"
}