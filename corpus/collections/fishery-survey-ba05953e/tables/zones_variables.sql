CREATE TABLE zones_variables (
  coastal_zone_id INTEGER NOT NULL,
  environmental_variable_id INTEGER NOT NULL,
  PRIMARY KEY (coastal_zone_id, environmental_variable_id),
  FOREIGN KEY (coastal_zone_id) REFERENCES coastal_zones (id),
  FOREIGN KEY (environmental_variable_id) REFERENCES environmental_variables (environmental_variable_id)
);
