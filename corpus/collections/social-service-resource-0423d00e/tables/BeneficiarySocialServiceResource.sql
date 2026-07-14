CREATE TABLE BeneficiarySocialServiceResource (
  beneficiaryId INTEGER NOT NULL,
  resourceId INTEGER NOT NULL,
  PRIMARY KEY (beneficiaryId, resourceId),
  FOREIGN KEY (beneficiaryId) REFERENCES Beneficiary (id),
  FOREIGN KEY (resourceId) REFERENCES SocialServiceResource (id)
);
