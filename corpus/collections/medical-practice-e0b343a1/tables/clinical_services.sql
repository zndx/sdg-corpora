CREATE TABLE clinical_services (
  clinical_service_id INTEGER NOT NULL,
  service_name VARCHAR(32),
  service_category VARCHAR(32),
  requires_appointment BOOLEAN,
  is_urgent_care BOOLEAN,
  medical_practice_id INTEGER,
  PRIMARY KEY (clinical_service_id),
  FOREIGN KEY (medical_practice_id) REFERENCES medical_practices (medical_practice_id)
);
