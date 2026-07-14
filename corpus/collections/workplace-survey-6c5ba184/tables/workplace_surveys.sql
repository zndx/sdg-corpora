CREATE TABLE workplace_surveys (
  id INTEGER NOT NULL,
  survey_id VARCHAR(44),
  administered_by VARCHAR(32),
  survey_date TIMESTAMP,
  total_employees INTEGER,
  organizational_health_score DECIMAL,
  alignment_score DECIMAL,
  execution_score DECIMAL,
  connection_score DECIMAL,
  status VARCHAR(32),
  research_firm_id INTEGER,
  organization_id INTEGER,
  workplace_award_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_firm_id) REFERENCES research_firms (research_firm_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (workplace_award_id) REFERENCES workplace_awards (workplace_award_id)
);
