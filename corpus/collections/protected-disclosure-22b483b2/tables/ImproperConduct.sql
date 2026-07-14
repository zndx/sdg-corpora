CREATE TABLE ImproperConduct (
  id INTEGER NOT NULL,
  conductId VARCHAR(44),
  conductType VARCHAR(32),
  description VARCHAR(32),
  occurrenceDate DATE,
  severityLevel INTEGER,
  isCriminal BOOLEAN,
  disclosureId INTEGER,
  subjectId INTEGER,
  campusId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (disclosureId) REFERENCES ProtectedDisclosure (disclosureId),
  FOREIGN KEY (subjectId) REFERENCES InvestigationSubject (subjectId),
  FOREIGN KEY (campusId) REFERENCES CollegeCampus (id)
);
