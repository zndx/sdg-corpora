CREATE TABLE research_methods (
  id INTEGER NOT NULL,
  method_id INTEGER,
  method_name VARCHAR(32),
  method_category VARCHAR(32),
  accuracy_level DECIMAL,
  bias_risk VARCHAR(32),
  is_standardized BOOLEAN,
  PRIMARY KEY (id)
);
