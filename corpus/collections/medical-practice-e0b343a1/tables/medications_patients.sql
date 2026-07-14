CREATE TABLE medications_patients (
  medication_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  PRIMARY KEY (medication_id, patient_id),
  FOREIGN KEY (medication_id) REFERENCES medications (medication_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
