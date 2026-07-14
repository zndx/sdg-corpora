CREATE TABLE StaffPosition (
  id INTEGER NOT NULL,
  positionId VARCHAR(44),
  title VARCHAR(32),
  department VARCHAR(32),
  supervisorTitle VARCHAR(32),
  educationRequired VARCHAR(32),
  experienceRequired VARCHAR(32),
  status VARCHAR(32),
  memberId INTEGER,
  reportsToPositionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (memberId) REFERENCES StaffMember (id),
  FOREIGN KEY (reportsToPositionId) REFERENCES StaffPosition (id)
);
