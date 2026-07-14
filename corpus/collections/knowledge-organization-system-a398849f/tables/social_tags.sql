CREATE TABLE social_tags (
  id INTEGER NOT NULL,
  tag_id VARCHAR(44),
  tag_text VARCHAR(32),
  spelling_variant VARCHAR(32),
  usage_count INTEGER,
  first_used TIMESTAMP,
  last_used TIMESTAMP,
  is_ambiguous BOOLEAN,
  resource_id INTEGER,
  user_id INTEGER,
  controlled_term_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (resource_id) REFERENCES digital_resources (resource_id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (controlled_term_id) REFERENCES controlled_terms (controlled_term_id)
);
