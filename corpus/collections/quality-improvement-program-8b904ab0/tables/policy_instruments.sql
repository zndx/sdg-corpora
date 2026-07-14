CREATE TABLE policy_instruments (
  policy_id VARCHAR(35) NOT NULL,
  policy_title VARCHAR(32),
  effective_date DATE,
  issuing_authority VARCHAR(32),
  policy_type VARCHAR(32),
  version VARCHAR(32),
  status VARCHAR(32),
  quality_improvement_program_id INTEGER,
  clinical_performance_data_id INTEGER,
  organization_org_id VARCHAR(32),
  PRIMARY KEY (policy_id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (id),
  FOREIGN KEY (clinical_performance_data_id) REFERENCES clinical_performance_datas (clinical_performance_data_id),
  FOREIGN KEY (organization_org_id) REFERENCES organizations (org_id)
);
