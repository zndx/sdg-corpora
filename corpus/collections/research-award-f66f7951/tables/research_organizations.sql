CREATE TABLE research_organizations (
  research_organization_id INTEGER NOT NULL,
  organization_identifier VARCHAR(36),
  organization_name VARCHAR(32),
  founding_year INTEGER,
  headquarters_location VARCHAR(32),
  website_u_r_l VARCHAR(66),
  organization_type VARCHAR(34),
  research_award_id INTEGER,
  researcher_id INTEGER,
  research_project_id INTEGER,
  geographic_location_id INTEGER,
  PRIMARY KEY (research_organization_id),
  FOREIGN KEY (research_award_id) REFERENCES research_awards (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id),
  FOREIGN KEY (geographic_location_id) REFERENCES geographic_locations (geographic_location_id)
);
