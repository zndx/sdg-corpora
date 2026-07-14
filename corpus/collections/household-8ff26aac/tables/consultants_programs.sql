CREATE TABLE consultants_programs (
  consultant_id VARCHAR(44) NOT NULL,
  program_id INTEGER NOT NULL,
  PRIMARY KEY (consultant_id, program_id),
  FOREIGN KEY (consultant_id) REFERENCES energy_consultants (consultant_id),
  FOREIGN KEY (program_id) REFERENCES home_energy_reduction_programs (program_id)
);
