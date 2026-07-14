CREATE TABLE chain_drives (
  drive_id VARCHAR(35) NOT NULL,
  drive_type VARCHAR(32),
  is_critical_operation BOOLEAN,
  installation_date TIMESTAMP,
  lubricant_id VARCHAR(44),
  operating_condition_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (drive_id),
  FOREIGN KEY (lubricant_id) REFERENCES chain_lubricants (lubricant_id),
  FOREIGN KEY (operating_condition_id) REFERENCES operating_conditions (operating_condition_id)
);
