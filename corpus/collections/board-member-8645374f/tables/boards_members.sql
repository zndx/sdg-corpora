CREATE TABLE boards_members (
  board_id VARCHAR(35) NOT NULL,
  board_member_id INTEGER NOT NULL,
  PRIMARY KEY (board_id, board_member_id),
  FOREIGN KEY (board_id) REFERENCES governance_boards (board_id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (board_member_id)
);
