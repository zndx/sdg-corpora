CREATE TABLE patients_services (
  patient_id INTEGER NOT NULL,
  clinical_service_id INTEGER NOT NULL,
  PRIMARY KEY (patient_id, clinical_service_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (clinical_service_id)
);
