CREATE TABLE governors (
  id INTEGER NOT NULL,
  governor_id VARCHAR(44),
  full_name VARCHAR(36),
  state VARCHAR(32),
  term_start_date TIMESTAMP,
  term_end_date TIMESTAMP,
  prior_profession VARCHAR(32),
  commute_mode VARCHAR(32),
  state_code INTEGER,
  vehicle_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (state_code) REFERENCES states (state_code),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles (id)
);
