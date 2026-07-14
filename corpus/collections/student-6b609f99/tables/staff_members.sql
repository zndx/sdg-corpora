CREATE TABLE staff_members (
  staff_member_id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  department VARCHAR(32),
  is_qualified BOOLEAN,
  employment_status VARCHAR(32),
  staff_training_module_id INTEGER,
  student_id INTEGER,
  health_safety_risk_assessment_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (staff_member_id),
  FOREIGN KEY (staff_training_module_id) REFERENCES staff_training_modules (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (health_safety_risk_assessment_id) REFERENCES health_safety_risk_assessments (health_safety_risk_assessment_id)
);
