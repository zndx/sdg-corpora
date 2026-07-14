CREATE TABLE clinics (
  clinic_id INTEGER NOT NULL,
  clinic_name VARCHAR(32),
  location VARCHAR(32),
  has_workshops BOOLEAN,
  healthcare_professional_id INTEGER,
  PRIMARY KEY (clinic_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (id)
);
