CREATE TABLE patients (
  patient_id INTEGER NOT NULL,
  date_of_birth DATE,
  diagnosis_date DATE,
  status VARCHAR(32),
  is_minor BOOLEAN,
  healthcare_professional_id INTEGER,
  person_id VARCHAR(32),
  has_family_member_person_id VARCHAR(32),
  has_close_friend_person_id VARCHAR(32),
  PRIMARY KEY (patient_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (has_family_member_person_id) REFERENCES persons (person_id),
  FOREIGN KEY (has_close_friend_person_id) REFERENCES persons (person_id)
);
