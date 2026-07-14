CREATE TABLE TypeApprovalAuthority (
  id INTEGER NOT NULL,
  authorityId VARCHAR(35),
  authorityName VARCHAR(32),
  jurisdiction VARCHAR(32),
  witnessingPolicy VARCHAR(32),
  contactEmail VARCHAR(32),
  typeId INTEGER,
  facilityId VARCHAR(44),
  protocolId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (typeId) REFERENCES TyreType (id),
  FOREIGN KEY (facilityId) REFERENCES TestFacility (facilityId),
  FOREIGN KEY (protocolId) REFERENCES TestProtocol (protocolId)
);
