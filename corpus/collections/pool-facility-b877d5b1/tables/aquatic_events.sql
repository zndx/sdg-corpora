CREATE TABLE aquatic_events (
  aquatic_event_id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_name VARCHAR(32),
  event_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  capacity INTEGER,
  registration_fee DECIMAL,
  is_cancelled BOOLEAN,
  pool_facility_id INTEGER,
  PRIMARY KEY (aquatic_event_id),
  FOREIGN KEY (pool_facility_id) REFERENCES pool_facilities (pool_facility_id)
);
