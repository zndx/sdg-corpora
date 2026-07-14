CREATE TABLE professionals_services (
  healthcare_professional_id INTEGER NOT NULL,
  clinical_service_id INTEGER NOT NULL,
  PRIMARY KEY (healthcare_professional_id, clinical_service_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (healthcare_professional_id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (clinical_service_id)
);
