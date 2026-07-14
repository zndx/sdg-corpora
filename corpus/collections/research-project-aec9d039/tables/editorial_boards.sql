CREATE TABLE editorial_boards (
  id INTEGER NOT NULL,
  board_id VARCHAR(35),
  role VARCHAR(32),
  appointment_date DATE,
  journal_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (journal_id) REFERENCES journals (id)
);
