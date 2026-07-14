CREATE TABLE publishers_textbooks (
  publisher_id INTEGER NOT NULL,
  textbook_id INTEGER NOT NULL,
  PRIMARY KEY (publisher_id, textbook_id),
  FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id),
  FOREIGN KEY (textbook_id) REFERENCES textbooks (id)
);
