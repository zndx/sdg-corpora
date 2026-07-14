CREATE TABLE AcademicProgram (
  id INTEGER NOT NULL,
  programCode VARCHAR(32),
  programName VARCHAR(32),
  standardTimeframeYears INTEGER,
  isEligibleForFederalAid BOOLEAN,
  studentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (studentId) REFERENCES Student (id)
);
