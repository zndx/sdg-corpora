CREATE TABLE research_outputs (
  id INTEGER NOT NULL,
  output_id VARCHAR(44),
  title VARCHAR(32),
  publication_date DATE,
  format VARCHAR(32),
  access_level VARCHAR(32),
  page_count INTEGER,
  research_desk_id INTEGER,
  project_manager_id INTEGER,
  research_output_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_desk_id) REFERENCES research_desks (research_desk_id),
  FOREIGN KEY (project_manager_id) REFERENCES project_managers (project_manager_id),
  FOREIGN KEY (research_output_id) REFERENCES research_outputs (id)
);
