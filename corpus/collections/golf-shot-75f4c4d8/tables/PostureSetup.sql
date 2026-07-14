CREATE TABLE PostureSetup (
  id INTEGER NOT NULL,
  setupId VARCHAR(44),
  setupName VARCHAR(32),
  hipAngle DECIMAL,
  armPosition VARCHAR(32),
  weightDistribution VARCHAR(32),
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id)
);
