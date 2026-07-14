CREATE TABLE venues (
  venue_id INTEGER NOT NULL,
  venue_name VARCHAR(32),
  city VARCHAR(32),
  country VARCHAR(32),
  floor_type VARCHAR(32),
  capacity INTEGER,
  PRIMARY KEY (venue_id)
);
