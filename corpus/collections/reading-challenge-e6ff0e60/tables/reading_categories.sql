CREATE TABLE reading_categories (
  reading_category_id INTEGER NOT NULL,
  category_id VARCHAR(44),
  category_name VARCHAR(32),
  description VARCHAR(32),
  is_required BOOLEAN,
  year_group VARCHAR(32),
  reading_challenge_id INTEGER,
  PRIMARY KEY (reading_category_id),
  FOREIGN KEY (reading_challenge_id) REFERENCES reading_challenges (id)
);
