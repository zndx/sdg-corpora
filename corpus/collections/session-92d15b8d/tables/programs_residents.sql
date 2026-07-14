CREATE TABLE programs_residents (
  a_r_r_a_l_d_program_id INTEGER NOT NULL,
  resident_id INTEGER NOT NULL,
  PRIMARY KEY (a_r_r_a_l_d_program_id, resident_id),
  FOREIGN KEY (a_r_r_a_l_d_program_id) REFERENCES a_r_r_a_l_d_programs (id),
  FOREIGN KEY (resident_id) REFERENCES residents (id)
);
