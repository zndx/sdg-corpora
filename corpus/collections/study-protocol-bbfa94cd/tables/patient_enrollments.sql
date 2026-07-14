CREATE TABLE patient_enrollments (
  enrollment_id VARCHAR(32) NOT NULL,
  patient_age INTEGER,
  clinical_diagnosis VARCHAR(35),
  enrollment_date TIMESTAMP,
  referring_physician_id VARCHAR(44),
  medicare_beneficiary_id VARCHAR(44),
  imaging_procedure_id INTEGER,
  study_protocol_id INTEGER,
  scan_result_id INTEGER,
  PRIMARY KEY (enrollment_id),
  FOREIGN KEY (imaging_procedure_id) REFERENCES imaging_procedures (id),
  FOREIGN KEY (study_protocol_id) REFERENCES study_protocols (study_protocol_id),
  FOREIGN KEY (scan_result_id) REFERENCES scan_results (id)
);
