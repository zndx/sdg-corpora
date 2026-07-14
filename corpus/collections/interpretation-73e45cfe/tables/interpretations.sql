CREATE TABLE interpretations (
  interpretation_id INTEGER NOT NULL,
  interpretation_name VARCHAR(32),
  primary_subject VARCHAR(32),
  is_mainstream BOOLEAN,
  is_author_preferred VARCHAR(32),
  biblical_text_id INTEGER,
  theological_claim_id INTEGER,
  contradicts_interpretation_id INTEGER,
  PRIMARY KEY (interpretation_id),
  FOREIGN KEY (biblical_text_id) REFERENCES biblical_texts (id),
  FOREIGN KEY (theological_claim_id) REFERENCES theological_claims (id),
  FOREIGN KEY (contradicts_interpretation_id) REFERENCES interpretations (interpretation_id)
);
