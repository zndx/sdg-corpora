CREATE TABLE shelters_routes (
  shelter_id INTEGER NOT NULL,
  evacuation_route_id INTEGER NOT NULL,
  PRIMARY KEY (shelter_id, evacuation_route_id),
  FOREIGN KEY (shelter_id) REFERENCES shelters (id),
  FOREIGN KEY (evacuation_route_id) REFERENCES evacuation_routes (evacuation_route_id)
);
