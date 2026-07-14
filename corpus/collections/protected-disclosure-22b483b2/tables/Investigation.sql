CREATE TABLE Investigation (
  investigationId INTEGER NOT NULL,
  startDate TIMESTAMP,
  endDate TIMESTAMP,
  status VARCHAR(32),
  findingsSummary VARCHAR(32),
  correctiveActionTaken BOOLEAN,
  conductId INTEGER,
  subjectId INTEGER,
  disclosureId INTEGER,
  PRIMARY KEY (investigationId),
  FOREIGN KEY (conductId) REFERENCES ImproperConduct (id),
  FOREIGN KEY (subjectId) REFERENCES InvestigationSubject (subjectId),
  FOREIGN KEY (disclosureId) REFERENCES ProtectedDisclosure (disclosureId)
);
