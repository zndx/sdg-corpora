CREATE TABLE routes_zones (
  evacuation_route_id INTEGER NOT NULL,
  evacuation_zone_id INTEGER NOT NULL,
  PRIMARY KEY (evacuation_route_id, evacuation_zone_id),
  FOREIGN KEY (evacuation_route_id) REFERENCES evacuation_routes (evacuation_route_id),
  FOREIGN KEY (evacuation_zone_id) REFERENCES evacuation_zones (id)
);
