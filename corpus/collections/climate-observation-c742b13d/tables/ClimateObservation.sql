CREATE TABLE ClimateObservation (
  observationId INTEGER NOT NULL,
  recordedAt TIMESTAMP,
  variableType VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  status VARCHAR(32),
  zoneId VARCHAR(44),
  reportId INTEGER,
  PRIMARY KEY (observationId),
  FOREIGN KEY (zoneId) REFERENCES SpatialZone (zoneId),
  FOREIGN KEY (reportId) REFERENCES FishermanReport (reportId)
);
