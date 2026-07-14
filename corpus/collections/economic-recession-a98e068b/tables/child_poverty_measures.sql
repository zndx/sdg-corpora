CREATE TABLE child_poverty_measures (
  id INTEGER NOT NULL,
  measure_type VARCHAR(32),
  poverty_rate DECIMAL,
  year INTEGER,
  state_code INTEGER,
  household_income_percentile DECIMAL,
  economic_recession_id INTEGER,
  household_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (economic_recession_id) REFERENCES economic_recessions (economic_recession_id),
  FOREIGN KEY (household_id) REFERENCES households (household_id)
);
