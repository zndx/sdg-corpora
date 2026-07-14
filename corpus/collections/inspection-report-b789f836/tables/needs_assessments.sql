CREATE TABLE needs_assessments (
  id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_date TIMESTAMP,
  assessment_type VARCHAR(32),
  family_size INTEGER,
  status VARCHAR(32),
  family_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (family_unit_id) REFERENCES family_units (family_unit_id)
);
