CREATE TABLE HealthIndicator (
  id INTEGER NOT NULL,
  indicatorName VARCHAR(32),
  percentage DECIMAL,
  year INTEGER,
  region VARCHAR(32),
  dataSource VARCHAR(32),
  groupId INTEGER,
  surveyId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (groupId) REFERENCES PopulationGroup (id),
  FOREIGN KEY (surveyId) REFERENCES HealthSurvey (id)
);
