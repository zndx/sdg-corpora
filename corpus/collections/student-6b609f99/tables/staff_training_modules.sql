CREATE TABLE staff_training_modules (
  id INTEGER NOT NULL,
  module_id VARCHAR(33),
  module_name VARCHAR(32),
  delivery_date TIMESTAMP,
  completion_status VARCHAR(32),
  target_audience VARCHAR(32),
  hours_required DECIMAL,
  special_educational_need_id INTEGER,
  staff_member_id INTEGER,
  health_safety_risk_assessment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (special_educational_need_id) REFERENCES special_educational_needs (special_educational_need_id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (staff_member_id),
  FOREIGN KEY (health_safety_risk_assessment_id) REFERENCES health_safety_risk_assessments (health_safety_risk_assessment_id)
);
