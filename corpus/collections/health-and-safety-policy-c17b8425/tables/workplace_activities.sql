CREATE TABLE workplace_activities (
  id INTEGER NOT NULL,
  activity_code VARCHAR(44),
  location_zone VARCHAR(32),
  risk_level VARCHAR(32),
  scheduled_date TIMESTAMP,
  status VARCHAR(32),
  worker_id INTEGER,
  facility_zone_id INTEGER,
  health_and_safety_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (worker_id) REFERENCES workers (worker_id),
  FOREIGN KEY (facility_zone_id) REFERENCES facility_zones (facility_zone_id),
  FOREIGN KEY (health_and_safety_policy_id) REFERENCES health_and_safety_policies (id)
);
