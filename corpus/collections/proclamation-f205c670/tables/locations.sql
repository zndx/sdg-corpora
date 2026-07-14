CREATE TABLE locations (
  id INTEGER NOT NULL,
  location_id INTEGER,
  name VARCHAR(32),
  type VARCHAR(32),
  coordinates VARCHAR(32),
  description VARCHAR(32),
  accessibility VARCHAR(32),
  PRIMARY KEY (id)
);
