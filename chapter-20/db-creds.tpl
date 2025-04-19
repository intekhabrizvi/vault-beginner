DB_USER={{ with secret "myapp/webapp/dbcreds" }}{{ .Data.data.username }}{{ end }}
DB_PASS={{ with secret "myapp/webapp/dbcreds" }}{{ .Data.data.password }}{{ end }}