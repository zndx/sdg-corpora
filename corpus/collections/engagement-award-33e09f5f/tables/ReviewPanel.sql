CREATE TABLE ReviewPanel (
  id INTEGER NOT NULL,
  panelId INTEGER,
  panelName VARCHAR(32),
  reviewDate TIMESTAMP,
  reviewCriteria VARCHAR(32),
  panelStatus VARCHAR(32),
  memberCount INTEGER,
  awardId INTEGER,
  agencyId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (awardId) REFERENCES EngagementAward (id),
  FOREIGN KEY (agencyId) REFERENCES FundingAgency (agencyId)
);
