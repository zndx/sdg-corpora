CREATE TABLE students (
  student_id INTEGER NOT NULL,
  date_of_birth DATE,
  age INTEGER,
  primary_diagnosis VARCHAR(32),
  ehcp_reference VARCHAR(32),
  enrollment_status VARCHAR(32),
  education_health_care_plan_id INTEGER,
  special_educational_need_id INTEGER,
  health_safety_risk_assessment_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (student_id),
  FOREIGN KEY (education_health_care_plan_id) REFERENCES education_health_care_plans (id),
  FOREIGN KEY (special_educational_need_id) REFERENCES special_educational_needs (special_educational_need_id),
  FOREIGN KEY (health_safety_risk_assessment_id) REFERENCES health_safety_risk_assessments (health_safety_risk_assessment_id)
);
