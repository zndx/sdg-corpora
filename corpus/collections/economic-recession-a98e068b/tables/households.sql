CREATE TABLE households (
  household_id INTEGER NOT NULL,
  total_members INTEGER,
  child_count INTEGER,
  immigrant_status BOOLEAN,
  income_level DECIMAL,
  household_income_change_id INTEGER,
  safety_net_program_id INTEGER,
  PRIMARY KEY (household_id),
  FOREIGN KEY (household_income_change_id) REFERENCES household_income_changes (household_income_change_id),
  FOREIGN KEY (safety_net_program_id) REFERENCES safety_net_programs (id)
);
