CREATE TABLE PartnerAgency (
  agencyId INTEGER NOT NULL,
  agencyIdentifier VARCHAR(42),
  agencyName VARCHAR(37),
  agencyType VARCHAR(32),
  jurisdictionRegion VARCHAR(33),
  contactEmail VARCHAR(32),
  unitId INTEGER,
  sharesDataWithAgencyId INTEGER,
  PRIMARY KEY (agencyId),
  FOREIGN KEY (unitId) REFERENCES IntelligenceUnit (id),
  FOREIGN KEY (sharesDataWithAgencyId) REFERENCES PartnerAgency (agencyId)
);
