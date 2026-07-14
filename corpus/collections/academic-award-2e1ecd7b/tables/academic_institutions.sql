CREATE TABLE academic_institutions (
  academic_institution_id INTEGER NOT NULL,
  institution_identifier VARCHAR(32),
  institution_name VARCHAR(32),
  founding_year INTEGER,
  location_city VARCHAR(32),
  location_state VARCHAR(32),
  location_country VARCHAR(32),
  institution_type VARCHAR(32),
  researcher_id INTEGER,
  awarded_degree_to_researcher_id INTEGER,
  leadership_position_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (academic_institution_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (awarded_degree_to_researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (leadership_position_id) REFERENCES leadership_positions (id)
);
