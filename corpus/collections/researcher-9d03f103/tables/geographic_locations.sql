CREATE TABLE geographic_locations (
  id INTEGER NOT NULL,
  location_id INTEGER,
  location_name VARCHAR(32),
  country_code VARCHAR(44),
  region_type VARCHAR(32),
  researcher_id INTEGER,
  telephone_interview_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id),
  FOREIGN KEY (telephone_interview_id) REFERENCES telephone_interviews (id)
);
