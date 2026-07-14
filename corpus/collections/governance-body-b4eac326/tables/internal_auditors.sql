CREATE TABLE internal_auditors (
  internal_auditor_id INTEGER NOT NULL,
  auditor_identifier VARCHAR(32),
  auditor_name VARCHAR(32),
  certification_type VARCHAR(32),
  assignment_date DATE,
  specialization VARCHAR(32),
  internal_auditing_division_id INTEGER,
  business_unit_id INTEGER,
  PRIMARY KEY (internal_auditor_id),
  FOREIGN KEY (internal_auditing_division_id) REFERENCES internal_auditing_divisions (id),
  FOREIGN KEY (business_unit_id) REFERENCES business_units (id)
);
