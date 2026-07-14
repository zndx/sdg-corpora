CREATE TABLE surveys_variables (
  fishery_survey_id INTEGER NOT NULL,
  environmental_variable_id INTEGER NOT NULL,
  PRIMARY KEY (fishery_survey_id, environmental_variable_id),
  FOREIGN KEY (fishery_survey_id) REFERENCES fishery_surveys (fishery_survey_id),
  FOREIGN KEY (environmental_variable_id) REFERENCES environmental_variables (environmental_variable_id)
);
