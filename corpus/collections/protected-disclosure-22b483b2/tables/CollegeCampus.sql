CREATE TABLE CollegeCampus (
  id INTEGER NOT NULL,
  campusId VARCHAR(44),
  campusName VARCHAR(32),
  legalEntity VARCHAR(32),
  address VARCHAR(32),
  isActive BOOLEAN,
  investigationId INTEGER,
  investigatorId VARCHAR(32),
  whistleblowerId INTEGER,
  subjectId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (investigationId) REFERENCES Investigation (investigationId),
  FOREIGN KEY (investigatorId) REFERENCES Investigator (investigatorId),
  FOREIGN KEY (whistleblowerId) REFERENCES Whistleblower (whistleblowerId),
  FOREIGN KEY (subjectId) REFERENCES InvestigationSubject (subjectId)
);
