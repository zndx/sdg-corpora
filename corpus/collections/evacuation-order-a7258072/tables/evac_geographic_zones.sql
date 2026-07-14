CREATE TABLE evac_geographic_zones (
  geographic_zone_id INTEGER NOT NULL,
  zone_identifier VARCHAR(32),
  zone_name VARCHAR(32),
  risk_level VARCHAR(32),
  population_count INTEGER,
  area_size DECIMAL,
  boundary_coordinates VARCHAR(32),
  evacuation_order_id INTEGER,
  evacuation_route_id INTEGER,
  hazard_event_id INTEGER,
  PRIMARY KEY (geographic_zone_id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evac_evacuation_orders (id),
  FOREIGN KEY (evacuation_route_id) REFERENCES evac_evacuation_routes (id),
  FOREIGN KEY (hazard_event_id) REFERENCES evac_hazard_events (id)
);
