CREATE TABLE residents (
  id INTEGER NOT NULL,
  resident_id INTEGER,
  full_name VARCHAR(36),
  institution VARCHAR(32),
  year_of_training INTEGER,
  a_r_r_a_l_d_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (a_r_r_a_l_d_program_id) REFERENCES a_r_r_a_l_d_programs (id)
);
