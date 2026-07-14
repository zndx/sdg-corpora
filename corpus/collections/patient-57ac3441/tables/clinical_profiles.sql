CREATE TABLE clinical_profiles (
  id INTEGER NOT NULL,
  profile_id VARCHAR(44),
  urea DECIMAL,
  creatinine DECIMAL,
  potassium DECIMAL,
  sodium DECIMAL,
  calcium DECIMAL,
  phosphorus DECIMAL,
  uric_acid DECIMAL,
  patient_id INTEGER,
  neural_network_model_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (neural_network_model_id) REFERENCES neural_network_models (id)
);
