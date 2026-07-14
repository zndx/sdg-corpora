CREATE TABLE pickup_zones (
  zone_name VARCHAR(32),
  zone_code VARCHAR(32) NOT NULL,
  district VARCHAR(32),
  special_instructions VARCHAR(32),
  bus_route_id INTEGER,
  district_id INTEGER,
  PRIMARY KEY (zone_code),
  FOREIGN KEY (bus_route_id) REFERENCES bus_routes (bus_route_id),
  FOREIGN KEY (district_id) REFERENCES districts (district_id)
);
