CREATE TABLE ophthalmological_exams (
  id INTEGER NOT NULL,
  exam_date TIMESTAMP,
  exam_type VARCHAR(32),
  visual_acuity DECIMAL,
  visual_field DECIMAL,
  visual_evoked_potentials DECIMAL,
  contrast_sensitivity DECIMAL,
  exam_performed_by VARCHAR(32),
  patient_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
