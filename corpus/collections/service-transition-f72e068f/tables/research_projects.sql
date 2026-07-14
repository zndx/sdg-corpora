CREATE TABLE research_projects (
  research_project_id INTEGER NOT NULL,
  project_id VARCHAR(44),
  title VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  funding_source VARCHAR(32),
  status VARCHAR(32),
  service_transition_id INTEGER,
  service_user_id INTEGER,
  carer_id INTEGER,
  funding_agency_id INTEGER,
  PRIMARY KEY (research_project_id),
  FOREIGN KEY (service_transition_id) REFERENCES service_transitions (id),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id),
  FOREIGN KEY (carer_id) REFERENCES carers (id),
  FOREIGN KEY (funding_agency_id) REFERENCES funding_agencies (id)
);
