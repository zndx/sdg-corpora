CREATE TABLE individualized_education_programs (
  iep_id VARCHAR(32) NOT NULL,
  creation_date DATE,
  last_review_date DATE,
  expiration_date DATE,
  status VARCHAR(32),
  meets_federal_compliance BOOLEAN,
  meets_state_compliance BOOLEAN,
  student_id INTEGER,
  team_id VARCHAR(32),
  PRIMARY KEY (iep_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (team_id) REFERENCES i_e_p_teams (team_id)
);
