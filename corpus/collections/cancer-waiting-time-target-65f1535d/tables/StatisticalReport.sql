CREATE TABLE StatisticalReport (
  reportId INTEGER NOT NULL,
  reportTitle VARCHAR(32),
  publicationDate DATE,
  reportingPeriodStart DATE,
  reportingPeriodEnd DATE,
  statisticsClassification VARCHAR(32),
  publisherName VARCHAR(32),
  cohortId INTEGER,
  boardId INTEGER,
  PRIMARY KEY (reportId),
  FOREIGN KEY (cohortId) REFERENCES PatientCohort (cohortId),
  FOREIGN KEY (boardId) REFERENCES NHSBoard (id)
);
