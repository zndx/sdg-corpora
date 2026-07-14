CREATE TABLE sustainability_projects (
  id INTEGER NOT NULL,
  project_name VARCHAR(32),
  project_description VARCHAR(32),
  project_status VARCHAR(32),
  start_date DATE,
  end_date DATE,
  project_location VARCHAR(32),
  facility_id INTEGER,
  community_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (facility_id) REFERENCES facilities (facility_id),
  FOREIGN KEY (community_organization_id) REFERENCES community_organizations (id)
);
