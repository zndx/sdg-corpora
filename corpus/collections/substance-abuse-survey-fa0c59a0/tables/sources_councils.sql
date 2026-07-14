CREATE TABLE sources_councils (
  funding_source_id INTEGER NOT NULL,
  coordinating_council_id INTEGER NOT NULL,
  PRIMARY KEY (funding_source_id, coordinating_council_id),
  FOREIGN KEY (funding_source_id) REFERENCES funding_sources (id),
  FOREIGN KEY (coordinating_council_id) REFERENCES coordinating_councils (coordinating_council_id)
);
