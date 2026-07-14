CREATE TABLE research_projects (
  research_project_id INTEGER NOT NULL,
  project_identifier VARCHAR(32),
  funding_agency VARCHAR(32),
  start_date DATE,
  end_date DATE,
  project_status VARCHAR(32),
  grant_amount DECIMAL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (research_project_id)
);
