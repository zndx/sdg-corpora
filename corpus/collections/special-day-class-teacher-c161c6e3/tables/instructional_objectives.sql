CREATE TABLE instructional_objectives (
  objective_id VARCHAR(44) NOT NULL,
  objective_type VARCHAR(32),
  target_skill VARCHAR(32),
  anticipated_attainment_level DECIMAL,
  measurement_method VARCHAR(32),
  due_date DATE,
  is_remedial BOOLEAN,
  individualized_education_program_iep_id VARCHAR(32),
  student_id INTEGER,
  PRIMARY KEY (objective_id),
  FOREIGN KEY (individualized_education_program_iep_id) REFERENCES individualized_education_programs (iep_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
