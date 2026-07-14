CREATE TABLE Investigator (
  investigatorId VARCHAR(32) NOT NULL,
  role VARCHAR(32),
  department VARCHAR(32),
  isAuthorized BOOLEAN,
  contactEmail VARCHAR(32),
  investigationId INTEGER,
  campusId INTEGER,
  PRIMARY KEY (investigatorId),
  FOREIGN KEY (investigationId) REFERENCES Investigation (investigationId),
  FOREIGN KEY (campusId) REFERENCES CollegeCampus (id)
);
