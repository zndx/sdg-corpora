CREATE TABLE physicians_enrollments (
  physician_id INTEGER NOT NULL,
  enrollment_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (physician_id, enrollment_id),
  FOREIGN KEY (physician_id) REFERENCES physicians (physician_id),
  FOREIGN KEY (enrollment_id) REFERENCES patient_enrollments (enrollment_id)
);
