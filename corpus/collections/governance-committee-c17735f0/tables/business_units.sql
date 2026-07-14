CREATE TABLE business_units (
  unit_i_d VARCHAR(32) NOT NULL,
  unit_name VARCHAR(32),
  unit_type VARCHAR(32),
  is_subsidiary BOOLEAN,
  last_audit_date DATE,
  governance_member_id INTEGER,
  governance_committee_id INTEGER,
  PRIMARY KEY (unit_i_d),
  FOREIGN KEY (governance_member_id) REFERENCES governance_members (id),
  FOREIGN KEY (governance_committee_id) REFERENCES governance_committees (id)
);
