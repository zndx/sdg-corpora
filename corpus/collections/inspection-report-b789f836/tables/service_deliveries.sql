CREATE TABLE service_deliveries (
  delivery_id VARCHAR(44) NOT NULL,
  start_date DATE,
  end_date DATE,
  provider_type VARCHAR(32),
  quality_rating DECIMAL,
  family_unit_id INTEGER,
  needs_assessment_id INTEGER,
  PRIMARY KEY (delivery_id),
  FOREIGN KEY (family_unit_id) REFERENCES family_units (family_unit_id),
  FOREIGN KEY (needs_assessment_id) REFERENCES needs_assessments (id)
);
