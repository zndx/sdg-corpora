CREATE TABLE airspace_zones (
  zone_id VARCHAR(44) NOT NULL,
  zone_type VARCHAR(32),
  altitude_limit_meters DECIMAL,
  radius_meters DECIMAL,
  enforcement_level VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (zone_id)
);
