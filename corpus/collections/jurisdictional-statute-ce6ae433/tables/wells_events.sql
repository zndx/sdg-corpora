CREATE TABLE wells_events (
  extraction_well_id INTEGER NOT NULL,
  resource_extraction_event_id INTEGER NOT NULL,
  PRIMARY KEY (extraction_well_id, resource_extraction_event_id),
  FOREIGN KEY (extraction_well_id) REFERENCES extraction_wells (id),
  FOREIGN KEY (resource_extraction_event_id) REFERENCES resource_extraction_events (id)
);
