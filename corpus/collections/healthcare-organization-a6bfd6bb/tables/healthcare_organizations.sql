CREATE TABLE healthcare_organizations (
  id INTEGER NOT NULL,
  organization_id VARCHAR(40),
  name VARCHAR(32),
  location VARCHAR(32),
  established_date DATE,
  operating_margin DECIMAL,
  is_sustainable BOOLEAN,
  electronic_health_record_ehr_id VARCHAR(32),
  healthcare_professional_id INTEGER,
  analytics_solution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (id),
  FOREIGN KEY (analytics_solution_id) REFERENCES analytics_solutions (id)
);
