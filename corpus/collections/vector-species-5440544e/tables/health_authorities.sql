CREATE TABLE health_authorities (
  id INTEGER NOT NULL,
  authority_code VARCHAR(44),
  authority_name VARCHAR(32),
  authority_type VARCHAR(32),
  is_regulatory BOOLEAN,
  funding_source VARCHAR(32),
  administrative_region_id INTEGER,
  research_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (administrative_region_id) REFERENCES administrative_regions (id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (id)
);
