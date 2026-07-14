CREATE TABLE researchers (
  id INTEGER NOT NULL,
  researcher_identifier VARCHAR(32),
  full_legal_name VARCHAR(32),
  professional_title VARCHAR(32),
  military_rank VARCHAR(32),
  years_of_experience DECIMAL,
  specialization VARCHAR(32),
  research_award_id INTEGER,
  research_organization_id INTEGER,
  researcher_id INTEGER,
  research_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_award_id) REFERENCES research_awards (id),
  FOREIGN KEY (research_organization_id) REFERENCES research_organizations (research_organization_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id)
);
