CREATE TABLE education_records (
  education_record_id INTEGER NOT NULL,
  institution_name VARCHAR(32),
  institution_address VARCHAR(32),
  institution_phone VARCHAR(32),
  years_attended DECIMAL,
  course_of_study VARCHAR(32),
  degree_or_diploma VARCHAR(32),
  education_level VARCHAR(32),
  applicant_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (education_record_id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id)
);
