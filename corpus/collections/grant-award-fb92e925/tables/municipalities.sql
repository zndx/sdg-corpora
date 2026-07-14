CREATE TABLE municipalities (
  municipality_id INTEGER NOT NULL,
  municipality_name VARCHAR(32),
  municipality_code VARCHAR(44),
  state_province VARCHAR(32),
  country VARCHAR(32),
  population INTEGER,
  area_sq_km DECIMAL,
  facility_id INTEGER,
  PRIMARY KEY (municipality_id),
  FOREIGN KEY (facility_id) REFERENCES facilities (facility_id)
);
