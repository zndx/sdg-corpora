CREATE TABLE patients_clinicians (
  patient_id INTEGER NOT NULL,
  clinician_id INTEGER NOT NULL,
  PRIMARY KEY (patient_id, clinician_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (clinician_id) REFERENCES clinicians (id)
);
