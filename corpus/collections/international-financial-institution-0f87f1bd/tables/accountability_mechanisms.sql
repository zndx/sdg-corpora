CREATE TABLE accountability_mechanisms (
  id INTEGER NOT NULL,
  mechanism_id VARCHAR(32),
  mechanism_name VARCHAR(32),
  establishment_year INTEGER,
  independence_level VARCHAR(32),
  scope_of_authority VARCHAR(32),
  current_status VARCHAR(32),
  international_financial_institution_id INTEGER,
  development_project_id INTEGER,
  affected_community_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (international_financial_institution_id) REFERENCES international_financial_institutions (id),
  FOREIGN KEY (development_project_id) REFERENCES development_projects (id),
  FOREIGN KEY (affected_community_id) REFERENCES affected_communities (affected_community_id)
);
