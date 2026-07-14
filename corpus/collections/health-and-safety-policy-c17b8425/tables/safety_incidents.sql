CREATE TABLE safety_incidents (
  id INTEGER NOT NULL,
  incident_id VARCHAR(32),
  incident_type VARCHAR(32),
  severity_level VARCHAR(32),
  reported_date TIMESTAMP,
  investigation_status VARCHAR(32),
  worker_id INTEGER,
  facility_zone_id INTEGER,
  investigated_by_worker_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (worker_id) REFERENCES workers (worker_id),
  FOREIGN KEY (facility_zone_id) REFERENCES facility_zones (facility_zone_id),
  FOREIGN KEY (investigated_by_worker_id) REFERENCES workers (worker_id)
);
