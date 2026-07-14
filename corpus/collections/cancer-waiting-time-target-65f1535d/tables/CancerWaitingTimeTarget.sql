CREATE TABLE CancerWaitingTimeTarget (
  targetId INTEGER NOT NULL,
  targetIdentifier VARCHAR(32),
  effectiveDate DATE,
  tolerancePercentage DECIMAL,
  targetStatus VARCHAR(32),
  applicablePatientAgeMinimum INTEGER,
  typeId INTEGER,
  boardId INTEGER,
  PRIMARY KEY (targetId),
  FOREIGN KEY (typeId) REFERENCES CancerType (id),
  FOREIGN KEY (boardId) REFERENCES NHSBoard (id)
);
