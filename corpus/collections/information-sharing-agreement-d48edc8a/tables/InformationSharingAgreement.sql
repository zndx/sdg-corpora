CREATE TABLE InformationSharingAgreement (
  agreementId INTEGER NOT NULL,
  issueDate DATE,
  agreementType VARCHAR(32),
  status VARCHAR(32),
  scope VARCHAR(32),
  boardId INTEGER,
  PRIMARY KEY (agreementId),
  FOREIGN KEY (boardId) REFERENCES GovernanceBoard (id)
);
