CREATE TABLE Cybernetician (
  cyberneticianId INTEGER NOT NULL,
  researcherId INTEGER,
  fullName VARCHAR(36),
  institution VARCHAR(32),
  specialization VARCHAR(32),
  activePeriod VARCHAR(32),
  keyContributions VARCHAR(32),
  researchId INTEGER,
  collaboratesWithCyberneticianId INTEGER,
  PRIMARY KEY (cyberneticianId),
  FOREIGN KEY (researchId) REFERENCES CyberneticsResearch (researchId),
  FOREIGN KEY (collaboratesWithCyberneticianId) REFERENCES Cybernetician (cyberneticianId)
);
