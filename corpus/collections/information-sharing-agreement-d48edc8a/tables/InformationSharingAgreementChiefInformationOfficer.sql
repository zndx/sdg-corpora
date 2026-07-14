CREATE TABLE InformationSharingAgreementChiefInformationOfficer (
  agreementId INTEGER NOT NULL,
  officerId INTEGER NOT NULL,
  PRIMARY KEY (agreementId, officerId),
  FOREIGN KEY (agreementId) REFERENCES InformationSharingAgreement (agreementId),
  FOREIGN KEY (officerId) REFERENCES ChiefInformationOfficer (officerId)
);
