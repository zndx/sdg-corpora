CREATE TABLE hazard_events (
  hazard_event_id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  event_category VARCHAR(32),
  severity_level INTEGER,
  onset_date_time TIMESTAMP,
  peak_intensity_date_time TIMESTAMP,
  affected_population_count INTEGER,
  is_monitored BOOLEAN,
  evacuation_order_id INTEGER,
  evacuation_route_id INTEGER,
  PRIMARY KEY (hazard_event_id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evacuation_orders (id),
  FOREIGN KEY (evacuation_route_id) REFERENCES evacuation_routes (evacuation_route_id)
);
