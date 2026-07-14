CREATE TABLE programs_objectives (
  individualized_education_program_iep_id VARCHAR(32) NOT NULL,
  objective_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (individualized_education_program_iep_id, objective_id),
  FOREIGN KEY (individualized_education_program_iep_id) REFERENCES individualized_education_programs (iep_id),
  FOREIGN KEY (objective_id) REFERENCES instructional_objectives (objective_id)
);
