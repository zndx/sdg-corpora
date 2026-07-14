CREATE TABLE assessment_events (
  id INTEGER NOT NULL,
  event_date DATE,
  method VARCHAR(32),
  status VARCHAR(32),
  opportunity_number INTEGER,
  assessment_standard_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (assessment_standard_id) REFERENCES assessment_standards (id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
