CREATE TABLE students (
  student_id VARCHAR(32) NOT NULL,
  date_of_birth DATE,
  primary_diagnosis VARCHAR(37),
  has_communication_difficulty BOOLEAN,
  has_medical_needs BOOLEAN,
  has_continence_needs BOOLEAN,
  age INTEGER,
  student_placement_id INTEGER,
  education_health_care_plan_id INTEGER,
  assessment_id VARCHAR(42),
  PRIMARY KEY (student_id),
  FOREIGN KEY (student_placement_id) REFERENCES student_placements (id),
  FOREIGN KEY (education_health_care_plan_id) REFERENCES education_health_care_plans (id),
  FOREIGN KEY (assessment_id) REFERENCES health_safety_risk_assessments (assessment_id)
);
