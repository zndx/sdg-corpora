CREATE TABLE levels_books (
  grade_level_id INTEGER NOT NULL,
  exercise_book_id INTEGER NOT NULL,
  PRIMARY KEY (grade_level_id, exercise_book_id),
  FOREIGN KEY (grade_level_id) REFERENCES grade_levels (id),
  FOREIGN KEY (exercise_book_id) REFERENCES exercise_books (exercise_book_id)
);
