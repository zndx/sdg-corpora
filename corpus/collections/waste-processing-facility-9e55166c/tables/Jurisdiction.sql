CREATE TABLE Jurisdiction (
  id INTEGER NOT NULL,
  jurisdictionId VARCHAR(34),
  jurisdictionName VARCHAR(32),
  jurisdictionType VARCHAR(32),
  population INTEGER,
  wasteGenerationRateTonsPerCapita DECIMAL,
  PRIMARY KEY (id)
);
