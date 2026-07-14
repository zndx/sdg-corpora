CREATE TABLE registered_managers (
  registered_manager_id INTEGER NOT NULL,
  manager_id VARCHAR(44),
  full_name VARCHAR(36),
  registration_date TIMESTAMP,
  legal_responsibility_scope VARCHAR(32),
  domiciliary_care_agency_id INTEGER,
  PRIMARY KEY (registered_manager_id),
  FOREIGN KEY (domiciliary_care_agency_id) REFERENCES domiciliary_care_agencies (domiciliary_care_agency_id)
);
