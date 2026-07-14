CREATE TABLE zones_properties (
  evacuation_zone_id INTEGER NOT NULL,
  property_id INTEGER NOT NULL,
  PRIMARY KEY (evacuation_zone_id, property_id),
  FOREIGN KEY (evacuation_zone_id) REFERENCES evacuation_zones (id),
  FOREIGN KEY (property_id) REFERENCES properties (id)
);
