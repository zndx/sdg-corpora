CREATE TABLE models_patients (
  neural_network_model_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  PRIMARY KEY (neural_network_model_id, patient_id),
  FOREIGN KEY (neural_network_model_id) REFERENCES neural_network_models (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
