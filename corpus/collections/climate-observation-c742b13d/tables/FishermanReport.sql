CREATE TABLE FishermanReport (
  reportId INTEGER NOT NULL,
  submissionDate DATE,
  surveyMethod VARCHAR(32),
  responseCount INTEGER,
  dataQuality VARCHAR(32),
  fishermanId INTEGER,
  zoneId VARCHAR(44),
  PRIMARY KEY (reportId),
  FOREIGN KEY (fishermanId) REFERENCES Fisherman (id),
  FOREIGN KEY (zoneId) REFERENCES SpatialZone (zoneId)
);
