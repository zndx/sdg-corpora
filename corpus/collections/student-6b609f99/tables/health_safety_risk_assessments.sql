CREATE TABLE health_safety_risk_assessments (
  health_safety_risk_assessment_id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_date TIMESTAMP,
  risk_level VARCHAR(32),
  mitigation_plan VARCHAR(32),
  completed_by VARCHAR(32),
  status VARCHAR(32),
  student_id INTEGER,
  admission_application_id INTEGER,
  staff_training_module_id INTEGER,
  PRIMARY KEY (health_safety_risk_assessment_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (admission_application_id) REFERENCES admission_applications (admission_application_id),
  FOREIGN KEY (staff_training_module_id) REFERENCES staff_training_modules (id)
);
