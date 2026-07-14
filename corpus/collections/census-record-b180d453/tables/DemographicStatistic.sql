CREATE TABLE DemographicStatistic (
  statisticId INTEGER NOT NULL,
  statisticType VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  year INTEGER,
  region VARCHAR(32),
  recordId INTEGER,
  groupId INTEGER,
  PRIMARY KEY (statisticId),
  FOREIGN KEY (recordId) REFERENCES CensusRecord (id),
  FOREIGN KEY (groupId) REFERENCES PopulationGroup (id)
);
