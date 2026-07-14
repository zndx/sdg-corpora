CREATE TABLE operating_conditions (
  operating_condition_id INTEGER NOT NULL,
  condition_id VARCHAR(44),
  temperature_min DECIMAL,
  temperature_max DECIMAL,
  load_level VARCHAR(32),
  is_wet BOOLEAN,
  is_exposed_to_foreign_materials BOOLEAN,
  lubricant_id VARCHAR(44),
  drive_id VARCHAR(35),
  created_at TIMESTAMP,
  PRIMARY KEY (operating_condition_id),
  FOREIGN KEY (lubricant_id) REFERENCES chain_lubricants (lubricant_id),
  FOREIGN KEY (drive_id) REFERENCES chain_drives (drive_id)
);
