CREATE TABLE services_professionals (
  clinical_service_id INTEGER NOT NULL,
  healthcare_professional_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_service_id, healthcare_professional_id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (clinical_service_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (healthcare_professional_id)
);
