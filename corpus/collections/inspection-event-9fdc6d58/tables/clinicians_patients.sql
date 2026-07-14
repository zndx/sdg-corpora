CREATE TABLE clinicians_patients (
  clinician_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  PRIMARY KEY (clinician_id, patient_id),
  FOREIGN KEY (clinician_id) REFERENCES clinicians (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
