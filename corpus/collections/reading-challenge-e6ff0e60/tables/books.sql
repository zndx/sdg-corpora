CREATE TABLE books (
  book_id INTEGER NOT NULL,
  title VARCHAR(32),
  author_name VARCHAR(32),
  page_count INTEGER,
  genre VARCHAR(32),
  cover_color VARCHAR(32),
  has_award BOOLEAN,
  is_poetry BOOLEAN,
  is_non_fiction BOOLEAN,
  is_wordless BOOLEAN,
  PRIMARY KEY (book_id)
);
