CREATE TABLE scan_results (
  id INTEGER NOT NULL,
  result_id INTEGER,
  amyloid_status VARCHAR(32),
  interpretation_text VARCHAR(32),
  result_date TIMESTAMP,
  clinical_impact VARCHAR(32),
  imaging_procedure_id INTEGER,
  enrollment_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (imaging_procedure_id) REFERENCES imaging_procedures (id),
  FOREIGN KEY (enrollment_id) REFERENCES patient_enrollments (enrollment_id)
);
