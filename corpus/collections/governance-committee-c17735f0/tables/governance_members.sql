CREATE TABLE governance_members (
  id INTEGER NOT NULL,
  member_i_d VARCHAR(32),
  role_title VARCHAR(32),
  is_external BOOLEAN,
  certification_type VARCHAR(32),
  appointment_date DATE,
  governance_committee_id INTEGER,
  unit_i_d VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (governance_committee_id) REFERENCES governance_committees (id),
  FOREIGN KEY (unit_i_d) REFERENCES business_units (unit_i_d)
);
