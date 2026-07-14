CREATE TABLE scriptures_verses (
  scripture_id INTEGER NOT NULL,
  verse_id INTEGER NOT NULL,
  PRIMARY KEY (scripture_id, verse_id),
  FOREIGN KEY (scripture_id) REFERENCES scriptures (id),
  FOREIGN KEY (verse_id) REFERENCES verses (id)
);
