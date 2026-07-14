CREATE TABLE categories_books (
  reading_category_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  PRIMARY KEY (reading_category_id, book_id),
  FOREIGN KEY (reading_category_id) REFERENCES reading_categories (reading_category_id),
  FOREIGN KEY (book_id) REFERENCES books (book_id)
);
