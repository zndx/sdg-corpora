CREATE TABLE parents (
  id INTEGER NOT NULL,
  parent_id VARCHAR(32),
  full_name VARCHAR(36),
  contact_number VARCHAR(32),
  email_address VARCHAR(32),
  relationship_to_student VARCHAR(32),
  bullying_incident_id INTEGER,
  participates_in_conciliation_bullying_incident_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (bullying_incident_id) REFERENCES bullying_incidents (bullying_incident_id),
  FOREIGN KEY (participates_in_conciliation_bullying_incident_id) REFERENCES bullying_incidents (bullying_incident_id)
);
