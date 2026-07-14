CREATE TABLE chains (
  chain_id INTEGER NOT NULL,
  link_type VARCHAR(67),
  pitch DECIMAL,
  material VARCHAR(32),
  drive_id VARCHAR(35),
  PRIMARY KEY (chain_id),
  FOREIGN KEY (drive_id) REFERENCES chain_drives (drive_id)
);
