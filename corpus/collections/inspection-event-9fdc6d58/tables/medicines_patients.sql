CREATE TABLE medicines_patients (
  medicine_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  PRIMARY KEY (medicine_id, patient_id),
  FOREIGN KEY (medicine_id) REFERENCES medicines (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
