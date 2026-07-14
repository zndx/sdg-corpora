CREATE TABLE ProtectedDisclosure (
  disclosureId INTEGER NOT NULL,
  disclosureDate TIMESTAMP,
  disclosureMethod VARCHAR(32),
  isGoodFaith BOOLEAN,
  contentSummary VARCHAR(32),
  status VARCHAR(32),
  whistleblowerId INTEGER,
  conductId INTEGER,
  investigationId INTEGER,
  PRIMARY KEY (disclosureId),
  FOREIGN KEY (whistleblowerId) REFERENCES Whistleblower (whistleblowerId),
  FOREIGN KEY (conductId) REFERENCES ImproperConduct (id),
  FOREIGN KEY (investigationId) REFERENCES Investigation (investigationId)
);
