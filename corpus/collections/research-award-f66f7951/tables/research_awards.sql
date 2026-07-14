CREATE TABLE research_awards (
  id INTEGER NOT NULL,
  award_identifier VARCHAR(32),
  award_year INTEGER,
  award_title VARCHAR(32),
  award_date TIMESTAMP,
  issuing_organization VARCHAR(33),
  researcher_id INTEGER,
  research_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (research_organization_id) REFERENCES research_organizations (research_organization_id)
);
