CREATE TABLE sanctions_screening_tools (
  sanctions_screening_tool_id INTEGER NOT NULL,
  tool_id VARCHAR(32),
  provider VARCHAR(32),
  deployment_model VARCHAR(32),
  implementation_months DECIMAL,
  cost_percentage DECIMAL,
  last_updated TIMESTAMP,
  list_coverage VARCHAR(32),
  is_auto_updating BOOLEAN,
  financial_institution_id INTEGER,
  consultancy_team_id INTEGER,
  PRIMARY KEY (sanctions_screening_tool_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (id),
  FOREIGN KEY (consultancy_team_id) REFERENCES consultancy_teams (id)
);
