CREATE TABLE CyberneticModification (
  id INTEGER NOT NULL,
  modificationId VARCHAR(44),
  modificationType VARCHAR(32),
  implementationDate TIMESTAMP,
  controlMechanism VARCHAR(32),
  targetFunction VARCHAR(32),
  researcherId INTEGER,
  organismId INTEGER,
  researchId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organismId) REFERENCES CyberneticOrganism (id),
  FOREIGN KEY (researchId) REFERENCES CyberneticsResearch (researchId)
);
