CREATE TABLE environmental_accommodations (
  environmental_accommodation_id INTEGER NOT NULL,
  accommodation_id VARCHAR(44),
  accommodation_type VARCHAR(32),
  implementation_date TIMESTAMP,
  effectiveness_rating DECIMAL,
  status VARCHAR(32),
  description VARCHAR(32),
  mainstream_school_id INTEGER,
  education_program_id INTEGER,
  PRIMARY KEY (environmental_accommodation_id),
  FOREIGN KEY (mainstream_school_id) REFERENCES mainstream_schools (id),
  FOREIGN KEY (education_program_id) REFERENCES education_programs (id)
);
