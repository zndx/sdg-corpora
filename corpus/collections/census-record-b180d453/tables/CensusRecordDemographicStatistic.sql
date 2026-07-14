CREATE TABLE CensusRecordDemographicStatistic (
  recordId INTEGER NOT NULL,
  statisticId INTEGER NOT NULL,
  PRIMARY KEY (recordId, statisticId),
  FOREIGN KEY (recordId) REFERENCES CensusRecord (id),
  FOREIGN KEY (statisticId) REFERENCES DemographicStatistic (statisticId)
);
