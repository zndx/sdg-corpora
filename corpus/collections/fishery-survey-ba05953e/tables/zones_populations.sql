CREATE TABLE zones_populations (
  coastal_zone_id INTEGER NOT NULL,
  fishermen_population_id INTEGER NOT NULL,
  PRIMARY KEY (coastal_zone_id, fishermen_population_id),
  FOREIGN KEY (coastal_zone_id) REFERENCES coastal_zones (id),
  FOREIGN KEY (fishermen_population_id) REFERENCES fishermen_populations (fishermen_population_id)
);
