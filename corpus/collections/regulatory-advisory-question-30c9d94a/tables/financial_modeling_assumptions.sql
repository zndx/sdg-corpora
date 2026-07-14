CREATE TABLE financial_modeling_assumptions (
  id INTEGER NOT NULL,
  assumption_id VARCHAR(44),
  assumption_type VARCHAR(32),
  parameter_name VARCHAR(32),
  value_range_lower_bound DECIMAL,
  value_range_upper_bound DECIMAL,
  is_benchmark BOOLEAN,
  status VARCHAR(32),
  cost_of_capital_id INTEGER,
  regulatory_advisory_question_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (cost_of_capital_id) REFERENCES cost_of_capitals (cost_of_capital_id),
  FOREIGN KEY (regulatory_advisory_question_id) REFERENCES regulatory_advisory_questions (id)
);
