CREATE TABLE festival_venues (
  id INTEGER NOT NULL,
  venue_id VARCHAR(40),
  venue_name VARCHAR(32),
  city VARCHAR(32),
  district VARCHAR(32),
  state VARCHAR(32),
  pin_code VARCHAR(39),
  festival_start_date DATE,
  festival_end_date DATE,
  PRIMARY KEY (id)
);
