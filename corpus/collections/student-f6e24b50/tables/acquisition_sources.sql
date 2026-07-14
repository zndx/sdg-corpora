CREATE TABLE acquisition_sources (
  acquisition_source_id INTEGER NOT NULL,
  source_type VARCHAR(32),
  other_details VARCHAR(32),
  enrollment_id INTEGER,
  PRIMARY KEY (acquisition_source_id),
  FOREIGN KEY (enrollment_id) REFERENCES enrollments (id)
);
