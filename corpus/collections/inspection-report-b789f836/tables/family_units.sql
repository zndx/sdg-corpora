CREATE TABLE family_units (
  family_unit_id INTEGER NOT NULL,
  family_id VARCHAR(44),
  has_disabled_parent BOOLEAN,
  has_children BOOLEAN,
  impairment_type VARCHAR(32),
  needs_assessment_id INTEGER,
  PRIMARY KEY (family_unit_id),
  FOREIGN KEY (needs_assessment_id) REFERENCES needs_assessments (id)
);
