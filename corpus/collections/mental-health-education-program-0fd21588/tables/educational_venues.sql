CREATE TABLE educational_venues (
  educational_venue_id INTEGER NOT NULL,
  venue_identifier VARCHAR(32),
  venue_name VARCHAR(32),
  address VARCHAR(32),
  venue_type VARCHAR(32),
  capacity INTEGER,
  is_accessible BOOLEAN,
  mental_health_education_program_id INTEGER,
  youth_demographic_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (educational_venue_id),
  FOREIGN KEY (mental_health_education_program_id) REFERENCES mental_health_education_programs (mental_health_education_program_id),
  FOREIGN KEY (youth_demographic_id) REFERENCES youth_demographics (youth_demographic_id)
);
