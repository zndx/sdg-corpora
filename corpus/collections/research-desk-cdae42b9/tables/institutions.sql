CREATE TABLE institutions (
  institution_id INTEGER NOT NULL,
  institution_code VARCHAR(32),
  institution_name VARCHAR(32),
  country VARCHAR(32),
  institution_type VARCHAR(32),
  founded_year INTEGER,
  address VARCHAR(32),
  project_manager_id INTEGER,
  academic_qualification_id INTEGER,
  research_desk_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (institution_id),
  FOREIGN KEY (project_manager_id) REFERENCES project_managers (project_manager_id),
  FOREIGN KEY (academic_qualification_id) REFERENCES academic_qualifications (id),
  FOREIGN KEY (research_desk_id) REFERENCES research_desks (research_desk_id)
);
