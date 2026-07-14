CREATE TABLE grant_awards (
  id INTEGER NOT NULL,
  grant_amount DECIMAL,
  grant_currency VARCHAR(32),
  award_date TIMESTAMP,
  grant_program_name VARCHAR(32),
  grant_status VARCHAR(32),
  grant_reference_id INTEGER,
  community_organization_id INTEGER,
  corporate_sponsor_id INTEGER,
  sustainability_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (community_organization_id) REFERENCES community_organizations (id),
  FOREIGN KEY (corporate_sponsor_id) REFERENCES corporate_sponsors (id),
  FOREIGN KEY (sustainability_project_id) REFERENCES sustainability_projects (id)
);
