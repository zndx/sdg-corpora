CREATE TABLE HealthSurveyHealthIndicator (
  surveyId INTEGER NOT NULL,
  indicatorId INTEGER NOT NULL,
  PRIMARY KEY (surveyId, indicatorId),
  FOREIGN KEY (surveyId) REFERENCES HealthSurvey (id),
  FOREIGN KEY (indicatorId) REFERENCES HealthIndicator (id)
);
