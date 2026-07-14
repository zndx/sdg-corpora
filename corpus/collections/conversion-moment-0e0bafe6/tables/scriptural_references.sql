CREATE TABLE scriptural_references (
  reference_id VARCHAR(32) NOT NULL,
  book_name VARCHAR(32),
  chapter_number INTEGER,
  verse_start INTEGER,
  verse_end INTEGER,
  text_excerpt VARCHAR(32),
  biblical_character_id INTEGER,
  conversion_moment_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (reference_id),
  FOREIGN KEY (biblical_character_id) REFERENCES biblical_characters (biblical_character_id),
  FOREIGN KEY (conversion_moment_id) REFERENCES conversion_moments (id)
);
