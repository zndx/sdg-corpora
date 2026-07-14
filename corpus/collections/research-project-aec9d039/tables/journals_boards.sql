CREATE TABLE journals_boards (
  journal_id INTEGER NOT NULL,
  editorial_board_id INTEGER NOT NULL,
  PRIMARY KEY (journal_id, editorial_board_id),
  FOREIGN KEY (journal_id) REFERENCES journals (id),
  FOREIGN KEY (editorial_board_id) REFERENCES editorial_boards (id)
);
