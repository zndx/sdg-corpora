CREATE TABLE evac_hazard_events (
  id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  event_type VARCHAR(32),
  severity_level INTEGER,
  affected_area VARCHAR(32),
  monitored BOOLEAN,
  evacuation_order_id INTEGER,
  geographic_zone_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evac_evacuation_orders (id),
  FOREIGN KEY (geographic_zone_id) REFERENCES evac_geographic_zones (geographic_zone_id)
);
