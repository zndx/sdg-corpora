CREATE TABLE disclosure_events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  disclosure_date TIMESTAMP,
  method VARCHAR(32),
  is_successful BOOLEAN,
  is_nerve_wracking BOOLEAN,
  patient_id INTEGER,
  person_id VARCHAR(32),
  healthcare_professional_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (id)
);
