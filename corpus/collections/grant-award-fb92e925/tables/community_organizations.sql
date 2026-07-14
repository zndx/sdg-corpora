CREATE TABLE community_organizations (
  id INTEGER NOT NULL,
  organization_name VARCHAR(32),
  organization_type VARCHAR(34),
  registration_number VARCHAR(32),
  founding_date DATE,
  membership_count INTEGER,
  organization_status VARCHAR(32),
  facility_id INTEGER,
  grant_award_id INTEGER,
  sustainability_project_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (facility_id) REFERENCES facilities (facility_id),
  FOREIGN KEY (grant_award_id) REFERENCES grant_awards (id),
  FOREIGN KEY (sustainability_project_id) REFERENCES sustainability_projects (id)
);
