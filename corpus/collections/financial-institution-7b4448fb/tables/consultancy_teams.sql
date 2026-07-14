CREATE TABLE consultancy_teams (
  id INTEGER NOT NULL,
  team_id VARCHAR(32),
  vendor_name VARCHAR(36),
  primary_region VARCHAR(32),
  specialization VARCHAR(32),
  is_active BOOLEAN,
  financial_institution_id INTEGER,
  compliance_training_id INTEGER,
  sanctions_screening_tool_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (id),
  FOREIGN KEY (compliance_training_id) REFERENCES compliance_trainings (id),
  FOREIGN KEY (sanctions_screening_tool_id) REFERENCES sanctions_screening_tools (sanctions_screening_tool_id)
);
