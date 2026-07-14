CREATE TABLE healthcare_analytics_solutions (
  id INTEGER NOT NULL,
  solution_id INTEGER,
  solution_name VARCHAR(32),
  solution_type VARCHAR(32),
  vendor VARCHAR(32),
  is_web_based BOOLEAN,
  supports_big_data BOOLEAN,
  deployment_date DATE,
  healthcare_organization_id INTEGER,
  electronic_health_record_ehr_id VARCHAR(32),
  clinical_decision_support_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (healthcare_organization_id) REFERENCES healthcare_organizations (id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id),
  FOREIGN KEY (clinical_decision_support_id) REFERENCES clinical_decision_supports (id)
);
