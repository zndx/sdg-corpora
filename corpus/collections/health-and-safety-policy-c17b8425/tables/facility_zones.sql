CREATE TABLE facility_zones (
  facility_zone_id INTEGER NOT NULL,
  zone_code VARCHAR(32),
  zone_name VARCHAR(32),
  occupancy_limit INTEGER,
  hazard_rating VARCHAR(32),
  last_inspection_date DATE,
  safety_incident_id INTEGER,
  workplace_activity_id INTEGER,
  PRIMARY KEY (facility_zone_id),
  FOREIGN KEY (safety_incident_id) REFERENCES safety_incidents (id),
  FOREIGN KEY (workplace_activity_id) REFERENCES workplace_activities (id)
);
