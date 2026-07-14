CREATE TABLE persons (
  id INTEGER NOT NULL,
  name VARCHAR(34),
  is_divine BOOLEAN,
  is_apostle BOOLEAN,
  is_prophet BOOLEAN,
  is_disciple BOOLEAN,
  is_messiah BOOLEAN,
  verse_id INTEGER,
  is_subject_of_verse_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (verse_id) REFERENCES verses (id),
  FOREIGN KEY (is_subject_of_verse_id) REFERENCES verses (id)
);
