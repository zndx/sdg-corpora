CREATE TABLE PatientCohort (
  cohortId INTEGER NOT NULL,
  cohortIdentifier VARCHAR(32),
  diagnosisDateRangeStart DATE,
  diagnosisDateRangeEnd DATE,
  totalEligiblePatients INTEGER,
  patientsTreatedWithinTarget INTEGER,
  compliancePercentage DECIMAL,
  typeId INTEGER,
  boardId INTEGER,
  targetId INTEGER,
  PRIMARY KEY (cohortId),
  FOREIGN KEY (typeId) REFERENCES CancerType (id),
  FOREIGN KEY (boardId) REFERENCES NHSBoard (id),
  FOREIGN KEY (targetId) REFERENCES CancerWaitingTimeTarget (targetId)
);
