CREATE TABLE textbooks (
  id INTEGER NOT NULL,
  isbn10 VARCHAR(32),
  isbn13 VARCHAR(32),
  title VARCHAR(32),
  edition INTEGER,
  publication_date DATE,
  publisher VARCHAR(32),
  price DECIMAL,
  course_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);
