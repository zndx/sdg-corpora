CREATE TABLE textbooks (
  textbook_id INTEGER NOT NULL,
  isbn VARCHAR(32),
  title VARCHAR(32),
  author VARCHAR(32),
  publisher VARCHAR(32),
  publication_year INTEGER,
  price DECIMAL,
  PRIMARY KEY (textbook_id)
);
