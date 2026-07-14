CREATE TABLE LeadershipTeam (
  teamId VARCHAR(32) NOT NULL,
  teamName VARCHAR(32),
  assessmentDate TIMESTAMP,
  teamSize INTEGER,
  assessmentScore DECIMAL,
  teamStatus VARCHAR(32),
  brandId VARCHAR(32),
  assessmentId INTEGER,
  goalId INTEGER,
  PRIMARY KEY (teamId),
  FOREIGN KEY (brandId) REFERENCES Brand (brandId),
  FOREIGN KEY (assessmentId) REFERENCES TeamAssessment (id),
  FOREIGN KEY (goalId) REFERENCES BrandGoal (goalId)
);
