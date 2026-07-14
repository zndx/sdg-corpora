CREATE TABLE managers_accounts (
  account_manager_id INTEGER NOT NULL,
  client_account_id INTEGER NOT NULL,
  PRIMARY KEY (account_manager_id, client_account_id),
  FOREIGN KEY (account_manager_id) REFERENCES account_managers (id),
  FOREIGN KEY (client_account_id) REFERENCES client_accounts (id)
);
