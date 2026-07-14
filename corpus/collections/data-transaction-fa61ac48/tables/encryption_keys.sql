CREATE TABLE encryption_keys (
  id INTEGER NOT NULL,
  key_id VARCHAR(44),
  key_type VARCHAR(32),
  creation_date DATE,
  expiration_date DATE,
  is_revoked BOOLEAN,
  managed_by_server VARCHAR(32),
  server_id INTEGER,
  data_transaction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (server_id) REFERENCES servers (id),
  FOREIGN KEY (data_transaction_id) REFERENCES data_transactions (data_transaction_id)
);
