CREATE TABLE Restriction (
  id INTEGER NOT NULL,
  restrictionType VARCHAR(32),
  restrictionDescription VARCHAR(32),
  restrictionStartDate TIMESTAMP,
  restrictionEndDate TIMESTAMP,
  isActive BOOLEAN,
  unitId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (unitId) REFERENCES CourseUnit (id)
);
