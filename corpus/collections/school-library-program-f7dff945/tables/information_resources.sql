CREATE TABLE information_resources (
  resource_id INTEGER NOT NULL,
  title VARCHAR(32),
  format_type VARCHAR(32),
  acquisition_date DATE,
  condition_status VARCHAR(32),
  curriculum_alignment VARCHAR(32),
  access_restriction BOOLEAN,
  last_cataloged_date DATE,
  school_library_program_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (resource_id),
  FOREIGN KEY (school_library_program_id) REFERENCES school_library_programs (id)
);
