# microservice.py

import os
import requests
from fastapi import FastAPI

VAULT_ADDR = os.getenv("VAULT_ADDR", "http://vault-dev:8200")
ROLE_ID = os.getenv("ROLE_ID")
SECRET_ID = os.getenv("SECRET_ID")

def get_vault_token():
    url = f"{VAULT_ADDR}/v1/auth/approle/login"
    payload = {"role_id": ROLE_ID, "secret_id": SECRET_ID}
    res = requests.post(url, json=payload)
    return res.json()["auth"]["client_token"]

def get_db_creds(token):
    url = f"{VAULT_ADDR}/v1/myapp/data/webapp/dbcreds"
    headers = {"X-Vault-Token": token}
    res = requests.get(url, headers=headers)
    data = res.json()["data"]["data"]
    return data

app = FastAPI()

@app.get("/")
def root():
    token = get_vault_token()
    creds = get_db_creds(token)

    # Set as env vars
    os.environ["DB_USER"] = creds["username"]
    os.environ["DB_PASS"] = creds["password"]

    print("Secrets loaded into environment.")
    return {
        "db_user": os.getenv("DB_USER"),
        "db_pass": os.getenv("DB_PASS")
    }