CREATE TABLE changes_verses (
  spiritual_change_id INTEGER NOT NULL,
  verse_id INTEGER NOT NULL,
  PRIMARY KEY (spiritual_change_id, verse_id),
  FOREIGN KEY (spiritual_change_id) REFERENCES spiritual_changes (spiritual_change_id),
  FOREIGN KEY (verse_id) REFERENCES verses (id)
);
