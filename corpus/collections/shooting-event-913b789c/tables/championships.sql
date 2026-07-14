CREATE TABLE championships (
  championship_name VARCHAR(32),
  edition_number INTEGER NOT NULL,
  host_city VARCHAR(32),
  host_country VARCHAR(32),
  start_date DATE,
  end_date DATE,
  location_id INTEGER,
  PRIMARY KEY (edition_number),
  FOREIGN KEY (location_id) REFERENCES locations (id)
);
