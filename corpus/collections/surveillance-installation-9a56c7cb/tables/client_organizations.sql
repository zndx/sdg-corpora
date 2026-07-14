CREATE TABLE client_organizations (
  org_id VARCHAR(32) NOT NULL,
  org_name VARCHAR(32),
  sector VARCHAR(32),
  region VARCHAR(32),
  org_size VARCHAR(32),
  surveillance_installation_id INTEGER,
  PRIMARY KEY (org_id),
  FOREIGN KEY (surveillance_installation_id) REFERENCES surveillance_installations (surveillance_installation_id)
);
