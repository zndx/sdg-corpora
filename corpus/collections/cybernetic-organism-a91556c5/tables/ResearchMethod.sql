CREATE TABLE ResearchMethod (
  methodId INTEGER NOT NULL,
  methodName VARCHAR(33),
  methodType VARCHAR(32),
  applicationDomain VARCHAR(32),
  effectiveness VARCHAR(32),
  researchId INTEGER,
  cyberneticianId INTEGER,
  PRIMARY KEY (methodId),
  FOREIGN KEY (researchId) REFERENCES CyberneticsResearch (researchId),
  FOREIGN KEY (cyberneticianId) REFERENCES Cybernetician (cyberneticianId)
);
