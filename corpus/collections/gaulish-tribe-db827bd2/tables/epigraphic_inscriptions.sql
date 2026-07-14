CREATE TABLE epigraphic_inscriptions (
  epigraphic_inscription_id INTEGER NOT NULL,
  inscription_text VARCHAR(32),
  script_type VARCHAR(32),
  discovery_location VARCHAR(32),
  deciphered_meaning VARCHAR(32),
  source_reference VARCHAR(32),
  historical_region_id INTEGER,
  linguistic_analysis_id INTEGER,
  gaulish_tribe_id INTEGER,
  PRIMARY KEY (epigraphic_inscription_id),
  FOREIGN KEY (historical_region_id) REFERENCES historical_regions (id),
  FOREIGN KEY (linguistic_analysis_id) REFERENCES linguistic_analysises (id),
  FOREIGN KEY (gaulish_tribe_id) REFERENCES gaulish_tribes (id)
);
