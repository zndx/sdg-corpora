CREATE TABLE school_campuses (
  school_campus_id INTEGER NOT NULL,
  campus_name VARCHAR(32),
  campus_code INTEGER,
  campus_type VARCHAR(32),
  district VARCHAR(32),
  academic_year VARCHAR(32),
  district_id INTEGER,
  PRIMARY KEY (school_campus_id),
  FOREIGN KEY (district_id) REFERENCES districts (district_id)
);
