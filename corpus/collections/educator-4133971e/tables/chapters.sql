CREATE TABLE chapters (
  id INTEGER NOT NULL,
  chapter_id VARCHAR(40),
  chapter_name VARCHAR(32),
  location VARCHAR(32),
  founding_date DATE,
  current_members INTEGER,
  program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (program_id) REFERENCES programs (id)
);
