CREATE TABLE social_stigmas (
  id INTEGER NOT NULL,
  stigma_id INTEGER,
  stigma_type VARCHAR(32),
  severity_level INTEGER,
  location VARCHAR(32),
  date_reported DATE,
  source VARCHAR(32),
  mainstream_school_id INTEGER,
  education_program_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (mainstream_school_id) REFERENCES mainstream_schools (id),
  FOREIGN KEY (education_program_id) REFERENCES education_programs (id)
);
