CREATE TABLE programs_patients (
  program_id INTEGER NOT NULL,
  patient_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (program_id, patient_id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);
