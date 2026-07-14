CREATE TABLE students (
  id INTEGER NOT NULL,
  given_name VARCHAR(32),
  chinese_name VARCHAR(32),
  birth_date DATE,
  school_name VARCHAR(32),
  enrollment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (enrollment_id) REFERENCES enrollments (id)
);
