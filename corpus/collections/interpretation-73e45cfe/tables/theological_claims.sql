CREATE TABLE theological_claims (
  id INTEGER NOT NULL,
  claim_id VARCHAR(40),
  claim_text VARCHAR(32),
  claim_type VARCHAR(32),
  is_covenantal BOOLEAN,
  is_eschatological BOOLEAN,
  biblical_text_id INTEGER,
  is_contradicted_by_biblical_text_id INTEGER,
  interpretation_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (biblical_text_id) REFERENCES biblical_texts (id),
  FOREIGN KEY (is_contradicted_by_biblical_text_id) REFERENCES biblical_texts (id),
  FOREIGN KEY (interpretation_id) REFERENCES interpretations (interpretation_id)
);
