CREATE TABLE licensees (
  id INTEGER NOT NULL,
  license_number VARCHAR(32),
  licensee_name VARCHAR(32),
  license_type VARCHAR(32),
  docket_number VARCHAR(32),
  address VARCHAR(32),
  radiation_safety_officer VARCHAR(32),
  regulatory_violation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (regulatory_violation_id) REFERENCES regulatory_violations (regulatory_violation_id)
);
