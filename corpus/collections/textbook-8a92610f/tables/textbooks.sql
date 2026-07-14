CREATE TABLE textbooks (
  id INTEGER NOT NULL,
  isbn VARCHAR(32),
  title VARCHAR(32),
  publisher VARCHAR(32),
  edition VARCHAR(32),
  price DECIMAL,
  subject VARCHAR(32),
  grade_level INTEGER,
  part_identifier VARCHAR(32),
  grade_level_id INTEGER,
  publisher_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (grade_level_id) REFERENCES grade_levels (id),
  FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id)
);
