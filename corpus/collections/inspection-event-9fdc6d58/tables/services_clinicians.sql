CREATE TABLE services_clinicians (
  clinical_service_id INTEGER NOT NULL,
  clinician_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_service_id, clinician_id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (id),
  FOREIGN KEY (clinician_id) REFERENCES clinicians (id)
);
