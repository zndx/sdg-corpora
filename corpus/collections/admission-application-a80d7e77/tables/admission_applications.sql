CREATE TABLE admission_applications (
  id INTEGER NOT NULL,
  application_id VARCHAR(32),
  application_date DATE,
  status VARCHAR(32),
  academic_year VARCHAR(32),
  reference_number VARCHAR(32),
  child_id INTEGER,
  school_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (child_id) REFERENCES childs (id),
  FOREIGN KEY (school_id) REFERENCES schools (school_id)
);
