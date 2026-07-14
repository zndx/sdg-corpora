CREATE TABLE clinical_engineering_teams (
  clinical_engineering_team_id INTEGER NOT NULL,
  team_identifier VARCHAR(32),
  team_name VARCHAR(32),
  has_c_i_o BOOLEAN,
  has_c_i_s_o BOOLEAN,
  responsibility_scope VARCHAR(32),
  is_formalized BOOLEAN,
  cybersecurity_program_id INTEGER,
  PRIMARY KEY (clinical_engineering_team_id),
  FOREIGN KEY (cybersecurity_program_id) REFERENCES cybersecurity_programs (id)
);
