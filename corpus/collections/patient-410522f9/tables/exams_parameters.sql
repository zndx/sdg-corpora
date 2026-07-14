CREATE TABLE exams_parameters (
  ophthalmological_exam_id INTEGER NOT NULL,
  visual_function_parameter_id INTEGER NOT NULL,
  PRIMARY KEY (ophthalmological_exam_id, visual_function_parameter_id),
  FOREIGN KEY (ophthalmological_exam_id) REFERENCES ophthalmological_exams (id),
  FOREIGN KEY (visual_function_parameter_id) REFERENCES visual_function_parameters (id)
);
