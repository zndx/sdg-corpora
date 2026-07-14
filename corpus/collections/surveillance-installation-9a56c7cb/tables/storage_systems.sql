CREATE TABLE storage_systems (
  id INTEGER NOT NULL,
  storage_id VARCHAR(32),
  storage_type VARCHAR(32),
  capacity_t_b DECIMAL,
  manufacturer VARCHAR(46),
  model_number VARCHAR(32),
  encryption_enabled BOOLEAN,
  surveillance_installation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveillance_installation_id) REFERENCES surveillance_installations (surveillance_installation_id)
);
