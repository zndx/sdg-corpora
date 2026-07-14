CREATE TABLE quality_assessments (
  id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_date TIMESTAMP,
  quality_score DECIMAL,
  standard_compliance BOOLEAN,
  assessor_name VARCHAR(32),
  assessment_method VARCHAR(32),
  festival_enrollment_id INTEGER,
  director_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (festival_enrollment_id) REFERENCES festival_enrollments (id),
  FOREIGN KEY (director_id) REFERENCES project_directors (director_id)
);
