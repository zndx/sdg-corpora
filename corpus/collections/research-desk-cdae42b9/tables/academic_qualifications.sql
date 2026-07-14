CREATE TABLE academic_qualifications (
  id INTEGER NOT NULL,
  qualification_id VARCHAR(44),
  degree_type VARCHAR(32),
  field_of_study VARCHAR(32),
  awarding_institution VARCHAR(32),
  graduation_year INTEGER,
  distinction_level VARCHAR(32),
  project_manager_id INTEGER,
  institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (project_manager_id) REFERENCES project_managers (project_manager_id),
  FOREIGN KEY (institution_id) REFERENCES institutions (institution_id)
);
