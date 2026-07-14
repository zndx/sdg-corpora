CREATE TABLE boards_members (
  municipal_board_id INTEGER NOT NULL,
  selectboard_member_id INTEGER NOT NULL,
  PRIMARY KEY (municipal_board_id, selectboard_member_id),
  FOREIGN KEY (municipal_board_id) REFERENCES municipal_boards (id),
  FOREIGN KEY (selectboard_member_id) REFERENCES selectboard_members (id)
);
