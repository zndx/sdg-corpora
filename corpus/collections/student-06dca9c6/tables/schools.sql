CREATE TABLE schools (
  id INTEGER NOT NULL,
  school_name VARCHAR(32),
  school_type VARCHAR(32),
  district VARCHAR(32),
  has_open_enrollment BOOLEAN,
  student_id VARCHAR(32),
  athletic_history_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (athletic_history_id) REFERENCES athletic_histories (athletic_history_id)
);
