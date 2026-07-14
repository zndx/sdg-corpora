CREATE TABLE committees_members (
  nomination_committee_id INTEGER NOT NULL,
  board_member_id INTEGER NOT NULL,
  PRIMARY KEY (nomination_committee_id, board_member_id),
  FOREIGN KEY (nomination_committee_id) REFERENCES nomination_committees (nomination_committee_id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (id)
);
