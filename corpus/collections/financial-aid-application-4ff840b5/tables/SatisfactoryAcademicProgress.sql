CREATE TABLE SatisfactoryAcademicProgress (
  id INTEGER NOT NULL,
  completionRatePercent DECIMAL,
  cumulativeGPA DECIMAL,
  maxTimeframePercent DECIMAL,
  isEligible BOOLEAN,
  studentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (studentId) REFERENCES Student (id)
);
