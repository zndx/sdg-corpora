CREATE TABLE BrandGoal (
  goalId INTEGER NOT NULL,
  goalDescription VARCHAR(32),
  targetYear INTEGER,
  metricType VARCHAR(32),
  targetValue DECIMAL,
  currentValue DECIMAL,
  isBenchmarked BOOLEAN,
  brandId VARCHAR(32),
  executiveId INTEGER,
  benchmarkedAgainstGoalId INTEGER,
  PRIMARY KEY (goalId),
  FOREIGN KEY (brandId) REFERENCES Brand (brandId),
  FOREIGN KEY (executiveId) REFERENCES Executive (executiveId),
  FOREIGN KEY (benchmarkedAgainstGoalId) REFERENCES BrandGoal (goalId)
);
