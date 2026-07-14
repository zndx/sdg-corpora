CREATE TABLE qualifications (
  id INTEGER NOT NULL,
  qualification_name VARCHAR(32),
  issuing_body VARCHAR(32),
  credits_required INTEGER,
  endorsement_eligible BOOLEAN,
  course_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
