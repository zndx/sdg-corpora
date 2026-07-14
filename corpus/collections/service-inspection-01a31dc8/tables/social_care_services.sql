CREATE TABLE social_care_services (
  service_code VARCHAR(32) NOT NULL,
  service_name VARCHAR(32),
  service_type VARCHAR(32),
  delivery_mode VARCHAR(32),
  is_integrated BOOLEAN,
  eligibility_criteria VARCHAR(32),
  agency_id VARCHAR(39),
  needs_assessment_id INTEGER,
  PRIMARY KEY (service_code),
  FOREIGN KEY (agency_id) REFERENCES service_agencies (agency_id),
  FOREIGN KEY (needs_assessment_id) REFERENCES needs_assessments (id)
);
