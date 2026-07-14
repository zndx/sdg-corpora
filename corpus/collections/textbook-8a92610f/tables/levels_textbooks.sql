CREATE TABLE levels_textbooks (
  grade_level_id INTEGER NOT NULL,
  textbook_id INTEGER NOT NULL,
  PRIMARY KEY (grade_level_id, textbook_id),
  FOREIGN KEY (grade_level_id) REFERENCES grade_levels (id),
  FOREIGN KEY (textbook_id) REFERENCES textbooks (id)
);
