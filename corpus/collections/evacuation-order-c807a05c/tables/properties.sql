CREATE TABLE properties (
  id INTEGER NOT NULL,
  property_identifier VARCHAR(32),
  address VARCHAR(32),
  property_type VARCHAR(32),
  occupancy_status VARCHAR(32),
  has_vehicle_access BOOLEAN,
  flooding_risk BOOLEAN,
  evacuation_zone_id INTEGER,
  household_id INTEGER,
  evacuation_route_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (evacuation_zone_id) REFERENCES evacuation_zones (id),
  FOREIGN KEY (household_id) REFERENCES households (id),
  FOREIGN KEY (evacuation_route_id) REFERENCES evacuation_routes (evacuation_route_id)
);
