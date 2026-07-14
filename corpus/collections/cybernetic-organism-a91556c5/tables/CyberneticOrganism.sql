CREATE TABLE CyberneticOrganism (
  id INTEGER NOT NULL,
  organismId VARCHAR(44),
  organismType VARCHAR(32),
  modificationDate TIMESTAMP,
  controlSystemType VARCHAR(32),
  environmentAdaptation VARCHAR(32),
  homeostaticStatus VARCHAR(32),
  modificationId INTEGER,
  researchId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (modificationId) REFERENCES CyberneticModification (id),
  FOREIGN KEY (researchId) REFERENCES CyberneticsResearch (researchId)
);
