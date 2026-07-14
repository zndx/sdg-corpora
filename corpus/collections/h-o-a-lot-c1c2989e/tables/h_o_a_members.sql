CREATE TABLE h_o_a_members (
  h_o_a_member_id INTEGER NOT NULL,
  member_identifier VARCHAR(32),
  voting_rights_status VARCHAR(32),
  recreational_access_status VARCHAR(32),
  contact_email VARCHAR(32),
  h_o_a_lot_id INTEGER,
  h_o_a_violation_id INTEGER,
  PRIMARY KEY (h_o_a_member_id),
  FOREIGN KEY (h_o_a_lot_id) REFERENCES h_o_a_lots (h_o_a_lot_id),
  FOREIGN KEY (h_o_a_violation_id) REFERENCES h_o_a_violations (h_o_a_violation_id)
);
