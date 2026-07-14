CREATE TABLE project_managers (
  project_manager_id INTEGER NOT NULL,
  manager_id VARCHAR(44),
  full_name VARCHAR(36),
  email VARCHAR(32),
  telephone VARCHAR(32),
  current_role VARCHAR(32),
  institution VARCHAR(32),
  research_desk_id INTEGER,
  institution_id INTEGER,
  academic_qualification_id INTEGER,
  PRIMARY KEY (project_manager_id),
  FOREIGN KEY (research_desk_id) REFERENCES research_desks (research_desk_id),
  FOREIGN KEY (institution_id) REFERENCES institutions (institution_id),
  FOREIGN KEY (academic_qualification_id) REFERENCES academic_qualifications (id)
);
