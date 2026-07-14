CREATE TABLE organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  founding_year INTEGER,
  headquarters_location VARCHAR(32),
  industry_sector VARCHAR(32),
  membership_level VARCHAR(32),
  is_b_corp BOOLEAN,
  workplace_award_id INTEGER,
  employee_feedback_survey_id INTEGER,
  health_id VARCHAR(32),
  partner_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (workplace_award_id) REFERENCES workplace_awards (workplace_award_id),
  FOREIGN KEY (employee_feedback_survey_id) REFERENCES employee_feedback_surveys (employee_feedback_survey_id),
  FOREIGN KEY (health_id) REFERENCES organizational_healths (health_id),
  FOREIGN KEY (partner_organization_id) REFERENCES partner_organizations (partner_organization_id)
);
