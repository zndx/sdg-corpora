CREATE TABLE answer_keys (
  id INTEGER NOT NULL,
  key_identifier VARCHAR(32),
  response_text VARCHAR(32),
  is_correct BOOLEAN,
  alternative_accepted BOOLEAN,
  format_type VARCHAR(32),
  assessment_item_id INTEGER,
  concept_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (assessment_item_id) REFERENCES assessment_items (id),
  FOREIGN KEY (concept_id) REFERENCES concepts (concept_id)
);
