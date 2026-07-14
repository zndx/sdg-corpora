CREATE TABLE ProgramSession (
  id INTEGER NOT NULL,
  sessionIdentifier VARCHAR(32),
  programName VARCHAR(32),
  dayOfWeek VARCHAR(32),
  startTime TIMESTAMP,
  endTime TIMESTAMP,
  seasonEndDate DATE,
  isClosed BOOLEAN,
  facilityId INTEGER,
  tierId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (facilityId) REFERENCES Facility (facilityId),
  FOREIGN KEY (tierId) REFERENCES PricingTier (tierId)
);
