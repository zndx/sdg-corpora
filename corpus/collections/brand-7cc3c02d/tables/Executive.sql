CREATE TABLE Executive (
  executiveId INTEGER NOT NULL,
  fullName VARCHAR(36),
  jobTitle VARCHAR(32),
  department VARCHAR(32),
  tenureYears INTEGER,
  location VARCHAR(32),
  isSenior BOOLEAN,
  departmentId INTEGER,
  teamId VARCHAR(32),
  goalId INTEGER,
  reportsToExecutiveId INTEGER,
  PRIMARY KEY (executiveId),
  FOREIGN KEY (departmentId) REFERENCES Department (departmentId),
  FOREIGN KEY (teamId) REFERENCES LeadershipTeam (teamId),
  FOREIGN KEY (goalId) REFERENCES BrandGoal (goalId),
  FOREIGN KEY (reportsToExecutiveId) REFERENCES Executive (executiveId)
);
