CREATE TABLE investment_projects (
  investment_project_id INTEGER NOT NULL,
  project_id VARCHAR(44),
  provider_name VARCHAR(32),
  funding_source VARCHAR(32),
  total_value DECIMAL,
  implementation_status VARCHAR(32),
  risk_category VARCHAR(32),
  cost_of_capital_id INTEGER,
  regulatory_advisory_question_id INTEGER,
  PRIMARY KEY (investment_project_id),
  FOREIGN KEY (cost_of_capital_id) REFERENCES cost_of_capitals (cost_of_capital_id),
  FOREIGN KEY (regulatory_advisory_question_id) REFERENCES regulatory_advisory_questions (id)
);
