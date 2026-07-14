CREATE TABLE writing_systems (
  id INTEGER NOT NULL,
  system_name VARCHAR(32),
  origin_region VARCHAR(32),
  usage_period VARCHAR(32),
  is_alphabetic BOOLEAN,
  gaulish_tribe_id INTEGER,
  ancient_inscription_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (gaulish_tribe_id) REFERENCES gaulish_tribes (gaulish_tribe_id),
  FOREIGN KEY (ancient_inscription_id) REFERENCES ancient_inscriptions (ancient_inscription_id)
);
