CREATE TABLE districts_zones (
  district_id INTEGER NOT NULL,
  zone_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (district_id, zone_code),
  FOREIGN KEY (district_id) REFERENCES districts (district_id),
  FOREIGN KEY (zone_code) REFERENCES pickup_zones (zone_code)
);
