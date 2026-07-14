CREATE TABLE medications (
  medication_id INTEGER NOT NULL,
  medication_name VARCHAR(32),
  dosage_form VARCHAR(32),
  prescription_status VARCHAR(32),
  transmission_date TIMESTAMP,
  healthcare_professional_id INTEGER,
  PRIMARY KEY (medication_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (healthcare_professional_id)
);
