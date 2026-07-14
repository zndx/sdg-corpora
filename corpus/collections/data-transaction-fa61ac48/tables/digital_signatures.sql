CREATE TABLE digital_signatures (
  id INTEGER NOT NULL,
  signature_id VARCHAR(44),
  algorithm VARCHAR(32),
  signing_date TIMESTAMP,
  is_valid BOOLEAN,
  data_file_id INTEGER,
  encryption_key_id INTEGER,
  audit_trail_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_file_id) REFERENCES data_files (data_file_id),
  FOREIGN KEY (encryption_key_id) REFERENCES encryption_keys (id),
  FOREIGN KEY (audit_trail_id) REFERENCES audit_trails (id)
);
