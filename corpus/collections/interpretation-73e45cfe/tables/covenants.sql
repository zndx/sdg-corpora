CREATE TABLE covenants (
  id INTEGER NOT NULL,
  covenant_id VARCHAR(44),
  covenant_name VARCHAR(32),
  is_unilateral BOOLEAN,
  is_bilateral BOOLEAN,
  promises VARCHAR(32),
  requirements VARCHAR(32),
  humanity_id INTEGER,
  theological_claim_id INTEGER,
  biblical_text_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (humanity_id) REFERENCES humanities (id),
  FOREIGN KEY (theological_claim_id) REFERENCES theological_claims (id),
  FOREIGN KEY (biblical_text_id) REFERENCES biblical_texts (id)
);
