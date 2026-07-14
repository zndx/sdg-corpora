CREATE TABLE program_days (
  program_day_id INTEGER NOT NULL,
  date DATE,
  day_number INTEGER,
  location VARCHAR(32),
  a_r_r_a_l_d_program_id INTEGER,
  PRIMARY KEY (program_day_id),
  FOREIGN KEY (a_r_r_a_l_d_program_id) REFERENCES a_r_r_a_l_d_programs (id)
);
