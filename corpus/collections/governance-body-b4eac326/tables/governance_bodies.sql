CREATE TABLE governance_bodies (
  id INTEGER NOT NULL,
  body_identifier VARCHAR(32),
  body_name VARCHAR(32),
  body_type VARCHAR(37),
  meeting_frequency VARCHAR(32),
  establishment_date DATE,
  is_external BOOLEAN,
  business_unit_id INTEGER,
  audits_business_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (business_unit_id) REFERENCES business_units (id),
  FOREIGN KEY (audits_business_unit_id) REFERENCES business_units (id)
);
