CREATE TABLE doctoral_school_directors (
  id INTEGER NOT NULL,
  official_name VARCHAR(37),
  title VARCHAR(32),
  appointment_date DATE,
  status VARCHAR(32),
  doctoral_school_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (doctoral_school_id) REFERENCES doctoral_schools (id)
);
