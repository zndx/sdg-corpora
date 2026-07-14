CREATE TABLE audit_trails (
  id INTEGER NOT NULL,
  trail_id VARCHAR(44),
  generated_timestamp TIMESTAMP,
  sender_identity VARCHAR(32),
  content_hash VARCHAR(32),
  is_verified BOOLEAN,
  data_transaction_id INTEGER,
  digital_signature_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_transaction_id) REFERENCES data_transactions (data_transaction_id),
  FOREIGN KEY (digital_signature_id) REFERENCES digital_signatures (id)
);
