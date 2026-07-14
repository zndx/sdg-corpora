CREATE TABLE geographic_zones (
  id INTEGER NOT NULL,
  zone_id VARCHAR(44),
  zone_name VARCHAR(32),
  zone_type VARCHAR(32),
  area_size DECIMAL,
  population_density DECIMAL,
  is_coastal BOOLEAN,
  flood_hazard_id INTEGER,
  earth_observation_data_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (flood_hazard_id) REFERENCES flood_hazards (id),
  FOREIGN KEY (earth_observation_data_id) REFERENCES earth_observation_datas (id)
);
