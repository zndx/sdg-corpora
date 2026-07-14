CREATE TABLE facilities_events (
  pool_facility_id INTEGER NOT NULL,
  aquatic_event_id INTEGER NOT NULL,
  PRIMARY KEY (pool_facility_id, aquatic_event_id),
  FOREIGN KEY (pool_facility_id) REFERENCES pool_facilities (pool_facility_id),
  FOREIGN KEY (aquatic_event_id) REFERENCES aquatic_events (aquatic_event_id)
);
