CREATE TABLE evacuation_routes (
  evacuation_route_id INTEGER NOT NULL,
  route_identifier VARCHAR(32),
  route_name VARCHAR(32),
  route_status VARCHAR(32),
  capacity_rating INTEGER,
  is_shortcut BOOLEAN,
  flood_risk_level VARCHAR(32),
  shelter_id INTEGER,
  PRIMARY KEY (evacuation_route_id),
  FOREIGN KEY (shelter_id) REFERENCES shelters (id)
);
