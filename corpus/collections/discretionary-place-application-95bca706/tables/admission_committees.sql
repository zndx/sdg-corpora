CREATE TABLE admission_committees (
  id INTEGER NOT NULL,
  committee_id VARCHAR(32),
  evaluation_date TIMESTAMP,
  result_release_date DATE,
  discretionary_place_application_id INTEGER,
  school_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (discretionary_place_application_id) REFERENCES discretionary_place_applications (discretionary_place_application_id),
  FOREIGN KEY (school_id) REFERENCES schools (school_id)
);
