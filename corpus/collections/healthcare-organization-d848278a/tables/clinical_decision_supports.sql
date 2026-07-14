CREATE TABLE clinical_decision_supports (
  id INTEGER NOT NULL,
  cds_id VARCHAR(44),
  cds_name VARCHAR(32),
  cds_type VARCHAR(32),
  effectiveness DECIMAL,
  is_proactive BOOLEAN,
  is_predictive BOOLEAN,
  healthcare_analytics_solution_id INTEGER,
  electronic_health_record_ehr_id VARCHAR(32),
  healthcare_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (healthcare_analytics_solution_id) REFERENCES healthcare_analytics_solutions (id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id),
  FOREIGN KEY (healthcare_organization_id) REFERENCES healthcare_organizations (id)
);
