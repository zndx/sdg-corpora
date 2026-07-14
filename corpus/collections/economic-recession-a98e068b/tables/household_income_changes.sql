CREATE TABLE household_income_changes (
  household_income_change_id INTEGER NOT NULL,
  change_percentage DECIMAL,
  direction VARCHAR(32),
  cause VARCHAR(32),
  measurement_period TIMESTAMP,
  economic_recession_id INTEGER,
  household_id INTEGER,
  PRIMARY KEY (household_income_change_id),
  FOREIGN KEY (economic_recession_id) REFERENCES economic_recessions (economic_recession_id),
  FOREIGN KEY (household_id) REFERENCES households (household_id)
);
