CREATE TABLE data_files (
  data_file_id INTEGER NOT NULL,
  file_id VARCHAR(44),
  file_name VARCHAR(32),
  file_size_bytes DECIMAL,
  storage_location VARCHAR(32),
  is_encrypted BOOLEAN,
  is_deleted_securely BOOLEAN,
  compression_ratio DECIMAL,
  server_id INTEGER,
  data_transaction_id INTEGER,
  digital_signature_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (data_file_id),
  FOREIGN KEY (server_id) REFERENCES servers (id),
  FOREIGN KEY (data_transaction_id) REFERENCES data_transactions (data_transaction_id),
  FOREIGN KEY (digital_signature_id) REFERENCES digital_signatures (id)
);
