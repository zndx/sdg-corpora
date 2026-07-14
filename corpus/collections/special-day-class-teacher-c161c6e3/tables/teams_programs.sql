CREATE TABLE teams_programs (
  team_id VARCHAR(32) NOT NULL,
  individualized_education_program_iep_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (team_id, individualized_education_program_iep_id),
  FOREIGN KEY (team_id) REFERENCES i_e_p_teams (team_id),
  FOREIGN KEY (individualized_education_program_iep_id) REFERENCES individualized_education_programs (iep_id)
);
