CREATE TABLE academic_authors (
  id INTEGER NOT NULL,
  author_id VARCHAR(32),
  full_name VARCHAR(36),
  affiliation VARCHAR(32),
  role VARCHAR(32),
  academic_text_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_text_id) REFERENCES academic_texts (id)
);
