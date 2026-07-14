CREATE TABLE internal_auditing_divisions (
  id INTEGER NOT NULL,
  division_identifier VARCHAR(32),
  division_name VARCHAR(32),
  member_count INTEGER,
  certification_requirement VARCHAR(32),
  audit_scope VARCHAR(32),
  business_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (business_unit_id) REFERENCES business_units (id)
);
