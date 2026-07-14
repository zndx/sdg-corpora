CREATE TABLE coastal_zones (
  id INTEGER NOT NULL,
  zone_identifier VARCHAR(32),
  zone_name VARCHAR(32),
  state_jurisdiction VARCHAR(32),
  latitude DECIMAL,
  longitude DECIMAL,
  flood_vulnerability_index DECIMAL,
  PRIMARY KEY (id)
);
