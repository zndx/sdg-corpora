CREATE TABLE administrative_regions (
  id INTEGER NOT NULL,
  region_code VARCHAR(40),
  region_name VARCHAR(32),
  region_level VARCHAR(32),
  bordering_country VARCHAR(32),
  climate_zone VARCHAR(32),
  health_authority_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (health_authority_id) REFERENCES health_authorities (id)
);
