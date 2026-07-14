CREATE TABLE evac_evacuation_routes (
  id INTEGER NOT NULL,
  route_identifier VARCHAR(32),
  route_name VARCHAR(32),
  start_point VARCHAR(32),
  end_point VARCHAR(32),
  route_length DECIMAL,
  road_condition VARCHAR(32),
  recommended BOOLEAN,
  geographic_zone_id INTEGER,
  connects_to_geographic_zone_id INTEGER,
  evacuation_order_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_zone_id) REFERENCES evac_geographic_zones (geographic_zone_id),
  FOREIGN KEY (connects_to_geographic_zone_id) REFERENCES evac_geographic_zones (geographic_zone_id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evac_evacuation_orders (id)
);
