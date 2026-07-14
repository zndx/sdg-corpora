CREATE TABLE boards_researchers (
  editorial_board_id INTEGER NOT NULL,
  researcher_id INTEGER NOT NULL,
  PRIMARY KEY (editorial_board_id, researcher_id),
  FOREIGN KEY (editorial_board_id) REFERENCES editorial_boards (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id)
);
