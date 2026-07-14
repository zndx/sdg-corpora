CREATE TABLE colleges_schools (
  doctoral_college_id INTEGER NOT NULL,
  doctoral_school_id INTEGER NOT NULL,
  PRIMARY KEY (doctoral_college_id, doctoral_school_id),
  FOREIGN KEY (doctoral_college_id) REFERENCES doctoral_colleges (doctoral_college_id),
  FOREIGN KEY (doctoral_school_id) REFERENCES doctoral_schools (id)
);
