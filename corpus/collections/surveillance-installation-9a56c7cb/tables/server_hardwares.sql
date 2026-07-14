CREATE TABLE server_hardwares (
  id INTEGER NOT NULL,
  server_id VARCHAR(40),
  manufacturer VARCHAR(46),
  form_factor VARCHAR(32),
  model_number VARCHAR(32),
  serial_number INTEGER,
  warranty_expiry DATE,
  is_managed_service BOOLEAN,
  surveillance_installation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveillance_installation_id) REFERENCES surveillance_installations (surveillance_installation_id)
);
