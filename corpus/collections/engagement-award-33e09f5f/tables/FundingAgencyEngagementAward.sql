CREATE TABLE FundingAgencyEngagementAward (
  agencyId INTEGER NOT NULL,
  awardId INTEGER NOT NULL,
  PRIMARY KEY (agencyId, awardId),
  FOREIGN KEY (agencyId) REFERENCES FundingAgency (agencyId),
  FOREIGN KEY (awardId) REFERENCES EngagementAward (id)
);
