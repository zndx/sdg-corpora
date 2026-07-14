CREATE TABLE funding_agencies (
  id INTEGER NOT NULL,
  agency_id VARCHAR(39),
  name VARCHAR(32),
  type VARCHAR(32),
  contact_info VARCHAR(32),
  research_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id)
);
