CREATE TABLE medications_prescriptions (
  medication_id INTEGER NOT NULL,
  prescription_id INTEGER NOT NULL,
  PRIMARY KEY (medication_id, prescription_id),
  FOREIGN KEY (medication_id) REFERENCES medications (medication_id),
  FOREIGN KEY (prescription_id) REFERENCES prescriptions (id)
);
