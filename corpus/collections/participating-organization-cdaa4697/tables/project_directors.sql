CREATE TABLE project_directors (
  director_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  office_location VARCHAR(32),
  office_address VARCHAR(32),
  office_city VARCHAR(32),
  office_pincode VARCHAR(32),
  quality_assessment_id INTEGER,
  festival_enrollment_id INTEGER,
  PRIMARY KEY (director_id),
  FOREIGN KEY (quality_assessment_id) REFERENCES quality_assessments (id),
  FOREIGN KEY (festival_enrollment_id) REFERENCES festival_enrollments (id)
);
