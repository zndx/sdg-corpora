CREATE TABLE surveys_dimensions (
  employee_feedback_survey_id INTEGER NOT NULL,
  workplace_culture_dimension_id INTEGER NOT NULL,
  PRIMARY KEY (employee_feedback_survey_id, workplace_culture_dimension_id),
  FOREIGN KEY (employee_feedback_survey_id) REFERENCES employee_feedback_surveys (employee_feedback_survey_id),
  FOREIGN KEY (workplace_culture_dimension_id) REFERENCES workplace_culture_dimensions (id)
);
