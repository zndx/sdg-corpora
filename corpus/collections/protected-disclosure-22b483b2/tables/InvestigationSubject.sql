CREATE TABLE InvestigationSubject (
  subjectId INTEGER NOT NULL,
  role VARCHAR(32),
  campusAffiliation VARCHAR(32),
  isSubjectOfRetaliation BOOLEAN,
  contactEmail VARCHAR(32),
  investigationId INTEGER,
  campusId INTEGER,
  PRIMARY KEY (subjectId),
  FOREIGN KEY (investigationId) REFERENCES Investigation (investigationId),
  FOREIGN KEY (campusId) REFERENCES CollegeCampus (id)
);
