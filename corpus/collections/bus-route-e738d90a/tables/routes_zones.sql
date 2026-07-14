CREATE TABLE routes_zones (
  bus_route_id INTEGER NOT NULL,
  zone_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (bus_route_id, zone_code),
  FOREIGN KEY (bus_route_id) REFERENCES bus_routes (bus_route_id),
  FOREIGN KEY (zone_code) REFERENCES pickup_zones (zone_code)
);
