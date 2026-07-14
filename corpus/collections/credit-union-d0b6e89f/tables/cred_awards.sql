CREATE TABLE cred_awards (
  id INTEGER NOT NULL,
  award_name VARCHAR(32),
  award_year INTEGER,
  presented_by VARCHAR(32),
  citation_text VARCHAR(32),
  is_lifetime_achievement BOOLEAN,
  person_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES cred_persons (id),
  FOREIGN KEY (organization_id) REFERENCES cred_organizations (organization_id)
);
