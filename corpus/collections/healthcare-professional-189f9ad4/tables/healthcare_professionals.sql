CREATE TABLE healthcare_professionals (
  id INTEGER NOT NULL,
  professional_id INTEGER,
  full_name VARCHAR(36),
  specialty VARCHAR(32),
  clinic_id VARCHAR(32),
  is_primary_care BOOLEAN,
  patient_id INTEGER,
  works_at_clinic_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (works_at_clinic_id) REFERENCES clinics (clinic_id)
);
