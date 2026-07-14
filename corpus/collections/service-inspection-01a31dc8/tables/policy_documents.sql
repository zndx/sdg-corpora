CREATE TABLE policy_documents (
  policy_ref INTEGER NOT NULL,
  policy_title VARCHAR(32),
  publish_date DATE,
  policy_scope VARCHAR(32),
  legislation_reference VARCHAR(32),
  is_mandatory BOOLEAN,
  service_code VARCHAR(32),
  service_inspection_id INTEGER,
  PRIMARY KEY (policy_ref),
  FOREIGN KEY (service_code) REFERENCES social_care_services (service_code),
  FOREIGN KEY (service_inspection_id) REFERENCES service_inspections (id)
);
