CREATE TABLE practices_patients (
  medical_practice_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  PRIMARY KEY (medical_practice_id, patient_id),
  FOREIGN KEY (medical_practice_id) REFERENCES medical_practices (medical_practice_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
