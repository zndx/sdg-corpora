CREATE TABLE ProgramActivity (
  activityId INTEGER NOT NULL,
  activityIdentifier VARCHAR(32),
  activityName VARCHAR(32),
  startDate TIMESTAMP,
  endDate TIMESTAMP,
  frequency VARCHAR(32),
  duration DECIMAL,
  programId INTEGER,
  PRIMARY KEY (activityId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id)
);
