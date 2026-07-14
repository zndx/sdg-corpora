CREATE TABLE ReformInitiativeHigherEducationInstitution (
  initiativeId INTEGER NOT NULL,
  institutionId INTEGER NOT NULL,
  PRIMARY KEY (initiativeId, institutionId),
  FOREIGN KEY (initiativeId) REFERENCES ReformInitiative (id),
  FOREIGN KEY (institutionId) REFERENCES HigherEducationInstitution (institutionId)
);
