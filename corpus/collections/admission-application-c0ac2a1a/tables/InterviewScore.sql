CREATE TABLE InterviewScore (
  scoreId INTEGER NOT NULL,
  appearanceAndPoliteness INTEGER,
  manner INTEGER,
  totalInterviewScore DECIMAL,
  weighting DECIMAL,
  applicationId INTEGER,
  PRIMARY KEY (scoreId),
  FOREIGN KEY (applicationId) REFERENCES AdmissionApplication (applicationId)
);
