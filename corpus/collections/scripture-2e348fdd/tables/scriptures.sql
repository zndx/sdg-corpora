CREATE TABLE scriptures (
  id INTEGER NOT NULL,
  book_count INTEGER,
  canonical_status VARCHAR(32),
  is_god_breathed BOOLEAN,
  total_chapters INTEGER,
  total_verses INTEGER,
  original_language VARCHAR(32),
  is_immutable BOOLEAN,
  testament_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (testament_id) REFERENCES testaments (testament_id)
);
