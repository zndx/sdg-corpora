CREATE TABLE hydrological_events (
  id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  event_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  severity_index DECIMAL,
  affected_area_hectares DECIMAL,
  caused_herd_decimation BOOLEAN,
  geographic_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
