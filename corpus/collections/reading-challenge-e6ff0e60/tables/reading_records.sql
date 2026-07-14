CREATE TABLE reading_records (
  id INTEGER NOT NULL,
  record_id INTEGER,
  book_title VARCHAR(32),
  author_name VARCHAR(32),
  completion_date DATE,
  category VARCHAR(32),
  page_count INTEGER,
  cover_color VARCHAR(32),
  is_recommended BOOLEAN,
  recommended_by VARCHAR(32),
  participant_id VARCHAR(44),
  reading_category_id INTEGER,
  book_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (participant_id) REFERENCES reading_participants (participant_id),
  FOREIGN KEY (reading_category_id) REFERENCES reading_categories (reading_category_id),
  FOREIGN KEY (book_id) REFERENCES books (book_id)
);
