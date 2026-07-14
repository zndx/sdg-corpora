CREATE TABLE physical_locations (
  id INTEGER NOT NULL,
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  postal_code VARCHAR(35),
  country VARCHAR(32),
  building_floors INTEGER,
  total_area_sq_ft DECIMAL,
  PRIMARY KEY (id)
);
