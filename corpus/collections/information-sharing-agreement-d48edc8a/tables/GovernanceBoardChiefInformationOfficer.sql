CREATE TABLE GovernanceBoardChiefInformationOfficer (
  boardId INTEGER NOT NULL,
  officerId INTEGER NOT NULL,
  PRIMARY KEY (boardId, officerId),
  FOREIGN KEY (boardId) REFERENCES GovernanceBoard (id),
  FOREIGN KEY (officerId) REFERENCES ChiefInformationOfficer (officerId)
);
