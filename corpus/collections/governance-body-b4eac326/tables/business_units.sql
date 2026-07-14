CREATE TABLE business_units (
  id INTEGER NOT NULL,
  unit_identifier VARCHAR(32),
  unit_name VARCHAR(32),
  unit_type VARCHAR(35),
  reporting_frequency VARCHAR(32),
  operational_status VARCHAR(32),
  governance_body_id INTEGER,
  internal_auditing_division_id INTEGER,
  supervised_by_governance_body_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (governance_body_id) REFERENCES governance_bodies (id),
  FOREIGN KEY (internal_auditing_division_id) REFERENCES internal_auditing_divisions (id),
  FOREIGN KEY (supervised_by_governance_body_id) REFERENCES governance_bodies (id)
);
