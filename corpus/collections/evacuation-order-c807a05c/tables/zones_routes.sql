CREATE TABLE zones_routes (
  evacuation_zone_id INTEGER NOT NULL,
  evacuation_route_id INTEGER NOT NULL,
  PRIMARY KEY (evacuation_zone_id, evacuation_route_id),
  FOREIGN KEY (evacuation_zone_id) REFERENCES evacuation_zones (id),
  FOREIGN KEY (evacuation_route_id) REFERENCES evacuation_routes (evacuation_route_id)
);
