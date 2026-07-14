CREATE TABLE facilities_events (
  facility_id INTEGER NOT NULL,
  event_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (facility_id, event_id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id),
  FOREIGN KEY (event_id) REFERENCES events (event_id)
);
