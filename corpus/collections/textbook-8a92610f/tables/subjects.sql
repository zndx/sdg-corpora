CREATE TABLE subjects (
  id INTEGER NOT NULL,
  name VARCHAR(32),
  language_code VARCHAR(32),
  textbook_id INTEGER,
  exercise_book_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (textbook_id) REFERENCES textbooks (id),
  FOREIGN KEY (exercise_book_id) REFERENCES exercise_books (exercise_book_id)
);
