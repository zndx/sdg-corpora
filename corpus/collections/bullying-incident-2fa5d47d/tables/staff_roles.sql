CREATE TABLE staff_roles (
  role_id VARCHAR(44) NOT NULL,
  role_name VARCHAR(32),
  responsibilities VARCHAR(32),
  is_policy_owner VARCHAR(32),
  year_group INTEGER,
  person_id INTEGER,
  incident_id VARCHAR(32),
  PRIMARY KEY (role_id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (incident_id) REFERENCES bullying_incidents (incident_id)
);
