CREATE TABLE healthcare_professionals (
  id INTEGER NOT NULL,
  professional_id INTEGER,
  name VARCHAR(32),
  specialty VARCHAR(32),
  license_number VARCHAR(32),
  employment_status VARCHAR(32),
  healthcare_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (healthcare_organization_id) REFERENCES healthcare_organizations (id)
);
