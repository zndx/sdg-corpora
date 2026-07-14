CREATE TABLE PartnerAgencyIntelligenceReport (
  agencyId INTEGER NOT NULL,
  reportId INTEGER NOT NULL,
  PRIMARY KEY (agencyId, reportId),
  FOREIGN KEY (agencyId) REFERENCES PartnerAgency (agencyId),
  FOREIGN KEY (reportId) REFERENCES IntelligenceReport (id)
);
