CREATE TABLE visual_function_parameters (
  id INTEGER NOT NULL,
  parameter_name VARCHAR(32),
  pre_treatment_value DECIMAL,
  post_treatment_value DECIMAL,
  improvement_percentage DECIMAL,
  improvement_status VARCHAR(32),
  ophthalmological_exam_id INTEGER,
  patient_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (ophthalmological_exam_id) REFERENCES ophthalmological_exams (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
