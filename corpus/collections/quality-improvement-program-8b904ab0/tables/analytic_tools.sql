CREATE TABLE analytic_tools (
  analytic_tool_id INTEGER NOT NULL,
  tool_id VARCHAR(32),
  tool_name VARCHAR(32),
  tool_type VARCHAR(32),
  version VARCHAR(32),
  last_updated TIMESTAMP,
  validation_status VARCHAR(32),
  healthcare_professional_id INTEGER,
  quality_improvement_program_id INTEGER,
  PRIMARY KEY (analytic_tool_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (healthcare_professional_id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (id)
);
