CREATE TABLE chapters_educators (
  chapter_id INTEGER NOT NULL,
  educator_id INTEGER NOT NULL,
  PRIMARY KEY (chapter_id, educator_id),
  FOREIGN KEY (chapter_id) REFERENCES chapters (id),
  FOREIGN KEY (educator_id) REFERENCES educators (id)
);
