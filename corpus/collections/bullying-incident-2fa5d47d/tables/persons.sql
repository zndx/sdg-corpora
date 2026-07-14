CREATE TABLE persons (
  id INTEGER NOT NULL,
  person_id VARCHAR(32),
  full_name VARCHAR(36),
  role VARCHAR(32),
  year_group INTEGER,
  email_address VARCHAR(32),
  is_vulnerable BOOLEAN,
  special_needs BOOLEAN,
  role_id VARCHAR(44),
  incident_id VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES staff_roles (role_id),
  FOREIGN KEY (incident_id) REFERENCES bullying_incidents (incident_id)
);
