CREATE TABLE health_safety_risk_assessments (
  assessment_id VARCHAR(42) NOT NULL,
  assessment_date TIMESTAMP,
  risk_level VARCHAR(32),
  mitigation_steps VARCHAR(32),
  completed_by VARCHAR(32),
  student_id VARCHAR(32),
  student_placement_id INTEGER,
  PRIMARY KEY (assessment_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (student_placement_id) REFERENCES student_placements (id)
);
