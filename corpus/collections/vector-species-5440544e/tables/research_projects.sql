CREATE TABLE research_projects (
  id INTEGER NOT NULL,
  project_code VARCHAR(44),
  start_date DATE,
  end_date DATE,
  primary_objective VARCHAR(32),
  is_completed BOOLEAN,
  methodology_type VARCHAR(34),
  administrative_region_id INTEGER,
  health_authority_id INTEGER,
  pathogen_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (administrative_region_id) REFERENCES administrative_regions (id),
  FOREIGN KEY (health_authority_id) REFERENCES health_authorities (id),
  FOREIGN KEY (pathogen_id) REFERENCES pathogens (id)
);
