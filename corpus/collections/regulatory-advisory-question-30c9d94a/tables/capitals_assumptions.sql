CREATE TABLE capitals_assumptions (
  cost_of_capital_id INTEGER NOT NULL,
  financial_modeling_assumption_id INTEGER NOT NULL,
  PRIMARY KEY (cost_of_capital_id, financial_modeling_assumption_id),
  FOREIGN KEY (cost_of_capital_id) REFERENCES cost_of_capitals (cost_of_capital_id),
  FOREIGN KEY (financial_modeling_assumption_id) REFERENCES financial_modeling_assumptions (id)
);
