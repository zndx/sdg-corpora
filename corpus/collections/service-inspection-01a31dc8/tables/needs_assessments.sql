CREATE TABLE needs_assessments (
  id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_date TIMESTAMP,
  assessment_type VARCHAR(32),
  is_service_led BOOLEAN,
  needs_identified INTEGER,
  assessment_outcome VARCHAR(32),
  agency_id VARCHAR(39),
  service_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (agency_id) REFERENCES service_agencies (agency_id),
  FOREIGN KEY (service_code) REFERENCES social_care_services (service_code)
);
