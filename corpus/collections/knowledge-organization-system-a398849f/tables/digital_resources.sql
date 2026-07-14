CREATE TABLE digital_resources (
  resource_id INTEGER NOT NULL,
  title VARCHAR(32),
  format VARCHAR(32),
  date_created TIMESTAMP,
  date_modified TIMESTAMP,
  size_bytes INTEGER,
  status VARCHAR(32),
  controlled_term_id INTEGER,
  user_id INTEGER,
  digital_collection_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (resource_id),
  FOREIGN KEY (controlled_term_id) REFERENCES controlled_terms (controlled_term_id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (digital_collection_id) REFERENCES digital_collections (digital_collection_id)
);
