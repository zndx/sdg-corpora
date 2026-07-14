CREATE TABLE practices_professionals (
  medical_practice_id INTEGER NOT NULL,
  healthcare_professional_id INTEGER NOT NULL,
  PRIMARY KEY (medical_practice_id, healthcare_professional_id),
  FOREIGN KEY (medical_practice_id) REFERENCES medical_practices (medical_practice_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (healthcare_professional_id)
);
