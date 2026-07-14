CREATE TABLE home_energy_reduction_programs (
  program_id INTEGER NOT NULL,
  start_date DATE,
  end_date DATE,
  program_status VARCHAR(32),
  target_savings_percent DECIMAL,
  household_id INTEGER,
  consultant_id VARCHAR(44),
  PRIMARY KEY (program_id),
  FOREIGN KEY (household_id) REFERENCES households (id),
  FOREIGN KEY (consultant_id) REFERENCES energy_consultants (consultant_id)
);
