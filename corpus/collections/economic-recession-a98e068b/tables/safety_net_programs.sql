CREATE TABLE safety_net_programs (
  id INTEGER NOT NULL,
  program_name VARCHAR(32),
  program_type VARCHAR(32),
  eligibility_criteria VARCHAR(32),
  funding_source VARCHAR(32),
  household_id INTEGER,
  child_poverty_measure_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (household_id) REFERENCES households (household_id),
  FOREIGN KEY (child_poverty_measure_id) REFERENCES child_poverty_measures (id)
);
