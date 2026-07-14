CREATE TABLE ActivityEvidence (
  evidenceId INTEGER NOT NULL,
  activityName VARCHAR(32),
  activityType VARCHAR(32),
  achievementLevel VARCHAR(32),
  awardedScore INTEGER,
  isTopFive BOOLEAN,
  applicationId INTEGER,
  PRIMARY KEY (evidenceId),
  FOREIGN KEY (applicationId) REFERENCES AdmissionApplication (applicationId)
);
