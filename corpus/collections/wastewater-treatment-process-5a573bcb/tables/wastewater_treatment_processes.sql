CREATE TABLE wastewater_treatment_processes (
  id INTEGER NOT NULL,
  process_identifier VARCHAR(32),
  process_type VARCHAR(34),
  efficiency_rating DECIMAL,
  resource_consumption_rate DECIMAL,
  status VARCHAR(32),
  target_pollutant_class VARCHAR(39),
  research_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id)
);
