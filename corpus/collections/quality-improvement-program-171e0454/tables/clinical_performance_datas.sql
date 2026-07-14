CREATE TABLE clinical_performance_datas (
  clinical_performance_data_id INTEGER NOT NULL,
  data_record_i_d VARCHAR(32),
  collection_date TIMESTAMP,
  metric_type VARCHAR(32),
  value DECIMAL,
  unit_of_measure VARCHAR(32),
  data_quality VARCHAR(32),
  first_responder_organization_id INTEGER,
  quantitative_analytic_tool_id INTEGER,
  quality_improvement_program_id INTEGER,
  PRIMARY KEY (clinical_performance_data_id),
  FOREIGN KEY (first_responder_organization_id) REFERENCES first_responder_organizations (first_responder_organization_id),
  FOREIGN KEY (quantitative_analytic_tool_id) REFERENCES quantitative_analytic_tools (id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (quality_improvement_program_id)
);
