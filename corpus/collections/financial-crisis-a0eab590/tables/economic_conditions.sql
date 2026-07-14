CREATE TABLE economic_conditions (
  id INTEGER NOT NULL,
  condition_type VARCHAR(32),
  measurement_value DECIMAL,
  measurement_unit VARCHAR(32),
  geographic_scope VARCHAR(32),
  time_period VARCHAR(32),
  financial_crisis_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_crisis_id) REFERENCES financial_crisises (id)
);
