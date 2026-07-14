CREATE TABLE workplace_awards (
  workplace_award_id INTEGER NOT NULL,
  award_id VARCHAR(44),
  award_name VARCHAR(32),
  award_year INTEGER,
  rank INTEGER,
  issuing_body VARCHAR(32),
  criteria_met BOOLEAN,
  award_description VARCHAR(32),
  organization_id INTEGER,
  workplace_survey_id INTEGER,
  media_partner_id INTEGER,
  PRIMARY KEY (workplace_award_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (workplace_survey_id) REFERENCES workplace_surveys (id),
  FOREIGN KEY (media_partner_id) REFERENCES media_partners (id)
);
