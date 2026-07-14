CREATE TABLE vehicles (
  id INTEGER NOT NULL,
  vehicle_id VARCHAR(32),
  vehicle_model VARCHAR(32),
  min_turning_radius DECIMAL,
  current_x DECIMAL,
  current_y DECIMAL,
  current_heading DECIMAL,
  vehicle_status VARCHAR(32),
  route_id INTEGER,
  zone_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (route_id) REFERENCES routes (id),
  FOREIGN KEY (zone_id) REFERENCES zones (id)
);
