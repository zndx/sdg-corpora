CREATE TABLE domiciliary_care_agencies (
  domiciliary_care_agency_id INTEGER NOT NULL,
  registration_number VARCHAR(32),
  legal_name VARCHAR(32),
  physical_address VARCHAR(32),
  telephone VARCHAR(32),
  website VARCHAR(56),
  operational_status VARCHAR(32),
  registered_manager_id INTEGER,
  regulatory_inspection_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (domiciliary_care_agency_id),
  FOREIGN KEY (registered_manager_id) REFERENCES registered_managers (registered_manager_id),
  FOREIGN KEY (regulatory_inspection_id) REFERENCES regulatory_inspections (regulatory_inspection_id)
);
