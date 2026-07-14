CREATE TABLE GeographicRegion (
  id INTEGER NOT NULL,
  regionName VARCHAR(32),
  regionCode VARCHAR(40),
  populationDensity DECIMAL,
  areaSqKm DECIMAL,
  administrativeLevel VARCHAR(32),
  surveyId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveyId) REFERENCES HealthSurvey (id)
);
