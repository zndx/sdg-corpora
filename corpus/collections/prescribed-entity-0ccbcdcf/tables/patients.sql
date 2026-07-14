CREATE TABLE patients (
  patient_id VARCHAR(32) NOT NULL,
  date_of_birth DATE,
  gender VARCHAR(32),
  residence_code VARCHAR(44),
  patient_record_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (patient_id),
  FOREIGN KEY (patient_record_id) REFERENCES patient_records (id)
);
