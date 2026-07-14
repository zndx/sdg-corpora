CREATE TABLE protocols_enrollments (
  study_protocol_id INTEGER NOT NULL,
  enrollment_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (study_protocol_id, enrollment_id),
  FOREIGN KEY (study_protocol_id) REFERENCES study_protocols (study_protocol_id),
  FOREIGN KEY (enrollment_id) REFERENCES patient_enrollments (enrollment_id)
);
