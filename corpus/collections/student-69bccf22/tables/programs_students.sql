CREATE TABLE programs_students (
  intervention_program_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (intervention_program_id, student_id),
  FOREIGN KEY (intervention_program_id) REFERENCES intervention_programs (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
