CREATE TABLE events_sources (
  hydrological_event_id INTEGER NOT NULL,
  water_source_id INTEGER NOT NULL,
  PRIMARY KEY (hydrological_event_id, water_source_id),
  FOREIGN KEY (hydrological_event_id) REFERENCES hydrological_events (id),
  FOREIGN KEY (water_source_id) REFERENCES water_sources (id)
);
