CREATE TABLE admission_applications (
  admission_application_id INTEGER NOT NULL,
  application_id VARCHAR(32),
  submission_date TIMESTAMP,
  application_status VARCHAR(32),
  funding_agreement_id VARCHAR(32),
  interview_scheduled BOOLEAN,
  oversubscribed BOOLEAN,
  student_id INTEGER,
  special_educational_need_id INTEGER,
  education_health_care_plan_id INTEGER,
  health_safety_risk_assessment_id INTEGER,
  PRIMARY KEY (admission_application_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (special_educational_need_id) REFERENCES special_educational_needs (special_educational_need_id),
  FOREIGN KEY (education_health_care_plan_id) REFERENCES education_health_care_plans (id),
  FOREIGN KEY (health_safety_risk_assessment_id) REFERENCES health_safety_risk_assessments (health_safety_risk_assessment_id)
);
