CREATE TABLE resolutions_members (
  fee_resolution_id INTEGER NOT NULL,
  board_member_id INTEGER NOT NULL,
  PRIMARY KEY (fee_resolution_id, board_member_id),
  FOREIGN KEY (fee_resolution_id) REFERENCES fee_resolutions (id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (id)
);
