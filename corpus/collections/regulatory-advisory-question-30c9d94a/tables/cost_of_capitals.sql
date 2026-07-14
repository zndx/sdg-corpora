CREATE TABLE cost_of_capitals (
  cost_of_capital_id INTEGER NOT NULL,
  cost_id INTEGER,
  calculation_date TIMESTAMP,
  discount_rate DECIMAL,
  risk_free_rate DECIMAL,
  beta_estimate DECIMAL,
  methodology VARCHAR(32),
  investment_project_id INTEGER,
  PRIMARY KEY (cost_of_capital_id),
  FOREIGN KEY (investment_project_id) REFERENCES investment_projects (investment_project_id)
);
