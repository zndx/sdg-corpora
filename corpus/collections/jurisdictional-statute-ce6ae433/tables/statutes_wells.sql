CREATE TABLE statutes_wells (
  jurisdictional_statute_id INTEGER NOT NULL,
  extraction_well_id INTEGER NOT NULL,
  PRIMARY KEY (jurisdictional_statute_id, extraction_well_id),
  FOREIGN KEY (jurisdictional_statute_id) REFERENCES jurisdictional_statutes (id),
  FOREIGN KEY (extraction_well_id) REFERENCES extraction_wells (id)
);
