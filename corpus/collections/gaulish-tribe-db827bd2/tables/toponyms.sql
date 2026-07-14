CREATE TABLE toponyms (
  id INTEGER NOT NULL,
  name VARCHAR(32),
  region VARCHAR(32),
  slavic_root VARCHAR(32),
  source_map VARCHAR(32),
  confidence_level VARCHAR(32),
  historical_region_id INTEGER,
  gaulish_tribe_id INTEGER,
  historical_document_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (historical_region_id) REFERENCES historical_regions (id),
  FOREIGN KEY (gaulish_tribe_id) REFERENCES gaulish_tribes (id),
  FOREIGN KEY (historical_document_id) REFERENCES historical_documents (id)
);
