CREATE TABLE cybersecurity_programs (
  id INTEGER NOT NULL,
  program_identifier VARCHAR(32),
  program_name VARCHAR(32),
  is_formalized BOOLEAN,
  has_risk_scoring_process BOOLEAN,
  has_network_monitoring BOOLEAN,
  has_device_inventory_management BOOLEAN,
  has_defined_roles BOOLEAN,
  implementation_date TIMESTAMP,
  clinical_engineering_team_id INTEGER,
  cyber_threat_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_engineering_team_id) REFERENCES clinical_engineering_teams (clinical_engineering_team_id),
  FOREIGN KEY (cyber_threat_id) REFERENCES cyber_threats (id)
);
