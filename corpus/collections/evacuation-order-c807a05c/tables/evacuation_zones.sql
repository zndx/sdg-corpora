CREATE TABLE evacuation_zones (
  id INTEGER NOT NULL,
  zone_identifier VARCHAR(32),
  zone_name VARCHAR(32),
  risk_category VARCHAR(32),
  estimated_resident_count INTEGER,
  zone_boundary_coordinates VARCHAR(32),
  is_coastal BOOLEAN,
  evacuation_order_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evacuation_orders (id)
);
