CREATE TABLE geographic_locations (
  geographic_location_id INTEGER NOT NULL,
  location_identifier VARCHAR(32),
  location_name VARCHAR(32),
  location_type VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  country VARCHAR(32),
  research_organization_id INTEGER,
  research_project_id INTEGER,
  PRIMARY KEY (geographic_location_id),
  FOREIGN KEY (research_organization_id) REFERENCES research_organizations (research_organization_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id)
);
