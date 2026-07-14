CREATE TABLE CurrencyPeriod (
  periodId INTEGER NOT NULL,
  periodStartDate TIMESTAMP,
  periodEndDate TIMESTAMP,
  legislativeReference VARCHAR(32),
  isCurrentPeriod BOOLEAN,
  unitId INTEGER,
  authorityId INTEGER,
  PRIMARY KEY (periodId),
  FOREIGN KEY (unitId) REFERENCES CourseUnit (id),
  FOREIGN KEY (authorityId) REFERENCES RecognitionAuthority (id)
);
