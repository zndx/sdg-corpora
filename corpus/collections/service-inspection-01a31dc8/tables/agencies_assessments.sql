CREATE TABLE agencies_assessments (
  agency_id VARCHAR(39) NOT NULL,
  needs_assessment_id INTEGER NOT NULL,
  PRIMARY KEY (agency_id, needs_assessment_id),
  FOREIGN KEY (agency_id) REFERENCES service_agencies (agency_id),
  FOREIGN KEY (needs_assessment_id) REFERENCES needs_assessments (id)
);
