CREATE TABLE data_transactions (
  data_transaction_id INTEGER NOT NULL,
  transaction_id INTEGER,
  timestamp TIMESTAMP,
  protocol VARCHAR(32),
  data_volume_bytes DECIMAL,
  status VARCHAR(32),
  compliance_standard VARCHAR(32),
  encryption_key_id INTEGER,
  automated_script_id INTEGER,
  audit_trail_id INTEGER,
  PRIMARY KEY (data_transaction_id),
  FOREIGN KEY (encryption_key_id) REFERENCES encryption_keys (id),
  FOREIGN KEY (automated_script_id) REFERENCES automated_scripts (id),
  FOREIGN KEY (audit_trail_id) REFERENCES audit_trails (id)
);
