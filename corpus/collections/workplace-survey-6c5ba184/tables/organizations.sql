CREATE TABLE organizations (
  organization_id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  established_year INTEGER,
  industry VARCHAR(32),
  employee_count INTEGER,
  platinum_member BOOLEAN,
  parent_org VARCHAR(32),
  acquisition_date DATE,
  workplace_survey_id INTEGER,
  workplace_award_id INTEGER,
  acquired_organization_id INTEGER,
  PRIMARY KEY (organization_id),
  FOREIGN KEY (workplace_survey_id) REFERENCES workplace_surveys (id),
  FOREIGN KEY (workplace_award_id) REFERENCES workplace_awards (workplace_award_id),
  FOREIGN KEY (acquired_organization_id) REFERENCES organizations (organization_id)
);
