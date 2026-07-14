CREATE TABLE clinicians (
  id INTEGER NOT NULL,
  clinician_id INTEGER,
  clinician_name VARCHAR(32),
  specialization VARCHAR(32),
  training_completed BOOLEAN,
  safeguarding_awareness BOOLEAN,
  supervision_status VARCHAR(32),
  clinical_service_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (id)
);
