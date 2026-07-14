CREATE TABLE RecognitionAuthority (
  id INTEGER NOT NULL,
  authorityName VARCHAR(32),
  legalBasis VARCHAR(32),
  jurisdiction VARCHAR(32),
  accreditationStartDate TIMESTAMP,
  unitId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (unitId) REFERENCES CourseUnit (id)
);
