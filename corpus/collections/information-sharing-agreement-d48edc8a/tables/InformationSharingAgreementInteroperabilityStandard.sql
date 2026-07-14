CREATE TABLE InformationSharingAgreementInteroperabilityStandard (
  agreementId INTEGER NOT NULL,
  standardId INTEGER NOT NULL,
  PRIMARY KEY (agreementId, standardId),
  FOREIGN KEY (agreementId) REFERENCES InformationSharingAgreement (agreementId),
  FOREIGN KEY (standardId) REFERENCES InteroperabilityStandard (id)
);
