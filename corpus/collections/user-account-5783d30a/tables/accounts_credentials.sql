CREATE TABLE accounts_credentials (
  account_id VARCHAR(44) NOT NULL,
  password_credential_id INTEGER NOT NULL,
  PRIMARY KEY (account_id, password_credential_id),
  FOREIGN KEY (account_id) REFERENCES user_accounts (account_id),
  FOREIGN KEY (password_credential_id) REFERENCES password_credentials (password_credential_id)
);
