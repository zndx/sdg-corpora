CREATE TABLE h_o_a_boards (
  h_o_a_board_id INTEGER NOT NULL,
  board_identifier VARCHAR(32),
  meeting_date DATE,
  quorum_status BOOLEAN,
  h_o_a_assessment_id INTEGER,
  h_o_a_remedial_action_id INTEGER,
  PRIMARY KEY (h_o_a_board_id),
  FOREIGN KEY (h_o_a_assessment_id) REFERENCES h_o_a_assessments (h_o_a_assessment_id),
  FOREIGN KEY (h_o_a_remedial_action_id) REFERENCES h_o_a_remedial_actions (id)
);
