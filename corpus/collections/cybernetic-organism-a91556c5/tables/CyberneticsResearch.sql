CREATE TABLE CyberneticsResearch (
  researchId INTEGER NOT NULL,
  researchTitle VARCHAR(32),
  startDate TIMESTAMP,
  endDate TIMESTAMP,
  researchLocation VARCHAR(32),
  fundingSource VARCHAR(33),
  researchStatus VARCHAR(32),
  cyberneticianId INTEGER,
  organismId INTEGER,
  methodId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (researchId),
  FOREIGN KEY (cyberneticianId) REFERENCES Cybernetician (cyberneticianId),
  FOREIGN KEY (organismId) REFERENCES CyberneticOrganism (id),
  FOREIGN KEY (methodId) REFERENCES ResearchMethod (methodId)
);
