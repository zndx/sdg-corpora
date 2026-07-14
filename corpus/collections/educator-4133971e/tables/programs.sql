CREATE TABLE programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_title VARCHAR(32),
  duration DECIMAL,
  status VARCHAR(32),
  target_audience VARCHAR(32),
  chapter_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (chapter_id) REFERENCES chapters (id)
);
