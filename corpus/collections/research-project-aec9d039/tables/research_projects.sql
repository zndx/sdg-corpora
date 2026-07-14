CREATE TABLE research_projects (
  id INTEGER NOT NULL,
  project_identifier VARCHAR(32),
  project_title VARCHAR(32),
  funding_agency VARCHAR(32),
  start_date DATE,
  end_date DATE,
  project_status VARCHAR(32),
  PRIMARY KEY (id)
);
