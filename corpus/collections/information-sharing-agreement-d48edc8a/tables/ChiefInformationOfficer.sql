CREATE TABLE ChiefInformationOfficer (
  officerId INTEGER NOT NULL,
  fullName VARCHAR(36),
  organization VARCHAR(41),
  rankOrTitle VARCHAR(51),
  appointmentDate DATE,
  boardId INTEGER,
  agreementId INTEGER,
  PRIMARY KEY (officerId),
  FOREIGN KEY (boardId) REFERENCES GovernanceBoard (id),
  FOREIGN KEY (agreementId) REFERENCES InformationSharingAgreement (agreementId)
);
