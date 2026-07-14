CREATE TABLE clinical_sites (
  clinical_site_id INTEGER NOT NULL,
  site_identifier VARCHAR(32),
  site_name VARCHAR(32),
  site_type VARCHAR(32),
  address VARCHAR(32),
  is_connected_to_network BOOLEAN,
  total_devices_at_site INTEGER,
  last_audit_date DATE,
  clinical_engineering_team_id INTEGER,
  PRIMARY KEY (clinical_site_id),
  FOREIGN KEY (clinical_engineering_team_id) REFERENCES clinical_engineering_teams (clinical_engineering_team_id)
);
