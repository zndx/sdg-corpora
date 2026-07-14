CREATE TABLE h_o_a_remedial_actions (
  id INTEGER NOT NULL,
  action_identifier VARCHAR(32),
  action_type VARCHAR(32),
  initiation_date TIMESTAMP,
  status VARCHAR(32),
  cost_incurred DECIMAL,
  h_o_a_violation_id INTEGER,
  h_o_a_member_id INTEGER,
  h_o_a_assessment_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (h_o_a_violation_id) REFERENCES h_o_a_violations (h_o_a_violation_id),
  FOREIGN KEY (h_o_a_member_id) REFERENCES h_o_a_members (h_o_a_member_id),
  FOREIGN KEY (h_o_a_assessment_id) REFERENCES h_o_a_assessments (h_o_a_assessment_id)
);
