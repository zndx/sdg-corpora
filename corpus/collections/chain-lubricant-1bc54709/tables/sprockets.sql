CREATE TABLE sprockets (
  sprocket_id VARCHAR(44) NOT NULL,
  tooth_count INTEGER,
  pitch_diameter DECIMAL,
  material VARCHAR(32),
  drive_id VARCHAR(35),
  chain_id INTEGER,
  PRIMARY KEY (sprocket_id),
  FOREIGN KEY (drive_id) REFERENCES chain_drives (drive_id),
  FOREIGN KEY (chain_id) REFERENCES chains (chain_id)
);
