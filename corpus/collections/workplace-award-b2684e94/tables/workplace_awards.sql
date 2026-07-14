CREATE TABLE workplace_awards (
  workplace_award_id INTEGER NOT NULL,
  award_id VARCHAR(44),
  award_year INTEGER,
  rank INTEGER,
  category VARCHAR(32),
  issuing_organization VARCHAR(33),
  survey_methodology VARCHAR(32),
  is_repeat_winner BOOLEAN,
  organization_id INTEGER,
  employee_feedback_survey_id INTEGER,
  PRIMARY KEY (workplace_award_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (employee_feedback_survey_id) REFERENCES employee_feedback_surveys (employee_feedback_survey_id)
);
