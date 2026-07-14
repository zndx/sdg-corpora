CREATE TABLE GeographicLocation (
  id INTEGER NOT NULL,
  locationId INTEGER,
  cityName VARCHAR(32),
  provinceState VARCHAR(32),
  country VARCHAR(32),
  latitude DECIMAL,
  longitude DECIMAL,
  elevation DECIMAL,
  timezone VARCHAR(32),
  PRIMARY KEY (id)
);
