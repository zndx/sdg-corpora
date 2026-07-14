CREATE TABLE festival_enrollments (
  id INTEGER NOT NULL,
  enrollment_id VARCHAR(32),
  submission_date TIMESTAMP,
  festival_name VARCHAR(32),
  festival_start_date DATE,
  festival_end_date DATE,
  venue_name VARCHAR(32),
  venue_city VARCHAR(32),
  evaluation_outcome VARCHAR(32),
  participating_organization_id INTEGER,
  quality_assessment_id INTEGER,
  festival_stall_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (participating_organization_id) REFERENCES participating_organizations (participating_organization_id),
  FOREIGN KEY (quality_assessment_id) REFERENCES quality_assessments (id),
  FOREIGN KEY (festival_stall_id) REFERENCES festival_stalls (festival_stall_id)
);
