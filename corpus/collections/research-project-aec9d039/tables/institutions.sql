CREATE TABLE institutions (
  institution_id INTEGER NOT NULL,
  institution_name VARCHAR(32),
  country VARCHAR(32),
  institution_type VARCHAR(32),
  research_project_id INTEGER,
  PRIMARY KEY (institution_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (id)
);
