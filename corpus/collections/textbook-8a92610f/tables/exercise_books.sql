CREATE TABLE exercise_books (
  exercise_book_id INTEGER NOT NULL,
  code VARCHAR(34),
  description VARCHAR(32),
  size VARCHAR(32),
  line_type VARCHAR(32),
  unit_price VARCHAR(32),
  required_quantity INTEGER,
  subject VARCHAR(32),
  is_compulsory BOOLEAN,
  grade_level_id INTEGER,
  subject_id INTEGER,
  PRIMARY KEY (exercise_book_id),
  FOREIGN KEY (grade_level_id) REFERENCES grade_levels (id),
  FOREIGN KEY (subject_id) REFERENCES subjects (id)
);
