CREATE TABLE shelters (
  id INTEGER NOT NULL,
  shelter_identifier VARCHAR(32),
  shelter_name VARCHAR(32),
  shelter_type VARCHAR(32),
  current_occupancy INTEGER,
  max_capacity INTEGER,
  operational_status VARCHAR(32),
  PRIMARY KEY (id)
);
