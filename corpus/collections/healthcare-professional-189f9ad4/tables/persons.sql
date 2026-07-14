CREATE TABLE persons (
  person_id VARCHAR(32) NOT NULL,
  full_name VARCHAR(36),
  relationship_to_patient VARCHAR(32),
  is_trusted BOOLEAN,
  patient_id INTEGER,
  PRIMARY KEY (person_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);
