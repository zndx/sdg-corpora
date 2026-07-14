CREATE TABLE gaulish_tribes (
  gaulish_tribe_id INTEGER NOT NULL,
  tribe_name VARCHAR(32),
  primary_occupation VARCHAR(32),
  settlement_region VARCHAR(32),
  ethnicity VARCHAR(32),
  is_celtic BOOLEAN,
  settlement_area_id INTEGER,
  ancient_inscription_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (gaulish_tribe_id),
  FOREIGN KEY (settlement_area_id) REFERENCES settlement_areas (settlement_area_id),
  FOREIGN KEY (ancient_inscription_id) REFERENCES ancient_inscriptions (ancient_inscription_id)
);
