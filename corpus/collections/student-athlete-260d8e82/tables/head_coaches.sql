CREATE TABLE head_coaches (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  sport VARCHAR(32),
  team_name VARCHAR(32),
  contact_email VARCHAR(32),
  compliance_coordinator_id INTEGER,
  certifying_officer_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (compliance_coordinator_id) REFERENCES compliance_coordinators (id),
  FOREIGN KEY (certifying_officer_id) REFERENCES certifying_officers (id)
);
