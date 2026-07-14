CREATE TABLE patients_exams (
  patient_id INTEGER NOT NULL,
  ophthalmological_exam_id INTEGER NOT NULL,
  PRIMARY KEY (patient_id, ophthalmological_exam_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (ophthalmological_exam_id) REFERENCES ophthalmological_exams (id)
);
