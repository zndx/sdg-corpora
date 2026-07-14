CREATE TABLE biblical_texts (
  id INTEGER NOT NULL,
  text_id VARCHAR(44),
  book_name VARCHAR(32),
  chapter_number INTEGER,
  verse_range VARCHAR(32),
  language VARCHAR(32),
  is_historic_narrative BOOLEAN,
  interpretation_id INTEGER,
  theological_claim_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (interpretation_id) REFERENCES interpretations (interpretation_id),
  FOREIGN KEY (theological_claim_id) REFERENCES theological_claims (id)
);
