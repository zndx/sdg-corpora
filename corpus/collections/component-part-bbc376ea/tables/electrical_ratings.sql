CREATE TABLE electrical_ratings (
  electrical_rating_id INTEGER NOT NULL,
  symbol VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  condition VARCHAR(32),
  is_repetitive BOOLEAN,
  is_surge BOOLEAN,
  component_part_id INTEGER,
  PRIMARY KEY (electrical_rating_id),
  FOREIGN KEY (component_part_id) REFERENCES component_parts (id)
);
