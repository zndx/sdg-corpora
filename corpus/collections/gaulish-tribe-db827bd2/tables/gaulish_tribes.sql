CREATE TABLE gaulish_tribes (
  id INTEGER NOT NULL,
  ethnonym VARCHAR(32),
  primary_occupation VARCHAR(32),
  settlement_area VARCHAR(32),
  is_celtic_origin BOOLEAN,
  slavic_etymology VARCHAR(32),
  epigraphic_inscription_id INTEGER,
  historical_region_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (epigraphic_inscription_id) REFERENCES epigraphic_inscriptions (epigraphic_inscription_id),
  FOREIGN KEY (historical_region_id) REFERENCES historical_regions (id)
);
