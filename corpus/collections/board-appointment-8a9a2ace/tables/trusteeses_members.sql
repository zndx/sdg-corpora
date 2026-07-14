CREATE TABLE trusteeses_members (
  board_of_trustees_id INTEGER NOT NULL,
  board_member_id INTEGER NOT NULL,
  PRIMARY KEY (board_of_trustees_id, board_member_id),
  FOREIGN KEY (board_of_trustees_id) REFERENCES board_of_trusteeses (id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (board_member_id)
);
