CREATE TABLE communication_factors (
  id INTEGER NOT NULL,
  factor_id VARCHAR(32),
  factor_name VARCHAR(32),
  category VARCHAR(32),
  impact_score DECIMAL,
  is_positive BOOLEAN,
  PRIMARY KEY (id)
);
