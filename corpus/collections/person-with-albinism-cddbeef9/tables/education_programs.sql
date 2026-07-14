CREATE TABLE education_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  target_demographic VARCHAR(32),
  funding_source VARCHAR(32),
  mainstream_school_id INTEGER,
  environmental_accommodation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (mainstream_school_id) REFERENCES mainstream_schools (id),
  FOREIGN KEY (environmental_accommodation_id) REFERENCES environmental_accommodations (environmental_accommodation_id)
);
