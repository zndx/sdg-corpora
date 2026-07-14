CREATE TABLE SocialServiceResourceBeneficiary (
  resourceId INTEGER NOT NULL,
  beneficiaryId INTEGER NOT NULL,
  PRIMARY KEY (resourceId, beneficiaryId),
  FOREIGN KEY (resourceId) REFERENCES SocialServiceResource (id),
  FOREIGN KEY (beneficiaryId) REFERENCES Beneficiary (id)
);
