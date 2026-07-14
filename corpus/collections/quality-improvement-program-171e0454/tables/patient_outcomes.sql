CREATE TABLE patient_outcomes (
  id INTEGER NOT NULL,
  outcome_i_d VARCHAR(32),
  measurement_date TIMESTAMP,
  outcome_type VARCHAR(32),
  value DECIMAL,
  unit_of_measure VARCHAR(32),
  improvement_direction VARCHAR(32),
  quality_improvement_program_id INTEGER,
  quantitative_analytic_tool_id INTEGER,
  first_responder_organization_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (quality_improvement_program_id),
  FOREIGN KEY (quantitative_analytic_tool_id) REFERENCES quantitative_analytic_tools (id),
  FOREIGN KEY (first_responder_organization_id) REFERENCES first_responder_organizations (first_responder_organization_id)
);
