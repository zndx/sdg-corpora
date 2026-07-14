CREATE TABLE verses (
  id INTEGER NOT NULL,
  book_reference VARCHAR(32),
  chapter_number INTEGER,
  verse_number INTEGER,
  text_content VARCHAR(32),
  is_promise BOOLEAN,
  is_teaching BOOLEAN,
  is_prophecy BOOLEAN,
  is_historical BOOLEAN,
  scripture_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (scripture_id) REFERENCES scriptures (id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
