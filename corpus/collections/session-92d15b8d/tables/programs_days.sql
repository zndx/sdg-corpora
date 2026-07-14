CREATE TABLE programs_days (
  a_r_r_a_l_d_program_id INTEGER NOT NULL,
  program_day_id INTEGER NOT NULL,
  PRIMARY KEY (a_r_r_a_l_d_program_id, program_day_id),
  FOREIGN KEY (a_r_r_a_l_d_program_id) REFERENCES a_r_r_a_l_d_programs (id),
  FOREIGN KEY (program_day_id) REFERENCES program_days (program_day_id)
);
