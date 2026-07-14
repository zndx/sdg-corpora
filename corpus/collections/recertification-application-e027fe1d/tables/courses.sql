CREATE TABLE courses (
  id INTEGER NOT NULL,
  course_id INTEGER,
  course_title VARCHAR(32),
  institution VARCHAR(32),
  course_level VARCHAR(32),
  completion_date DATE,
  applies_to_body_of_knowledge BOOLEAN,
  is_audited BOOLEAN,
  is_sponsored_by_employer VARCHAR(59),
  certified_professional_id INTEGER,
  attended_by_certified_professional_id INTEGER,
  activity_id VARCHAR(34),
  PRIMARY KEY (id),
  FOREIGN KEY (certified_professional_id) REFERENCES certified_professionals (certified_professional_id),
  FOREIGN KEY (attended_by_certified_professional_id) REFERENCES certified_professionals (certified_professional_id),
  FOREIGN KEY (activity_id) REFERENCES professional_activities (activity_id)
);
