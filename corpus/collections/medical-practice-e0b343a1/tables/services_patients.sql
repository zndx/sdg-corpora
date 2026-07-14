CREATE TABLE services_patients (
  clinical_service_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_service_id, patient_id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (clinical_service_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
