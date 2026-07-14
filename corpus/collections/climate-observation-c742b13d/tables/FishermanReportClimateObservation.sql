CREATE TABLE FishermanReportClimateObservation (
  reportId INTEGER NOT NULL,
  observationId INTEGER NOT NULL,
  PRIMARY KEY (reportId, observationId),
  FOREIGN KEY (reportId) REFERENCES FishermanReport (reportId),
  FOREIGN KEY (observationId) REFERENCES ClimateObservation (observationId)
);
