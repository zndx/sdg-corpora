CREATE TABLE healthcare_organizations (
  id INTEGER NOT NULL,
  organization_id VARCHAR(40),
  name VARCHAR(32),
  location_city VARCHAR(32),
  location_state VARCHAR(32),
  location_country VARCHAR(32),
  operating_margin DECIMAL,
  is_sustainable BOOLEAN,
  electronic_health_record_ehr_id VARCHAR(32),
  healthcare_analytics_solution_id INTEGER,
  clinical_decision_support_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id),
  FOREIGN KEY (healthcare_analytics_solution_id) REFERENCES healthcare_analytics_solutions (id),
  FOREIGN KEY (clinical_decision_support_id) REFERENCES clinical_decision_supports (id)
);
