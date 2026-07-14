CREATE TABLE books_records (
  book_id INTEGER NOT NULL,
  reading_record_id INTEGER NOT NULL,
  PRIMARY KEY (book_id, reading_record_id),
  FOREIGN KEY (book_id) REFERENCES books (book_id),
  FOREIGN KEY (reading_record_id) REFERENCES reading_records (id)
);
