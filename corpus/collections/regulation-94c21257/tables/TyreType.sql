CREATE TABLE TyreType (
  id INTEGER NOT NULL,
  typeCode VARCHAR(32),
  manufacturerId VARCHAR(54),
  rollingNoiseDb DECIMAL,
  widthMm INTEGER,
  profileIndex INTEGER,
  loadIndex INTEGER,
  speedRating VARCHAR(32),
  facilityId VARCHAR(44),
  authorityId INTEGER,
  protocolId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (facilityId) REFERENCES TestFacility (facilityId),
  FOREIGN KEY (authorityId) REFERENCES TypeApprovalAuthority (id),
  FOREIGN KEY (protocolId) REFERENCES TestProtocol (protocolId)
);
