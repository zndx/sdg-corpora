CREATE TABLE books_categories (
  book_id INTEGER NOT NULL,
  reading_category_id INTEGER NOT NULL,
  PRIMARY KEY (book_id, reading_category_id),
  FOREIGN KEY (book_id) REFERENCES books (book_id),
  FOREIGN KEY (reading_category_id) REFERENCES reading_categories (reading_category_id)
);
