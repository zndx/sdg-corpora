CREATE TABLE research_desks (
  research_desk_id INTEGER NOT NULL,
  desk_identifier VARCHAR(32),
  agency_funded_by VARCHAR(36),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  response_type VARCHAR(32),
  project_manager_id INTEGER,
  development_agency_id INTEGER,
  research_output_id INTEGER,
  PRIMARY KEY (research_desk_id),
  FOREIGN KEY (project_manager_id) REFERENCES project_managers (project_manager_id),
  FOREIGN KEY (development_agency_id) REFERENCES development_agencies (id),
  FOREIGN KEY (research_output_id) REFERENCES research_outputs (id)
);
