CREATE TABLE office_locations (
  office_location_id INTEGER NOT NULL,
  location_id INTEGER,
  city VARCHAR(32),
  state VARCHAR(32),
  is_headquarters BOOLEAN,
  employee_capacity INTEGER,
  PRIMARY KEY (office_location_id)
);
