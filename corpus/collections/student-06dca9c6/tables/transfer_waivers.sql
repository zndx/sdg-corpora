CREATE TABLE transfer_waivers (
  id INTEGER NOT NULL,
  waiver_type VARCHAR(32),
  approval_date DATE,
  approved_by VARCHAR(32),
  is_one_time_only BOOLEAN,
  student_id VARCHAR(32),
  school_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (school_id) REFERENCES schools (id)
);
