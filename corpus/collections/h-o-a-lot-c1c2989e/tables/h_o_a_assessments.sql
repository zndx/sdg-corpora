CREATE TABLE h_o_a_assessments (
  h_o_a_assessment_id INTEGER NOT NULL,
  assessment_identifier VARCHAR(32),
  assessment_type VARCHAR(32),
  amount DECIMAL,
  due_date DATE,
  payment_status VARCHAR(32),
  issuance_date TIMESTAMP,
  h_o_a_lot_id INTEGER,
  h_o_a_violation_id INTEGER,
  h_o_a_board_id INTEGER,
  PRIMARY KEY (h_o_a_assessment_id),
  FOREIGN KEY (h_o_a_lot_id) REFERENCES h_o_a_lots (h_o_a_lot_id),
  FOREIGN KEY (h_o_a_violation_id) REFERENCES h_o_a_violations (h_o_a_violation_id),
  FOREIGN KEY (h_o_a_board_id) REFERENCES h_o_a_boards (h_o_a_board_id)
);
