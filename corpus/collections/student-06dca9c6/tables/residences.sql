CREATE TABLE residences (
  residence_id INTEGER NOT NULL,
  address VARCHAR(32),
  date_moved_in DATE,
  duration_months INTEGER,
  school_district VARCHAR(32),
  is_primary_residence BOOLEAN,
  student_id VARCHAR(32),
  guardian_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (residence_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (guardian_id) REFERENCES guardians (guardian_id)
);
