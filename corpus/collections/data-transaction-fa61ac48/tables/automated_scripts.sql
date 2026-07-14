CREATE TABLE automated_scripts (
  id INTEGER NOT NULL,
  script_id VARCHAR(44),
  script_name VARCHAR(32),
  platform VARCHAR(32),
  is_legacy BOOLEAN,
  execution_frequency VARCHAR(32),
  server_id INTEGER,
  data_transaction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (server_id) REFERENCES servers (id),
  FOREIGN KEY (data_transaction_id) REFERENCES data_transactions (data_transaction_id)
);
