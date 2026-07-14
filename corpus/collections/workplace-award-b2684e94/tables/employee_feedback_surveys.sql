CREATE TABLE employee_feedback_surveys (
  employee_feedback_survey_id INTEGER NOT NULL,
  survey_id VARCHAR(44),
  administered_by VARCHAR(32),
  number_of_employees INTEGER,
  number_of_organizations INTEGER,
  measurement_aspects VARCHAR(32),
  survey_date TIMESTAMP,
  response_rate DECIMAL,
  organization_id INTEGER,
  workplace_award_id INTEGER,
  PRIMARY KEY (employee_feedback_survey_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (workplace_award_id) REFERENCES workplace_awards (workplace_award_id)
);
