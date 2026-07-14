CREATE TABLE diplomas (
  id INTEGER NOT NULL,
  diploma_id INTEGER,
  issue_date DATE,
  has_seal BOOLEAN,
  total_credits_earned DECIMAL,
  is_advanced_studies BOOLEAN,
  student_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
