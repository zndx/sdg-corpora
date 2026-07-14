CREATE TABLE patients (
  id INTEGER NOT NULL,
  patient_i_d VARCHAR(32),
  full_name VARCHAR(36),
  date_of_birth DATE,
  registration_status VARCHAR(32),
  has_online_access BOOLEAN,
  medical_practice_id INTEGER,
  medication_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_practice_id) REFERENCES medical_practices (medical_practice_id),
  FOREIGN KEY (medication_id) REFERENCES medications (medication_id)
);
