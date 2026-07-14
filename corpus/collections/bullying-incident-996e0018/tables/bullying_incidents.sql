CREATE TABLE bullying_incidents (
  bullying_incident_id INTEGER NOT NULL,
  incident_id VARCHAR(32),
  date_reported TIMESTAMP,
  severity_level VARCHAR(32),
  incident_type VARCHAR(32),
  status VARCHAR(32),
  location VARCHAR(32),
  description VARCHAR(32),
  staff_member_id INTEGER,
  authority_id INTEGER,
  PRIMARY KEY (bullying_incident_id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (id),
  FOREIGN KEY (authority_id) REFERENCES external_authorities (authority_id)
);
