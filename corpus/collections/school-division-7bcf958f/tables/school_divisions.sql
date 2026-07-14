CREATE TABLE school_divisions (
  school_division_id INTEGER NOT NULL,
  division_id VARCHAR(32),
  division_name VARCHAR(32),
  region VARCHAR(32),
  established_date DATE,
  total_enrollment INTEGER,
  district_type VARCHAR(32),
  PRIMARY KEY (school_division_id)
);
