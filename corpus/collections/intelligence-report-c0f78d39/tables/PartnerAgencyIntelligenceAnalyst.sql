CREATE TABLE PartnerAgencyIntelligenceAnalyst (
  agencyId INTEGER NOT NULL,
  analystId INTEGER NOT NULL,
  PRIMARY KEY (agencyId, analystId),
  FOREIGN KEY (agencyId) REFERENCES PartnerAgency (agencyId),
  FOREIGN KEY (analystId) REFERENCES IntelligenceAnalyst (analystId)
);
