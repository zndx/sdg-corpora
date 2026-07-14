CREATE TABLE channel_partners (
  id INTEGER NOT NULL,
  partner_id VARCHAR(32),
  partner_name VARCHAR(32),
  certification_level VARCHAR(32),
  service_area VARCHAR(32),
  surveillance_installation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveillance_installation_id) REFERENCES surveillance_installations (surveillance_installation_id)
);
