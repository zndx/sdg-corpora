CREATE TABLE quantitative_analytic_tools (
  id INTEGER NOT NULL,
  tool_i_d VARCHAR(32),
  tool_name VARCHAR(32),
  tool_type VARCHAR(32),
  version VARCHAR(32),
  last_updated TIMESTAMP,
  validation_status VARCHAR(32),
  patient_outcome_id INTEGER,
  quality_improvement_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_outcome_id) REFERENCES patient_outcomes (id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (quality_improvement_program_id)
);
