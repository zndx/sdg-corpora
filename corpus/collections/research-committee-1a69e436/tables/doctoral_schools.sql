CREATE TABLE doctoral_schools (
  id INTEGER NOT NULL,
  school_id INTEGER,
  name VARCHAR(34),
  code VARCHAR(34),
  established_date DATE,
  status VARCHAR(32),
  doctoral_school_director_id INTEGER,
  doctoral_college_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (doctoral_school_director_id) REFERENCES doctoral_school_directors (id),
  FOREIGN KEY (doctoral_college_id) REFERENCES doctoral_colleges (doctoral_college_id)
);
