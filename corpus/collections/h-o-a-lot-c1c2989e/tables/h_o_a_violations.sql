CREATE TABLE h_o_a_violations (
  h_o_a_violation_id INTEGER NOT NULL,
  violation_identifier VARCHAR(32),
  violation_type VARCHAR(32),
  severity_level VARCHAR(32),
  is_continuing BOOLEAN,
  reported_date TIMESTAMP,
  resolution_status VARCHAR(32),
  h_o_a_lot_id INTEGER,
  h_o_a_member_id INTEGER,
  h_o_a_assessment_id INTEGER,
  h_o_a_remedial_action_id INTEGER,
  PRIMARY KEY (h_o_a_violation_id),
  FOREIGN KEY (h_o_a_lot_id) REFERENCES h_o_a_lots (h_o_a_lot_id),
  FOREIGN KEY (h_o_a_member_id) REFERENCES h_o_a_members (h_o_a_member_id),
  FOREIGN KEY (h_o_a_assessment_id) REFERENCES h_o_a_assessments (h_o_a_assessment_id),
  FOREIGN KEY (h_o_a_remedial_action_id) REFERENCES h_o_a_remedial_actions (id)
);
