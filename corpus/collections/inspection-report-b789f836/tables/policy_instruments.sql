CREATE TABLE policy_instruments (
  instrument_id VARCHAR(32) NOT NULL,
  title VARCHAR(32),
  enactment_date DATE,
  scope VARCHAR(32),
  is_statutory BOOLEAN,
  service_domain_id INTEGER,
  needs_assessment_id INTEGER,
  PRIMARY KEY (instrument_id),
  FOREIGN KEY (service_domain_id) REFERENCES service_domains (service_domain_id),
  FOREIGN KEY (needs_assessment_id) REFERENCES needs_assessments (id)
);
