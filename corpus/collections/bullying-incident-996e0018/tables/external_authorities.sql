CREATE TABLE external_authorities (
  authority_id INTEGER NOT NULL,
  authority_name VARCHAR(32),
  contact_person VARCHAR(32),
  contact_number VARCHAR(32),
  authority_type VARCHAR(47),
  bullying_incident_id INTEGER,
  staff_member_id INTEGER,
  PRIMARY KEY (authority_id),
  FOREIGN KEY (bullying_incident_id) REFERENCES bullying_incidents (bullying_incident_id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (id)
);
