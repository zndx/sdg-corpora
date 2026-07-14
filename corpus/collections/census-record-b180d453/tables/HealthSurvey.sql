CREATE TABLE HealthSurvey (
  id INTEGER NOT NULL,
  surveyName VARCHAR(32),
  surveyYear INTEGER,
  issuingBody VARCHAR(32),
  sampleSize INTEGER,
  status VARCHAR(32),
  regionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (regionId) REFERENCES GeographicRegion (id)
);
