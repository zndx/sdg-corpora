CREATE TABLE h_o_a_lots (
  h_o_a_lot_id INTEGER NOT NULL,
  lot_identifier VARCHAR(32),
  legal_description VARCHAR(32),
  county VARCHAR(32),
  parcel_number VARCHAR(32),
  h_o_a_violation_id INTEGER,
  h_o_a_assessment_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (h_o_a_lot_id),
  FOREIGN KEY (h_o_a_violation_id) REFERENCES h_o_a_violations (h_o_a_violation_id),
  FOREIGN KEY (h_o_a_assessment_id) REFERENCES h_o_a_assessments (h_o_a_assessment_id)
);
