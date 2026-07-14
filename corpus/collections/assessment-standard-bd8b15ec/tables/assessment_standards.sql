CREATE TABLE assessment_standards (
  id INTEGER NOT NULL,
  standard_number VARCHAR(32),
  version INTEGER,
  level INTEGER,
  credits INTEGER,
  literacy_or_numeracy_requirement VARCHAR(32),
  full_title VARCHAR(32),
  method_of_assessment VARCHAR(32),
  assessment_opportunities_offered INTEGER,
  course_id INTEGER,
  assessment_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id),
  FOREIGN KEY (assessment_event_id) REFERENCES assessment_events (id)
);
