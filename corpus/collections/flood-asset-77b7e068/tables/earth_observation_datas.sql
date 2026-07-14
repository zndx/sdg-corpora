CREATE TABLE earth_observation_datas (
  id INTEGER NOT NULL,
  data_product_id VARCHAR(32),
  acquisition_date TIMESTAMP,
  sensor_type VARCHAR(32),
  spatial_resolution DECIMAL,
  coverage_area DECIMAL,
  data_quality_index DECIMAL,
  is_copernicus_source BOOLEAN,
  geographic_zone_id INTEGER,
  satellite_mission_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_zone_id) REFERENCES geographic_zones (id),
  FOREIGN KEY (satellite_mission_id) REFERENCES satellite_missions (id)
);
