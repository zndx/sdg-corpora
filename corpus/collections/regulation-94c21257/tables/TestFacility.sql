CREATE TABLE TestFacility (
  facilityId VARCHAR(44) NOT NULL,
  facilityName VARCHAR(32),
  location VARCHAR(32),
  certificationStatus VARCHAR(32),
  ownerType VARCHAR(32),
  protocolId INTEGER,
  authorityId INTEGER,
  PRIMARY KEY (facilityId),
  FOREIGN KEY (protocolId) REFERENCES TestProtocol (protocolId),
  FOREIGN KEY (authorityId) REFERENCES TypeApprovalAuthority (id)
);
