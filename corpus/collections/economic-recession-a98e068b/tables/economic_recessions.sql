CREATE TABLE economic_recessions (
  economic_recession_id INTEGER NOT NULL,
  start_date DATE,
  end_date DATE,
  peak_unemployment_rate DECIMAL,
  affected_states VARCHAR(32),
  severity_level VARCHAR(32),
  child_poverty_measure_id INTEGER,
  household_income_change_id INTEGER,
  PRIMARY KEY (economic_recession_id),
  FOREIGN KEY (child_poverty_measure_id) REFERENCES child_poverty_measures (id),
  FOREIGN KEY (household_income_change_id) REFERENCES household_income_changes (household_income_change_id)
);
