CREATE TABLE study_protocols (
  study_protocol_id INTEGER NOT NULL,
  study_identifier VARCHAR(32),
  study_title VARCHAR(32),
  target_enrollment_count INTEGER,
  start_date TIMESTAMP,
  funding_source VARCHAR(32),
  coverage_policy VARCHAR(32),
  imaging_procedure_id INTEGER,
  PRIMARY KEY (study_protocol_id),
  FOREIGN KEY (imaging_procedure_id) REFERENCES imaging_procedures (id)
);
