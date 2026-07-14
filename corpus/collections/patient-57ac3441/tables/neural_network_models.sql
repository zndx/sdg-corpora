CREATE TABLE neural_network_models (
  id INTEGER NOT NULL,
  model_id VARCHAR(44),
  architecture_type VARCHAR(40),
  accuracy DECIMAL,
  training_date DATE,
  clinical_profile_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_profile_id) REFERENCES clinical_profiles (id)
);
